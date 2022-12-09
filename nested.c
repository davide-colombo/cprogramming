
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
	for(int i = 0; i < NROWS; i++) {
		for(int j = 0; j < NCOLS; j++) {
			ia[i][j] = 1;
		}
	}
}

void _loop_colwise() {
	for(int j = 0; j < NCOLS; j++) {
		for(int i = 0; i < NROWS; i++) {
			ia[j][i] = 1;
		}
	}
}