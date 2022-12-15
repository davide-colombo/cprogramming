/*
 * Demonstrating how the compiler translates the loop code into assembly 
 * instructions.
 */
#include <stdio.h>
#include <stdint.h>
#include <time.h>

#define N 100000000

uint64_t for1_inc(){
	uint64_t sum = 0;
	for(size_t i = 0; i < N; i++){
		sum = sum + 1;
	}
	return sum;
}

uint64_t do1_inc(){
	uint64_t sum = 0;
	size_t i = 0;
	do{
		sum = sum + 1;
		i = i + 1;
	}while(i < N);
	return sum;
}

uint64_t inf_plus_if1_inc(){
	uint64_t sum = 0;
	size_t i = 0;
	while(1){
		sum = sum + 1;
		i = i + 1;
		if(i == N){ break; }
	}
	return sum;
}

uint64_t for2_inc(){
	uint64_t sum0 = 0;
	uint64_t sum1 = 0;
	uint64_t sum2 = 0;
	uint64_t sum3 = 0;

	for(size_t i = 0; i < N; i+=4){
		sum0 = sum0 + 1;
		sum1 = sum1 + 1;
		sum2 = sum2 + 1;
		sum3 = sum3 + 1;
	}
	return (sum0 + sum1) + (sum2 + sum3);
}

uint64_t do2_inc(){
	uint64_t sum0 = 0;
	uint64_t sum1 = 0;
	uint64_t sum2 = 0;
	uint64_t sum3 = 0;

	size_t i = 0;
	do{
		sum0 = sum0 + 1;
		sum1 = sum1 + 1;
		sum2 = sum2 + 1;
		sum3 = sum3 + 1;
		i = i + 4;
	}while(i < N);
	return (sum0 + sum1) + (sum2 + sum3);
}

uint64_t inf_plus_if2_inc(){
	uint64_t sum0 = 0;
	uint64_t sum1 = 0;
	uint64_t sum2 = 0;
	uint64_t sum3 = 0;

	size_t i = 0;
	while(1){
		sum0 = sum0 + 1;
		sum1 = sum1 + 1;
		sum2 = sum2 + 1;
		sum3 = sum3 + 1;

		i = i + 4;
		if(i == N){ break; }
	}
	return (sum0 + sum1) + (sum2 + sum3);
}

int main(int argc, char *argv[]){
	clock_t start, end;
	start = clock();
	inf_plus_if1_inc();
	end = clock();
	printf("Elapsed: %.20lf\n", (end - start) / (double)CLOCKS_PER_SEC);
	return 0;
}

