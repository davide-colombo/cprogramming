
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
	int *row0 = &ia32[0][0];

	/*
	 * Take the address of the fourth row (shift factor on the rows is 4).
	 */
	int *row4 = &ia32[4][0];

	int unrolled_rowiter = (NROWS >> 3);
	int row = 0;
	do{ // unrolled rowiter
		do{ // shifted rowiter

			int unrolled_coliter = (NCOLS >> 4);
			int col0 = 0;
			int col4 = 4;
			int col8 = 8;
			int col12 = 12;
			do{ // unrolled coliter
				do{ // shifted coliter
					row0[col12] = 1;
					row4[col12] = 1;
					col12 += 1;

					row0[col8] = 1;
					row4[col8] = 1;
					col8 += 1;

					row0[col4] = 1;
					row4[col4] = 1;
					col4 += 1;

					row0[col0] = 1;
					row4[col0] = 1;
					col0 += 1;
				}while( (col0 & 3) != 0 );
				col0 += 12;
				col4 += 12;
				col8 += 12;
				col12 += 12;
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
					row0[col0] = 1;
					row4[col0] = 1;
					col0 += 1;
					residual_coliter -= 1;
				}while(residual_coliter);
			} // if ncols multiple of 16

			row += 1;
			row0 += NCOLS;
			row4 += NCOLS;
		}while( (row & 3) != 0 );
		row += 4;
		row0 += (NCOLS << 2);
		row4 += (NCOLS << 2);
		unrolled_rowiter -= 1;
	}while(unrolled_rowiter);

	/*
	 * Residual iterations on the rows
	 */
	if( (NROWS & 7) != 0 ){
		int residual_rowiter = (NROWS & 7);
		do{ // residual_rowiter
			int unrolled_coliter = (NCOLS >> 4);
			int col0 = 0;
			int col4 = 4;
			int col8 = 8;
			int col12 = 12;
			do{ // unrolled coliter
				do{ // shifted coliter
					row0[col0] = 1;
					col0 += 1;

					row0[col4] = 1;
					col4 += 1;

					row0[col8] = 1;
					col8 += 1;

					row0[col12] = 1;
					col12 += 1;
				}while( (col0 & 3) != 0 );
				col0 += 12;
				col4 += 12;
				col8 += 12;
				col12 += 12;
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
					row0[col0] = 1;
					col0 += 1;
					residual_coliter -= 1;
				}while(residual_coliter);
			} // if
			row += 1;
			row0 += NCOLS;
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