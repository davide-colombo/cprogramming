
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
	for(int i = 0; i < N_ITEMS; i++){
		ia[i] = i;
	}

	bool found = false;
	uint32_t val = 74;
	uint32_t *ptr = &ia[0];
	for(int i = N_ITEMS; i != 0; i--) {
		if(val == *ptr++){
			found = true;
			break;
		}
	}
	return 0;
}