
/*
 * Quickly find whether a value is present in a C array
 *
 * https://stackoverflow.com/questions/25661925/quickly-find-whether-a-value-is-present-in-a-c-array
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#define N_ITEMS 256

uint32_t ia[N_ITEMS];

int main(int argc, char **argv) {
	/*
	 * Using the local variable is important because it avoids to continually 
	 * reload the MEMORY PAGE in which the `ia` array is allocated!!!
	 */
	uint32_t *ptr = ia;

	/*
	 * Pre-compute the final value is important because it avoids to compute 
	 * it every time inside the loop.
	 */
	uint32_t *ia_end = ia+N_ITEMS;

	uint32_t i = 0;
	while(ptr < ia_end){
		/*
		 * Remove ptr+i to be computed every time in the loop.
		 * Already computed at this point.
		 * This instruction can be executed faster because there is no need to 
		 * wait for the computation of (ptr+i).
		 */
		*(ptr++) = i++;
	}

	/*
	 * If two values are equal, the XOR returns 0.
	 */
	ptr = ia;
	uint32_t val = 74;
	while((*ptr ^ val) != 0){
		++ptr;
	}
	//printf("*ptr = %d\n", *ptr);

	return 0;
}