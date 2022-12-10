
#include <stdio.h>
#include <time.h>

/*
 * Nested for loop optimization
 */
#define NROWS 10000
#define NCOLS 10000

#define CACHE_LINE_SIZE 128
/*
 * The division does not need to be converted because the size of an integer 
 * is a multiple of 2.
 */
#define SM ( CACHE_LINE_SIZE / sizeof(int) )

int ia[NROWS][NCOLS];

/*
 * 1 - declare INDUCTION VARIABLES outside the for loop.
 * 2 - since `ia` is a statically allocated GLOBAL array, it means that every 
 *   time the memory page associated to the variable must be loaded.
 * 3 - split the problem into subproblems to increase cache locality.
 * 4 - unroll the inner loop; try to reduce the number of iterations (i.e., 
 *   the number of times the condition is evaluated).
 * 5 - try to increased parallelism with software pipelining.
 */

/*
 * Pass `ia` as argument instead of addressing it inside here.
 *
 * If the array if very large, it requires to load multiple memory pages and 
 * this may slow down the performance of the function.
 *
 * TODO: divide the matrix in chunks that fits a memory page.
 *
 * It may be even better to use multiple threads that can process data in 
 * parallel or vector instructions.
 */
void _loop_rowise_optim() {
	/*
	 * Initialize in bulk here to reduce the amount of times the memory 
	 * address of the `ia` variable needs to be loaded.
	 */
	int *row0ptr = &ia[0][0];				// 8 bytes
	int *row1ptr = &ia[4][0];				// 8 bytes
	int *row2ptr = &ia[8][0];				// 8 bytes
	int *row3ptr = &ia[12][0];				// 8 bytes
	int *col0ptr = &ia[0][0];				// 8 bytes
	int *col1ptr = &ia[0][4];				// 8 bytes
	int *col2ptr = &ia[0][8];				// 8 bytes
	int *col3ptr = &ia[0][12];				// 8 bytes

	/*
	 * Unrolling the loop with factor k = 4
	 */
	int row, _col2;
	int col, col2;

	/*
	 * Efficiently compute the division by k = 4 + s = 4 by shifting right N 
	 * by log2(k+s) = 4 positions.
	 */
	int unrolled_iterations = NCOLS >> 4;

	/*
	 * Since k = 4 is a Marsenne number it's possible to compute the remainder 
	 * of the division by 4 by computing: N & (4-1).
	 */
	int residual_iterations = NCOLS & 15;

	/*
	 * Explanation:
	 *
	 * a - (a&b)
	 *
	 * Suppose c = a&b
	 *
	 * `a - b` can be written using the XOR operator.
	 *
	 * a - b = ~(a^b) + 1
	 *
	 * The difference between a and b is equal to the TWO'S COMPLEMENT of a 
	 * and b.
	 *
	 * In this particular case:
	 * 		a - (a&b)
	 * is equal to:
	 * 		a & (~b)
	 *
	 */
	int residual_start = NCOLS - residual_iterations;

	/*
	 * Cycle on the rows
	 *
	 * TODO: change unrolled iterations
	 */
	for(row = 0; row < NROWS; ++row){
		/*
		 * Increase by 16 because the variables are shifted by 4 items one 
		 * another, so the total coverage in one pass is k = 4 times s = 4 where s 
		 * is equal to the shift of the 4 variables.
		 */
		for(col = 0; col < NCOLS; col+=16){
			/*
			 * Loop performs k = 4 iterations
			 */
			col2 = col;
			_col2 = 0;
			while(1) {
			//for(_col2 = 0, col2 = col; _col2 < 4 ; ++col2, ++_col2) {
				col0ptr[col2] = 1;
				col1ptr[col2] = 1;
				col2ptr[col2] = 1;
				col3ptr[col2] = 1;
				if( ((++_col2)^4) == 0 ){
					break;
				}
				++col2;
			} // col2
		} // col, unrolled iterations
	
		/*
		 * Residual iterations on a single matrix line
		 */
		for(col = residual_start; col < NCOLS; ++col){
			col0ptr[col] = 1;
			col1ptr[col] = 1;
			col2ptr[col] = 1;
			col3ptr[col] = 1;
		} // col, residual iterations

		/*
		 * Move the 4 pointers down a row completely.
		 */
		col0ptr+=NROWS;
		col1ptr+=NROWS;
		col2ptr+=NROWS;
		col3ptr+=NROWS;
	} // row, unrolled iterations

}





void _loop_colwise() {
	int i, j;
	for(j = 0; j < NROWS; j++) {
		for(i = 0; i < NCOLS; i++) {
			ia[i][j] = 1;
		}
	}
}


void _loop_rowise_baseline(){
	int i, j;
	for(j = 0; j < NROWS; j++) {
		for(i = 0; i < NCOLS; i++) {
			ia[j][i] = 1;
		}
	}
}



int main(int argc, char **argv) {
	clock_t start, end;
	start = clock();
	_loop_rowise_optim();
	end = clock();
	double elapsed = (end - start) / (double) CLOCKS_PER_SEC;
	printf("Elapsed = %.20lf\n", elapsed);
/*
	int *ptr = &ia[0][0];
	for(int i = 0; i < NROWS; i++) {
		printf("ia[%d][...] = ", i);
		for(int j = 0; j < NCOLS; j++) {
			printf("%d ", *(ptr+i+j));
		}
		printf("\n");
	}
*/
	return 0;
}