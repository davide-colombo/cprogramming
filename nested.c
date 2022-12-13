
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

void _loop_rowise_optim(int (*ia32)[NCOLS]) {
	int unrolled_iterations = (NCOLS >> 4);
	int residual_iterations = (NCOLS & 15);

	int unrolled_rowiter = (NROWS >> 3);
	int residual_rowiter = (NROWS & 7);

	int row = 0;
	do{
		do{
			int *n0_0i = &ia32[row][0];				// 1st row, 1st col
			int *n0_4f = &ia32[row][4];				// 1st row, 4th col
			int *n0_8i = &ia32[row][8];				// 1st row, 1st col
			int *n0_12f = &ia32[row][12];				// 1st row, 4th col

			int *n4_0i = &ia32[row+4][0];				// 4th row, 1st col
			int *n4_4f = &ia32[row+4][4];				// 4th row, 4st col
			int *n4_8i = &ia32[row+4][8];				// 1st row, 1st col
			int *n4_12f = &ia32[row+4][12];				// 1st row, 4th col

			int itercol = unrolled_iterations;
			int col = 0;
			do{
				do{
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					n4_0i[col] = 1;
					n4_4f[col] = 1;
					n4_8i[col] = 1;
					n4_12f[col] = 1;

					col += 1;
				}while( (col & 3) != 0 );
				col += 12;
				itercol -= 1;
			}while(itercol); // col, unrolled iterations

			if(residual_iterations){
				itercol = residual_iterations;
				do{
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					n4_0i[col] = 1;
					n4_4f[col] = 1;
					n4_8i[col] = 1;
					n4_12f[col] = 1;
					col += 1;
					itercol -= 1;
				}while(itercol); // col, residual iterations
			} // if, itercol
			row += 1;
		}while( (row & 3) != 0 );

		row += 4;
		unrolled_rowiter -= 1;
	}while(unrolled_rowiter); // row, unrolled iterations

	if(residual_rowiter){
		do{
			int *n0_0i = &ia32[row][0];				// 1st row, 1st col
			int *n0_4f = &ia32[row][4];				// 1st row, 4th col
			int *n0_8i = &ia32[row][8];				// 1st row, 1st col
			int *n0_12f = &ia32[row][12];				// 1st row, 4th col

			int *n4_0i = &ia32[row+4][0];				// 4th row, 1st col
			int *n4_4f = &ia32[row+4][4];				// 4th row, 4st col
			int *n4_8i = &ia32[row+4][8];				// 1st row, 1st col
			int *n4_12f = &ia32[row+4][12];				// 1st row, 4th col

			int itercol = unrolled_iterations;
			int col = 0;
			do{
				do{
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					n4_0i[col] = 1;
					n4_4f[col] = 1;
					n4_8i[col] = 1;
					n4_12f[col] = 1;

					col += 1;
				}while( (col & 3) != 0 );
				col += 12;
				itercol -= 1;
			}while(itercol); // col, unrolled iterations

			if(residual_iterations){
				itercol = residual_iterations;
				do{
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					n4_0i[col] = 1;
					n4_4f[col] = 1;
					n4_8i[col] = 1;
					n4_12f[col] = 1;
					col += 1;
					itercol -= 1;
				}while(itercol); // col, residual iterations
			} // if, itercol
			row += 1;
			residual_rowiter -= 1;
		}while(residual_rowiter); // row, unrolled iterations

	} // row, residual iterations

} // end function


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
	_loop_rowise_optim(&ia[0]);
	//_loop_rowise_baseline();
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