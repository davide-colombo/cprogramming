
#include <stdio.h>

/*
 * Nested for loop optimization
 */
#define NROWS 100
#define NCOLS 100

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

void _loop_rowise() {
	/*
	 * This avoids to make two `mult` instructions inside the body of the loop 
	 * to retrieve the correct memory page and offset to the memory address of 
	 * the `ia` global array.
	 */
	int *ptr = &ia[0][0];						// 8 bytes
	int *last_row = &ia[NROWS][0];				// 8 bytes
	int *col;									// 8 bytes
	int *end;									// 8 bytes

	/*
	 * Moving pointer increment OUT FROM THE CONDITION avoids to execute 1 
	 * `mov` instruction.
	 */
	do{
		col = &ptr[0];
		end = col+NCOLS;
		while(col < end) {
			/*
			 * The pair of instructions is translated into 6 instructions.
			 *
			 * Every pair is repeated 4 times, so the content of the inner 
			 * loop is translated into 24 instructions.
			 *
			 * First, load the value of `col` in the register `x9`.
			 * Second, mov #1 to w8.
			 * Third, store [x9]
			 *
			 * Then, to update the value of `col` it is used:
			 *
			 * First, load memory address of col into x9.
			 * Second, add.
			 * Third, store.
			 *
			 * TODO: test if normal array indexing works better than pointer 
			 * indexing.
			 */
			*(col++) = 1;
			*(col++) = 1;
			*(col++) = 1;
			*(col++) = 1;
		}
		ptr+=NROWS;
	}while( ptr < last_row );
}

void _loop_colwise() {
	int i, j;
	for(j = 0; j < NCOLS; j++) {
		for(i = 0; i < NROWS; i++) {
			ia[j][i] = 1;
		}
	}
}



int main(int argc, char **argv) {
	_loop_rowise();

	/*
	int *ptr = &ia[0][0];
	for(int i = 0; i < NROWS; i++) {
		printf("ia[%d][...] = ", i);
		for(int j = 0; j < NCOLS; j++) {
			printf("%d ", *(ptr+i+j));
		}
		printf("\n");
	}*/
	return 0;
}