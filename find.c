
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
	 * This MUST be signed!
	 */
	int i = N_ITEMS;

	/*
	 * The compiler without optimizations is capable of turning the condition 
	 * into a shift of the correct number of bits based on the data type to 
	 * check if the most significant bit is either 1 or 0.
	 */
	while(--i >= 0){
		*(ptr+i) = i;
	}

	/*
	 * If two values are equal, the XOR returns 0.
	 */
	uint32_t val = 200;
	
	/*
	 * Same approach as above, don't need to declare a new variable.
	 */
	i = N_ITEMS;
	
	/*
	 * The first conditions guarantees that the loop does not exceed the 
	 * number of items in the array.
	 *
	 * Don't need to update the pointer, just update `i`.
	 *
	 * The second condition stops the loop when the value at address `ptr+i` 
	 * is equal to the target value.
	 *
	 * At the end of the loop `i` is -1 if the value was not found.
	 */
	while( (--i >= 0) && ((*(ptr+i) ^ val) != 0) );

	return 0;
}