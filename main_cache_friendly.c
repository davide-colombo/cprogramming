
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "particle_cache_friendly.h"

particle_pos3_t pos[PARTICLES];
particle_acc3_t acc[PARTICLES];

int main(int argc, char *argv[]){
	particle3_cache_friendly_rand_init_pos3(&pos[0], 1000.0f, 10.0f);
	particle3_cache_friendly_rand_init_acc3(&acc[0], 1000.0f, 10.0f);

	//particle3_cache_friendly_print_pos3(&pos[0]);

	float mass = 5000.81;
	clock_t start, end;
	start = clock();
	particle3_cache_friendly_grav_force(&acc[0], &pos[0], mass);
	end = clock();

	double eps = end - start;
	double icps = 1.0f / (double) CLOCKS_PER_SEC;
	double res = eps * icps;
	printf("Elapsed = %.20f\n", res);
	return 0;
}