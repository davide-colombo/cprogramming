
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
	/*
	 * Take the address of the 0th row (shift factor on the columns is 4).
	 */
	int *n0_0i = &ia32[0][0];
	int *n0_4f = &ia32[0][4];
	int *n0_8i = &ia32[0][8];
	int *n0_12f = &ia32[0][12];
	/*
	 * Take the address of the fourth row (shift factor on the rows is 4).
	 */
	int *n4_0i = &ia32[4][0];
	int *n4_4f = &ia32[4][4];
	int *n4_8i = &ia32[4][8];
	int *n4_12f = &ia32[4][12];

	int unrolled_rowiter = (NROWS >> 3);
	int row = 0;
	do{ // unrolled rowiter
		do{ // shifted rowiter

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
			n0_0i += NCOLS;
			n0_4f += NCOLS;
			n0_8i += NCOLS;
			n0_12f += NCOLS;

			n4_0i += NCOLS;
			n4_4f += NCOLS;
			n4_8i += NCOLS;
			n4_12f += NCOLS;
		}while( (row & 3) != 0 );
		row += 4;
		n0_0i += (NCOLS << 2);
		n0_4f += (NCOLS << 2);
		n0_8i += (NCOLS << 2);
		n0_12f += (NCOLS << 2);

		n4_0i += (NCOLS << 2);
		n4_4f += (NCOLS << 2);
		n4_8i += (NCOLS << 2);
		n4_12f += (NCOLS << 2);

		unrolled_rowiter -= 1;
	}while(unrolled_rowiter);

	/*
	 * Residual iterations on the rows
	 */
	if( (NROWS & 7) != 0 ){
		int residual_rowiter = (NROWS & 7);
		do{ // residual_rowiter
			int unrolled_coliter = (NCOLS >> 4);
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
			n0_0i += NCOLS;
			n0_4f += NCOLS;
			n0_8i += NCOLS;
			n0_12f += NCOLS;
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