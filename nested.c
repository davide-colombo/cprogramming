
#include <stdio.h>

/*
 * Nested for loop optimization
 */
#define NROWS 128
#define NCOLS 128

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
	 * IMPORTANT:
	 *
	 * Doing the assignment by referring to `ia` as the base variable is more 
	 * efficient because it uses THREE DIFFERENT REGISTER and performs THREE 
	 * STORE instructions with only a SINGLE LOAD INSTRUCTION.
	 */
	int *rowptr = &ia[0][0];				// 8 bytes
	int *endptr = &ia[NROWS-1][NCOLS];		// 8 bytes
	int *colptr = &ia[0][NCOLS];			// 8 bytes

	do{
		while(rowptr < colptr){
			*rowptr = 1;
			*(rowptr+1) = 1;
			*(rowptr+2) = 1;
			*(rowptr+3) = 1;
			*(rowptr+4) = 1;
			*(rowptr+5) = 1;
			*(rowptr+6) = 1;
			*(rowptr+7) = 1;
			rowptr+=8;
		}
		colptr = rowptr + NCOLS;
	}while(rowptr != endptr);
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

	/*int *ptr = &ia[0][0];
	for(int i = 0; i < NROWS; i++) {
		printf("ia[%d][...] = ", i);
		for(int j = 0; j < NCOLS; j++) {
			printf("%d ", *(ptr+i+j));
		}
		printf("\n");
	}*/
	return 0;
}