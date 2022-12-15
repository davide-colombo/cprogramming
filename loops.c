/*
 * Demonstrating how the compiler translates the loop code into assembly 
 * instructions.
 */
#include <stdio.h>
#include <stdint.h>
#include <time.h>

#define N 100000000

void for1_inc(){
	uint64_t sum = 0;
	for(size_t i = 0; i < N; i++){
		sum = sum + 1;
	}
}

void do1_inc(){
	uint64_t sum = 0;
	size_t i = 0;
	do{
		sum = sum + 1;
		i = i + 1;
	}while(i < N);
}

void inf_plus_if1_inc(){
	uint64_t sum = 0;
	size_t i = 0;
	while(1){
		sum = sum + 1;
		i = i + 1;
		if(i == N){ break; }
	}
}

int main(int argc, char *argv[]){
	clock_t start, end;
	start = clock();
	inf_plus_if1_inc();
	end = clock();
	printf("Elapsed: %.20lf\n", (end - start) / (double)CLOCKS_PER_SEC);
	return 0;
}

