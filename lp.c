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
	
	int a = 0;
	do {
		/*
		 * Few instructions repeated many times => TEMPORAL LOCALITY
		 */
		a = _lp_inci(a);
	} while(a < 10000);

	return 0;
}
