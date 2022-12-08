/*
 * Simple loop that calls a function to increment an integer.
 *
 * Use this to understand the stack usage and the loop optimization.
 *
 */

#include <stdio.h>

int main(int argc, char** argv) {
	
	/*
	 * Increment a many times
	 */
	int a = 0;
	while(++a < 10000);
	printf("a = %d\n", a);

	return 0;
}
