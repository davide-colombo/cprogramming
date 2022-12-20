
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "vec2.h"

void vector2_print(vector2_t *vec2){
	for(int i = 0; i < NROWS; i++){
		printf("[%d] => ", i);
		for(int j = 0; j < NCOLS; j++){
			printf("[%d] = %.4f, ", j, vec2[i][j]);
		}
		printf("\n");
	}
}

void vector2_rand_init(vector2_t *vec2, double scale, double shift){
	srand(time(NULL));
	double irm = 1.0f / (double) RAND_MAX;
	scale *= irm;
	shift *= irm;
	for(int i = 0; i < NROWS; i++){
		for(int j = 0; j < NCOLS; j++){
			double rscale = rand() * scale;
			double rshift = rand() * shift;
			vec2[i][j] = rscale + rshift;
		}
	}
}
