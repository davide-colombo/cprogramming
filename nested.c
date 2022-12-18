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

#define NROWS 8192
#define NCOLS 8192

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
#define CACHE_LINE_FULL(n) ( (n) >> 5 )

/*
 * Remainder of the division is the number of items (NOT THE NUMBER OF CACHE 
 * LINES) remaining. This implies using an extra cache line.
 */
#define CACHE_LINE_RES(n) ( (n) & 31 )

/*
 * The type interface for the definition of the array type.
 */
typedef int32_t item_t;

/*
 * Implementation follows the LOAD->COMPARE->COMBINE pattern suggest by Mike 
 * Acton in his article "Using masks to accelerate integer code" at:
 * https://web.archive.org/web/20070801195133/http://www.cellperformance.com/articles/2006/04/better_ppu_performance_through_1.html
 */
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
	uint32_t mask = (uint32_t)(delta >> 31);

	/*
	 * Res1: number of rows that fit in a single cache line
	 *
	 * NOTE: move this to the top so the CPU can schedule it and continue to 
	 * execute other instructions while finishing to compute the integer 
	 * division.
	 */
	uint32_t small_res1 = CACHE_LINE_ELEMS / ncols;

	/*
	 * Computing the remainder of the division between `CACHE_LINE_ELEMS` and 
	 * `ncols` by using the formula provided by Daniel Lemire 
	 * (https://lemire.me/blog/2019/02/08/faster-remainders-when-the-divisor-is-a-constant-beating-compilers-and-libdivide/)
	 */
//	uint64_t fastc = ((uint64_t)0xFFFFFFFFFFFFFFFF / ncols) + 1;
//	uint64_t lowbits = fastc * CACHE_LINE_ELEMS;
//	uint32_t small_res2 = ((__uint128_t)lowbits * ncols) >> 64;

	/*
	 * Res1: number of full cache lines needed to store a single row
	 */
	uint32_t big_res1 = CACHE_LINE_FULL(ncols);

	/*
	 * Res2: number of items in the current row that do not fit in a cache 
	 * line
	 */
	uint32_t big_res2 = CACHE_LINE_RES(ncols);

	uint32_t small_tmp = (ncols * small_res1);

	/*
	 * Res2: number of empty spots in a cache line
	 */
	uint32_t small_res2 = CACHE_LINE_ELEMS - small_tmp;

	uint32_t big_res1_mask = (mask & big_res1);
	uint32_t small_res1_mask = (~mask & small_res1);

	uint32_t big_res2_mask = (mask & big_res2);
	uint32_t small_res2_mask = (~mask & small_res2);

	uint32_t res1 = big_res1_mask | small_res1_mask;
	uint32_t res2 = big_res2_mask | small_res2_mask;

	/*
	 * The percentage of non-filled 4-bytes slots compared to the size of 
	 * a cache line.
	 */
	float waste = (res2 / (float)ncols) * 100.0;

	printf("=================================\n");
	printf("ncols			= %zu\n", ncols);
	printf("elem x cache line	= %d\n", CACHE_LINE_ELEMS);
	printf("Max rows x cache line	= %u\n", res1);
	printf("Empty spots x row	= %u\n", res2);
	printf("Percentage waste x row	= %.4f\n", waste);
	printf("=================================\n");
}


/*
 * Test 1:
 *
 * Iterate over a 2D array (nrows * ncols) of `item_t` types.
 *
 * At each iteration assign i * j / 3.0 to the memory address identified by 
 * ia32[i][j].
 *
 * Iterations are conducted using two induction variable, i and j.
 *
 * No loop-unrolling is performed.
 */
void _loop_test1(item_t (*ia32)[NCOLS], size_t nrows, size_t ncols){
	size_t i = 0;
	for(; i < nrows; i++){
		size_t j = 0;
		item_t *row = &ia32[i][j];
		for(; j < ncols; j++){
			row[j] = (i + j) / 3.0;
		}
	}
}

/*
 * Convert the inner loop by using an infinite loop + an UNLIKELY TO BE TAKEN 
 * branch.
 */
void _loop_test2(item_t (*ia32)[NCOLS], size_t nrows, size_t ncols){
	size_t i = 0;
	for(; i < nrows; i++){
		size_t j = 0;
		item_t *row = &ia32[i][j];
		while(1){
			row[j] = (i + j) / 3.0;
			j = j + 1;
			if(j >= ncols){ break; }
		}
	}
}

/*
 * Extract the division by 3.0 to replace it with a multiplication by 1.0/3.0 
 * (i.e., the inverse). The inverse can be computed outside the two loops and 
 * the division can be turned into a multiplication.
 */
void _loop_test3(item_t (*ia32)[NCOLS], size_t nrows, size_t ncols){
	double c = 1.0f / 3.0f;
	size_t i = 0;
	for(; i < nrows; i++){
		size_t j = 0;
		item_t *row = &ia32[i][j];
		while(1){
			row[j] = (i + j) * c;
			j = j + 1;
			if(j >= ncols){ break; }
		}
	}
}

void _loop_test4(item_t (*ia32)[NCOLS], size_t nrows, size_t ncols){
	double c = 1.0f / 3.0f;
	size_t i = 0;
	for(; i < nrows; i++){
		size_t j = 0;
		item_t *row = &ia32[i][j];
		while(1){
			double _ii = i * c;
			double _jj = j * c;
			uint64_t _ij= (uint64_t)_ii + (uint64_t)_jj;
			row[j] = _ij;
			j = j + 1;
			if(j >= ncols){ break; }
		}
	}
}

void _loop_test4_data_type_conv(item_t (*ia32)[NCOLS], size_t nrows, size_t ncols){
	double c = 1.0f / 3.0f;
	size_t i = 0;
	for(; i < nrows; i++){
		size_t j = 0;
		item_t *row = &ia32[i][j];
		while(1){
			double _ii = i * c;
			double _jj = j * c;
			item_t _ij=(item_t)_ii + (item_t)_jj;
			row[j] = _ij;
			j = j + 1;
			if(j >= ncols){ break; }
		}
	}
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
	_loop_cache_line_analysis(NCOLS);
	start = clock();
	_loop_test4(&ia[0], NROWS, NCOLS);
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