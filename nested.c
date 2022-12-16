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
 * Remainder of the division is the number of items (NOT THE NUMBER OF CACHE 
 * LINES) remaining. This implies using an extra cache line.
 */
#define CACHE_LINE_RES(n) ( (n) & 31 )

/*
 * The type interface for the definition of the array type.
 */
typedef int32_t item_t;


void _loop_rowise_optim(item_t *ia32[], size_t nrows, size_t ncols) {
	/*
	 * If `ncols` is not a multiple or a divisor of `CACHE_LINE_ELEMS` the 
	 * program's efficiency may be affected because the rows of the matrix 
	 * will not be well aligned to the cache line size.
	 *
	 * The maximum waste is when the number of columns is a multiple of:
	 *
	 * 		CACHE_LINE_ELEMS + (CACHE_LINE_ELEMS/2) + 1
	 *
	 * Translated, one items after the half size of the number of items that 
	 * fits a cache line.
	 *
	 * For example, if CACHE_LINE_ELEMS = 32, the worst case scenario is 
	 * working on a matrix with 17 columns because 17 * 2 = 34 items needs 2 
	 * cache lines in which the first cache lines contains the items in the 
	 * first row and 15/17 = 88.23% of the items in the second row BUT THE 
	 * PROCESSOR STILL NEEDS TO LOAD A SECOND CACHE LINE TO FINISH THE 
	 * OPERATIONS on the items in the second row.
	 *
	 * However, for that operation only the 6.25% of the additional cache line 
	 * loaded is used (93.75% not used!).
	 *
	 * So, this may not be a problem since the items not used in the second 
	 * cache line loaded WILL BE USED in the next iteration for doing the 
	 * compution on the next row in the matrix.
	 *
	 * Anyway this may be suboptimal.
	 */
	uint32_t extra_items_per_row = CACHE_LINE_RES(ncols);
	uint32_t extra_items_zero = extra_items_per_row ^ extra_items_per_row;
	if(extra_items_zero){
		printf("Perfectly aligned!\n");
	}else{
		int32_t delta = (int32_t)(CACHE_LINE_ELEMS - ncols);
		uint32_t mask = (uint32_t)( (int32_t)(delta >> 31) );
		uint32_t cache_lines_per_row = mask ? 0 : (CACHE_LINE_ELEMS / ncols);
		uint32_t items_in_full_cache_lines_per_row = extra_items_per_row * cache_lines_per_row;

		printf("%u items out of %d belongs to this cache line\n", items_in_full_cache_lines_per_row, CACHE_LINE_ELEMS);

		uint32_t empty_spots = CACHE_LINE_ELEMS - items_in_full_cache_lines_per_row;
		printf("%u items out of %d filled by the next row's items\n", empty_spots, CACHE_LINE_ELEMS);

		uint32_t spots_in_next_cl = items_in_full_cache_lines_per_row + ncols - CACHE_LINE_ELEMS;
		printf("%u items out of %zu are stored in the next cache line\n", spots_in_next_cl, ncols);
	}

	if(ncols < CACHE_LINE_ELEMS){
		printf("Undersized matrix\n");
		printf("Total items = %lu\n", nrows * ncols);
		printf("Total cache lines = %lu\n", CACHE_LINE_FULLS((nrows*ncols)) );
		printf("Extra items = %lu\n", CACHE_LINE_RES((nrows*ncols)));
	} else {
		/*
		 * A row is a set of `ncols` items.
		 */
		size_t cache_lines_full_per_row = CACHE_LINE_FULLS(ncols);

		/*
		 * Total number of cache lines.
		 */
		size_t tot_full_cache_lines = cache_lines_full_per_row * nrows;

		/*
		 * Number of extra items (requires 1 extra cache line).
		 *
		 * This is equal to 0 if `ncols` is a multiple or a divisor of:
		 *		C / S
		 * (see above for the definition of C and S).
		 *
		 * Using `uint8_t` because the number of items in a cache line cannot be 
		 * greater than C = 128B
		 */
		uint8_t extra_items_per_row = CACHE_LINE_RES(ncols);
		size_t tot_extra_cache_lines = extra_items_per_row * nrows;
		size_t extra_full_cache_lines = CACHE_LINE_FULLS(tot_extra_cache_lines);
		uint8_t tot_extra_items = CACHE_LINE_RES(tot_extra_cache_lines);

		printf("Full cache lines x Row = %zu\n", cache_lines_full_per_row);
		printf("Extra items x Row = %d\n", extra_items_per_row);
		printf("Total cache lines = %zu\n", tot_full_cache_lines);
		printf("Extra full cache lines = %zu\n", extra_full_cache_lines);
		printf("Tot extra items = %d\n", tot_extra_items);
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
}


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
	_loop_rowise_optim(NULL, 10000, 3);
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