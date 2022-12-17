/*
 * Consider the layout of the data in memory.
 *
 * A matrix is still an array of NROWS * NCOLS items layed out sequentially in 
 * memory.
 *
 * If each item is of size S, the total memory occupied by the matrix is:
 *
 * 		NROWS * NCOLS * S
 *
 * To maximize the performance the program needs to minimize the number of 
 * transaction with a high cost and rely on those transactions that are 
 * cheaper.
 *
 * Costly transactions are load and store from the main memory.
 * Cheaper transactions are load and store from the cache.
 *
 * If the program is capable to maximize the number of accesses to the data in 
 * cache by keeping the same number of operations (ideally the minimum number 
 * of operations required to transform the information encoded by the data 
 * structure) the program's efficiency will significantly increase.
 *
 * Suppose a cache line is C bytes.
 *
 * Suppose the cache size is K bytes.
 *
 * Suppose the cache has an associativity equal to W (no unit, just a number).
 *
 * Given the above specification it's possible to compute the number of cache 
 * sets T for this particular cache:
 *
 * 		T = K / (C * W)
 *
 * For example, a cache of K = 64KB with a cache line size C = 128B and W = 8 
 * has a T = 64 cache sets.
 *
 * The problem with cache associativity will arise for data which memory 
 * address is a multiple of:
 *
 * 		T * C * A
 *
 * Where A is the instruction size (e.g., 4 bytes on ARM).
 *
 * For the above cache specifications, data stored at a multiple of 2^15 will 
 * race for the same cache set.
 *
 * Back to the matrix problem.
 *
 * Give the number of bytes of the matrix computed as:
 *
 * 		NROWS * NCOLS * S
 *
 * And given the cache line size equal to C, we can compute the number of 
 * cache lines needed to store the entire matrix in cache.
 *
 * For example, if NROWS = NCOLS = 32 and S = 4bytes, the matrix occupies a 
 * total of 2^12 bytes (4Kb, 4096bytes).
 *
 * If a single cache line is C = 128 bytes, it's necessary to use 2^5 = 32 
 * full cache lines to store the matrix in the cache.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <time.h>

#define NROWS 10000
#define NCOLS 10000

/*
 * Each cache line is 128 bytes on this machine
 */
#define CACHE_LINE_SIZE 128

/*
 * In every cache line there is room for 32 signed 32-bit integers
 */
#define CACHE_LINE_ELEMS 32

/*
 * Divide by 32 to get the number of cache lines needed to store `n` values
 */
#define CACHE_LINE_FULLS(n) ( (n) >> 5 )

/*
 * Remainder of the division is the number of items (NOT THE NUMBER OF CACHE 
 * LINES) remaining. This implies using an extra cache line.
 */
#define CACHE_LINE_RES(n) ( (n) & 31 )

/*
 * The type interface for the definition of the array type.
 */
typedef int32_t item_t;

void _loop_cache_line_analysis(size_t ncols){
	/*
	 * The difference between the number of elements in a cache line and 
	 * the number of items in a row.
	 *
	 * Negative: more than 1 cache line to store a single ROW.
	 * Positive: less than 1 cache line to store a single ROW.
	 * Zero: exactly 1 cache line to store a single ROW.
	 */
	int32_t delta = (int32_t)(CACHE_LINE_ELEMS - ncols);

	/*
	 * Arithmetical shift right fills in the bytes with the most 
	 * significant bit.
	 *
	 * 0xffffffff: delta is negative
	 *
	 * 0x00000000: delta is positive or zero
	 */
	uint32_t mask = (uint32_t)( (int32_t)(delta >> 31) );

	/*
	 * This may be tricky.
	 *
	 * If `mask` is 0xffffffff this variable represents the number of FULL 
	 * CACHE LINES to store a row (there may be extra items).
	 *
	 * If `mask` is 0x00000000 this variable represents the number of FULL 
	 * rows that fits a SINGLE cache line (there may be extra slot in the 
	 * cache line).
	 */
	uint32_t l_or_r = mask ? 1 : (CACHE_LINE_ELEMS / ncols);

	/*
	 * Max number of items per cache line.
	 *
	 * If `mask` is 0xffffffff it means that `ncols` is greater than 
	 * `CACHE_LINE_ELEMS`, so the maximum number of items in a row per 
	 * cache line is exactly CACHE_LINE_ELEMS.
	 *
	 * If `mask` is 0x00000000 it means that `ncols` is less than or equal 
	 * to `CACHE_LINE_ELEMS`, so the maximum number of items in a cache 
	 * line is equal to `ncols` times `l_or_r`.
	 */
	uint32_t mli = (ncols * l_or_r);

	/*
	 * Number of items that falls outside from a full cache line.
	 */
	uint32_t eli = mask ? CACHE_LINE_RES(ncols) : (CACHE_LINE_ELEMS - mli);

	/*
	 * The percentage of non-filled 4-bytes slots compared to the size of 
	 * a cache line.
	 */
	float waste = (eli / (float)ncols) * 100.0;
	
	printf("=================================\n");
	printf("ncols			= %zu\n", ncols);
	printf("elem x cache line	= %d\n", CACHE_LINE_ELEMS);
	printf("Max rows x cache line	= %u\n", l_or_r);
	printf("Max items x cache line	= %u\n", mli);
	printf("Empty spots x row	= %u\n", eli);
	printf("Percentage waste x row	= %.4f\n", waste);
	printf("=================================\n");
}

/*
 * Function that loops on the items of an array and assigns each item by using 
 * the following expression:
 *
 * 		i * 4 / 3.0
 *
 * where `i` is the array index of that item.
 */
void _loop_rowise_optim(item_t *ia32[], size_t nrows, size_t ncols) {
	return;
}


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
//}


//void _loop_colwise() {
//	int i, j;
//	for(j = 0; j < NROWS; j++) {
//		for(i = 0; i < NCOLS; i++) {
//			ia[i][j] = 1;
//		}
//	}
//}
//
//
//void _loop_rowise_baseline(){
//	int i, j;
//	for(j = 0; j < NROWS; j++) {
//		for(i = 0; i < NCOLS; i++) {
//			ia[j][i] = 1;
//		}
//	}
//}


/*
 * Static array of NROWS * NCOLS * sizeof(item_t) bytes
 */
item_t ia[NROWS][NCOLS];

/*
 * Main function
 */
int main(int argc, char **argv) {
	clock_t start, end;
	start = clock();
	_loop_cache_line_analysis(8);
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