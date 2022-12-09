
#include <stdio.h>

/*
 * Nested for loop optimization
 */
#define NROWS 100
#define NCOLS 100

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
	int *last_row = &ia[NROWS-1][0];			// 8 bytes
	int j;										// 4 bytes

	/*
	 * TODO: see the effect of extracting the INCREMENT of `ptr` from the 
	 * condition.
	 */
	do{
		for(j = 0; j < NCOLS; j++) {
			*(ptr+j) = 1;
		}
	}while( (ptr+=NROWS) <= last_row );
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