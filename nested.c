
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
 * Optimized version
 */
void _loop_rowise_optim(int (*ia32)[NCOLS]) {

	int unrolled_rowiter = (NROWS >> 3);
	int row = 0;
	do{
		do{
			int (*row0)[NCOLS] = &ia32[row];
			int *n0_0i = &row0[0][0];				// 1st row, 1st col
			int *n0_4f = &row0[0][4];				// 1st row, 4th col
			int *n0_8i = &row0[0][8];				// 1st row, 8th col
			int *n0_12f = &row0[0][12];			// 1st row, 12th col
			int (*row4)[NCOLS] = &row0[4];
			int *n4_0i = &row4[0][0];			// 4th row, 1st col
			int *n4_4f = &row4[0][4];			// 4th row, 4st col
			int *n4_8i = &row4[0][8];			// 4th row, 8st col
			int *n4_12f = &row4[0][12];			// 4th row, 12st col

			int unrolled_coliter = (NCOLS >> 4);
			int col = 0;
			do{ // unrolled coliter
				do{ // shifted coliter
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
				unrolled_coliter -= 1;
			}while(unrolled_coliter);

			/*
			 * Residual coliter
			 */
			if( (NCOLS & 15) != 0 ){
				int residual_coliter = (NCOLS & 15);
				do{ // residual coliter
					/*
					 * IMPORTANT: keep rows in parallel but DO NOT USE the 
					 * variables for accessing the columns other than the one 
					 * starting at index 0.
					 */
					n0_0i[col] = 1;
					n4_0i[col] = 1;
					col += 1;
					residual_coliter -= 1;
				}while(residual_coliter);
			} // if ncols multiple of 16

			row += 1;
		}while( (row & 3) != 0 );
		row += 4;
		unrolled_rowiter -= 1;
	}while(unrolled_rowiter);

	/*
	 * Residual iterations on the rows
	 */
	if( (NROWS & 7) != 0 ){
		int residual_rowiter = (NROWS & 7);
		do{ // residual_rowiter
			int unrolled_coliter = (NCOLS >> 4);

			int *n0_0i = &ia32[row][0];				// 1st row, 1st col
			int *n0_4f = &ia32[row][4];				// 1st row, 4th col
			int *n0_8i = &ia32[row][8];				// 1st row, 8th col
			int *n0_12f = &ia32[row][12];			// 1st row, 12th col

			int col = 0;
			do{ // unrolled coliter
				do{ // shifted coliter
					n0_0i[col] = 1;
					n0_4f[col] = 1;
					n0_8i[col] = 1;
					n0_12f[col] = 1;

					col += 1;
				}while( (col & 3) != 0 );
				col += 12;
				unrolled_coliter -= 1;
			}while(unrolled_coliter);

			/*
			 * Residual iterations on columns
			 */
			if( (NCOLS & 15) != 0 ){
				int residual_coliter = (NCOLS & 15);
				do{ // residual coliter
					/*
					 * IMPORTANT: only the rows corresponding to the lowest 
					 * index must be used to access memory in this cycle!
					 */
					n0_0i[col] = 1;
					col += 1;
					residual_coliter -= 1;
				}while(residual_coliter);
			} // if
			row += 1;
			residual_rowiter -= 1;
		}while(residual_rowiter);
	}
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