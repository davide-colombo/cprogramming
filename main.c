
#include <stdio.h>
#include <time.h>
#include "particle.h"

/*
 * Allocate a static array of particles
 */
particle3_t particles[PARTICLES];

int main(int argc, char *argv[]){
	float mass = 457.987;
	clock_t start, end;
	start = clock();
	particle3_gravitational_force(&particles[0], mass);
	end = clock();
	double elapsed = end - start;
	double icps = 1.0f / (double) CLOCKS_PER_SEC;
	double res = elapsed * icps;
	printf("Elapsed = %.20f\n", res);
	return 0;
}