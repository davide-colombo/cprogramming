
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
	int i, j;

	/*
	 * This avoids to make two `mult` instructions inside the body of the loop 
	 * to retrieve the correct memory page and offset to the memory address of 
	 * the `ia` global array.
	 */
	int *ptr = &ia[0][0];

	/*
	 * `i` loaded into `w8` register.
	 * make the comparison with #100 (subs IMMEDIATE)
	 * jump to the beginning of the second loop
	 */
	for(i = 0; i < NROWS; i++) {
		/*
		 * `j` is loaded into `w8` register.
		 *
		 * THIS OVERRIDES THE PREVIOUS VALUE OF `i`.
		 *
		 * IT MEANS THAT `i` must be reloaded into a register before accessing 
		 * the array.
		 */
		for(j = 0; j < NCOLS; j++) {
			*(ptr+i+j) = 1;
		}
	}
}

void _loop_colwise() {
	int i, j;
	for(j = 0; j < NCOLS; j++) {
		for(i = 0; i < NROWS; i++) {
			ia[j][i] = 1;
		}
	}
}