
#include <stdio.h>
#include <stdint.h>
#include <time.h>

/*
 * Nested for loop optimization
 */
#define NROWS 10000
#define NCOLS 10000

/*
 * Each cache line is 128 bytes on this machine
 */
#define CACHE_LINE_SIZE 128

/*
 * In every cache line there is room for 32 integers each one of 4 bytes
 */
#define CACHE_LINE_ELEMS 32

/*
 * Divide by 32 to get the number of cache lines needed to store `n` values
 */
#define CACHE_LINE_FULLS(n) ( (n) >> 5 )

/*
 * Remainder of the division to get the number of items (NOT THE NUMBER OF 
 * CACHE LINES) remaining. This implies using an extra cache line.
 */
#define CACHE_LINE_RES(n) ( (n) & 31 )

int32_t ia[NROWS][NCOLS];

/*
 * Optimized version
 */
void _loop_rowise_optim(int32_t (*ia32)[NCOLS]) {
	int32_t cache_lines_full_per_row = CACHE_LINE_FULLS(NCOLS);
	int32_t cache_lines_full_per_col = CACHE_LINE_FULLS(NROWS);
	int32_t extra_items_per_row = CACHE_LINE_RES(NCOLS);
	int32_t extra_items_per_col = CACHE_LINE_RES(NROWS);

	printf("lpr = %d\n", cache_lines_full_per_row);
	printf("lpc = %d\n", cache_lines_full_per_col);
	printf("er = %d\n", extra_items_per_row);
	printf("ec = %d\n", extra_items_per_col);

//	int unrolled_rowiter = (NROWS >> 3);
//	int row = 0;
//	do{ // unrolled rowiter
//		do{
//			int *n0_0i = &ia32[row][0];
//			int *n0_4f = &ia32[row][4];
//			int *n0_8i = &ia32[row][8];
//			int *n0_12f = &ia32[row][12];
//
//			int *n4_0i = &ia32[row+4][0];
//			int *n4_4f = &ia32[row+4][4];
//			int *n4_8i = &ia32[row+4][8];
//			int *n4_12f = &ia32[row+4][12];
//
//			int unrolled_coliter = (NCOLS >> 4);
//			int col = 0;
//			do{ // unrolled coliter
//				do{ // shifted coliter
//					n0_0i[col] = 1;
//					n0_4f[col] = 1;
//					n0_8i[col] = 1;
//					n0_12f[col] = 1;
//
//					n4_0i[col] = 1;
//					n4_4f[col] = 1;
//					n4_8i[col] = 1;
//					n4_12f[col] = 1;
//
//					col += 1;
//				}while( (col & 3) != 0 );
//				col += 12;
//				unrolled_coliter -= 1;
//			}while(unrolled_coliter);
//
//			/*
//			 * Residual coliter
//			 */
//			if( (NCOLS & 15) != 0 ){
//				int residual_coliter = (NCOLS & 15);
//				do{ // residual coliter
//					/*
//					 * IMPORTANT: keep rows in parallel but DO NOT USE the 
//					 * variables for accessing the columns other than the one 
//					 * starting at index 0.
//					 */
//					n0_0i[col] = 1;
//					n4_0i[col] = 1;
//					col += 1;
//					residual_coliter -= 1;
//				}while(residual_coliter);
//			} // if ncols multiple of 16
//
//			row += 1;
//		}while( (row & 3) != 0 );
//		row += 4;
//		unrolled_rowiter -= 1;
//	}while(unrolled_rowiter);
//
//	/*
//	 * Residual iterations on the rows
//	 */
//	if( (NROWS & 7) != 0 ){
//		int residual_rowiter = (NROWS & 7);
//		do{ // residual_rowiter
//			int *n0_0i = &ia32[row][0];
//			int *n0_4f = &ia32[row][4];
//			int *n0_8i = &ia32[row][8];
//			int *n0_12f = &ia32[row][12];
//
//			int unrolled_coliter = (NCOLS >> 4);
//			int col = 0;
//			do{ // unrolled coliter
//				do{ // shifted coliter
//					n0_0i[col] = 1;
//					n0_4f[col] = 1;
//					n0_8i[col] = 1;
//					n0_12f[col] = 1;
//					col += 1;
//				}while( (col & 3) != 0 );
//				col += 12;
//				unrolled_coliter -= 1;
//			}while(unrolled_coliter);
//
//			/*
//			 * Residual iterations on columns
//			 */
//			if( (NCOLS & 15) != 0 ){
//				int residual_coliter = (NCOLS & 15);
//				do{ // residual coliter
//					/*
//					 * IMPORTANT: only the rows corresponding to the lowest 
//					 * index must be used to access memory in this cycle!
//					 */
//					n0_0i[col] = 1;
//					col += 1;
//					residual_coliter -= 1;
//				}while(residual_coliter);
//			} // if
//			row += 1;
//			residual_rowiter -= 1;
//		}while(residual_rowiter);
//	}
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