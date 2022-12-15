/*
 * Demonstrating how the compiler translates the loop code into assembly 
 * instructions.
 */
#include <stdio.h>
#include <stdint.h>

#define N 100000000

void for1_inc(){
	uint64_t sum = 0;
	for(size_t i = 0; i < N; i++){
		sum = sum + 1;
	}
}
