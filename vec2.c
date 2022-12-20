
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "vec2.h"

void vector2_print(vector2_t vec2){
	for(int i = 0; i < NROWS; i++){
		printf("[%d] => ", i);
		number_t *irow = &vec2[i][0];
		for(int j = 0; j < NCOLS; j++){
			printf("[%d] = %.4f, ", j, irow[j]);
		}
		printf("\n");
	}
}

/*
 * Randomly initialize an vec2 object.
 * Scale and shift are respectively the scale and shift factors used to 
 * generate the random number.
 *
 * Numbers are cast to `number_t` data type to maintain the consistency with 
 * the `vec2` object.
 */
void vector2_rand_init(vector2_t vec2, double scale, double shift){
	srand(time(NULL));
	double irm = 1.0f / (double) RAND_MAX;
	scale *= irm;
	shift *= irm;
	for(int i = 0; i < NROWS; i++){
		number_t *irow = &vec2[i][0];
		for(int j = 0; j < NCOLS; j++){
			double rscale = rand() * scale;
			double rshift = rand() * shift;
			irow[j] = (number_t)rscale + (number_t)rshift;
		}
	}
}
