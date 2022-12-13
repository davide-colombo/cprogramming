
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
//	int *n0_0i = &ia[0][0];				// 1st row, 1st col
//	int *n0_4f = &ia[0][4];				// 1st row, 4th col
//	int *n0_8i = &ia[0][8];				// 1st row, 8th col
//	int *n0_12f = &ia[0][12];			// 1st row, 12th col
//	int *n4_0i = &ia[4][0];				// 4th row, 1st col
//	int *n4_4f = &ia[4][4];				// 4th row, 4st col
//	int *n4_8i = &ia[4][8];				// 4th row, 8st col
//	int *n4_12f = &ia[4][12];			// 4th row, 12st col

	/*
	 * Efficiently compute the division by k = 4 + s = 4 by shifting right N 
	 * by log2(k+s) = 4 positions.
	 */
	int unrolled_iterations = (NCOLS >> 4);

	/*
	 * Since k = 4 is a Marsenne number it's possible to compute the remainder 
	 * of the division by 4 by computing: N & (4-1).
	 */
	int residual_iterations = (NCOLS & 15);

	/*
	 * Implementing the same technique on the rows.
	 *
	 * Multiply by k = 2 * s = 2
	 *
	 * k = 2 because 2 rows at a time are filled in PARALLEL
	 * s = 2 because at every iteration the rows are shifted towards by 2
	 */
	int unrolled_rowiter = (NROWS >> 3);
	int residual_rowiter = (NROWS & 7);

	/*
	 * Counter that keeps track of the number of iterations on the rows
	 */
	int row = 0;
	do{
		do{
// ========================== COLUMNS =======================================
			int *n0_0i = &ia[row][0];				// 1st row, 1st col
			int *n0_4f = &ia[row][4];				// 1st row, 4th col
			int *n0_8i = &ia[row][8];				// 1st row, 8th col
			int *n0_12f = &ia[row][12];			// 1st row, 12th col
			int *n4_0i = &ia[row][0];				// 4th row, 1st col
			int *n4_4f = &ia[row][4];				// 4th row, 4st col
			int *n4_8i = &ia[row][8];				// 4th row, 8st col
			int *n4_12f = &ia[row][12];			// 4th row, 12st col

			int itercol = unrolled_iterations;
			int col = 0;
			do{
				/*
				 * Shift columns by the shift factor s = 4
				 */
				do{
					/*
					 * 0th row in the matrix
					 * Exploit both cache locality, out-of-order execution, 
					 * pipelining and different execution units (int + float).
					 */
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					/*
					 * 4th row in the matrix
					 */
					n4_0i[col] = 1;
					n4_4f[col] = 1;
					n4_8i[col] = 1;
					n4_12f[col] = 1;

					/*
					 * Move by 1 item to the right on the row
					 */
					col += 1;
				}while( (col & 3) != 0 );
				col += 12;
				itercol -= 1;
			}while(itercol); // col, unrolled iterations

			/*
			 * Residual iterations on a single matrix line
			 */
			if(residual_iterations){
				itercol = residual_iterations;
				do{
					/*
					 * 0th row in the matrix
					 */
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					/*
					 * 4th row in the matrix
					 */
					n4_0i[col] = 1;
					n4_4f[col] = 1;
					n4_8i[col] = 1;
					n4_12f[col] = 1;
					col += 1;
					itercol -= 1;
				}while(itercol); // col, residual iterations
			} // if, itercol
// ========================== END COLUMNS ===================================

			/*
			 * Move down 1 row
			 */
			row += 1;
		}while( (row & 3) != 0 ); // check if row is a multiple of s = 4

		/*
		 * Move down 4 rows
		 */
		row += 4;
		unrolled_rowiter -= 1;
	}while(unrolled_rowiter); // row, unrolled iterations

	/*
	 * TODO: residual iterations on the rows!!
	 */
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