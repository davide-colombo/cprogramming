/*
 * Simple loop that calls a function to increment an integer.
 *
 * Use this to understand the stack usage and the loop optimization.
 *
 */

#include <stdio.h>

/*
 * a => 4 bytes
 * Stack frame == 16 bytes (12 bytes wasted)
 * return a 4 bytes word => uses `w` register
 */
int _lp_inci(int a) {
	return a+1;
}

int main(int argc, char** argv) {
	
	int a;
	for (int i = 0; i < 10000; i++) {
		a = _lp_inci(a);
	}

	return 0;
}
