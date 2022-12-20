
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "vec2.h"

#define alignof(t) __alignof__(t)

/*
 * Print size and alignment for vector2_t data type
 */
void vector2_print_vector2_type_info(){
	printf("sizeof(vector2_t) = %zu\n", sizeof(vector2_t));
	printf("alignof(vector2_t) = %zu\n", alignof(vector2_t));
}

/*
 * Custom allocator for vector2_t object
 */
vector2_t *vector2_alloc_vector2(){
	vector2_t *out = NULL;
	out = malloc(sizeof *out);
	return out;
}

/*
 * Custom procedure to release previously allocated memory for an object of 
 * type vector2_t
 */
void vector2_free_vector2(vector2_t *v){
	if(v == NULL){
		fprintf(stderr, "Cannot free vector 2 object!!\n");
	}
	free(v);
}

/*
 * Compute the elementwise sum between v1 and v2 and return it in out
 */
void vector2_add(vector2_t out, vector2_t v1, vector2_t v2){
	for(int i = 0; i < NROWS; i++){
		for(int j = 0; j < NCOLS; j++){
			out[i][j] = v1[i][j] + v2[i][j];
		}
	}
}

/*
 * Compute the sum over "v" rows and return the result in "out"
 */
void vector2_sum_rows(rowsum1_t out, vector2_t v){
	for(int i = 0; i < NROWS; i++){
		out[i] = 0;
		for(int j = 0; j < NCOLS; j++){
			out[i] += v[i][j];
		}
	}
}

/*
 * Compute the sum over "v" column and return the result in "out"
 */
void vector2_sum_cols(colsum1_t out, vector2_t v){
	for(int i = 0; i < NCOLS; i++){
		out[i] = 0;
		for(int j = 0; j < NROWS; j++){
			out[i] += v[j][i];
		}
	}
}

/*
 * Print the two dimensional vector object
 */
void vector2_print_vector2_data(vector2_t vec2){
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
void vector2_rand_init_vector2(vector2_t vec2, double scale, double shift){
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
