
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
	int i = N_ITEMS;
	while(--i >= 0){
		*(ptr+i) = i;
	}

	/*
	 * If two values are equal, the XOR returns 0.
	 */
	uint32_t val = 74;
	while((*ptr ^ val) != 0){
		++ptr;
	}
	//printf("*ptr = %d\n", *ptr);

	return 0;
}