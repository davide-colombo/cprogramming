
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <assert.h>
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
 * Align memory for an object of type "vector2_t" aligned on a memory boundary 
 * that is a multiple of "align_bytes"
 */
vector2_t *vector2_alloc_vector2_aligned(size_t alignment){
	assert( (alignment == 128) | (alignment == 64) | (alignment == 32) | \
			(alignment == 16) | (alignment == 8) | (alignment == 4));
	vector2_t *out = NULL;
	size_t size = sizeof *out;
	size_t residual = size & (alignment - 1);
	size_t extra = alignment - residual;
	size += extra;
	assert( ( size & (alignment - 1) ) == 0 );
	out = aligned_alloc(alignment, size);
	return out;
}

/*
 * Custom procedure to release previously allocated memory for an object of 
 * type vector2_t
 */
void vector2_free_vector2(vector2_t **v){
	if(*v != NULL){
		free(*v);
		*v = NULL;
	}
}

/*
 * Custom allocator for an object of type rowsum1_t
 */
rowsum1_t *vector2_alloc_rowsum1(){
	rowsum1_t *r = NULL;
	r = malloc(sizeof *r);
	return r;
}

/*
 * Release memory allocated for an object of type rowsum1_t
 */
void vector2_free_rowsum1(rowsum1_t **r){
	if(*r != NULL){
		free(*r);
		*r = NULL;
	}
}

/*
 * Custom allocator for objects of type colsum1_t
 */
colsum1_t *vector2_alloc_colsum1(){
	colsum1_t *c = NULL;
	c = malloc(sizeof *c);
	return c;
}

/*
 * Release memory allocated for an object of type colsum1_t
 */
void vector2_free_colsum1(colsum1_t **c){
	if(*c != NULL){
		free(*c);
		*c = NULL;
	}
}

/*
 * Compute the elementwise sum between v1 and v2 and return it in out
 *
 * Unroll loop using an unroll factor K = 4.
 *
 * Computing every time in the loop "jlimit" and "jres" is better for 
 * multithreading execution.
 */
void vector2_add(vector2_t out, vector2_t v1, vector2_t v2){
	uint32_t ilimit = NROWS;
	uint32_t i = 0;
	while(1){
		number_t * restrict v1col0 = &v1[i][0];
		number_t * restrict v1col1 = &v1[i][1];
		number_t * restrict v1col2 = &v1[i][2];
		number_t * restrict v1col3 = &v1[i][3];

		number_t * restrict v2col0 = &v2[i][0];
		number_t * restrict v2col1 = &v2[i][1];
		number_t * restrict v2col2 = &v2[i][2];
		number_t * restrict v2col3 = &v2[i][3];

		number_t * restrict outcol0 = &out[i][0];
		number_t * restrict outcol1 = &out[i][1];
		number_t * restrict outcol2 = &out[i][2];
		number_t * restrict outcol3 = &out[i][3];

		uint32_t j = 0;
		uint32_t jlimit = NCOLS >> 2;
		if(jlimit){
			while(1){
				// LOAD
				number_t v1_0 = v1col0[j];
				number_t v1_1 = v1col1[j];
				number_t v1_2 = v1col2[j];
				number_t v1_3 = v1col3[j];

				number_t v2_0 = v2col0[j];
				number_t v2_1 = v2col1[j];
				number_t v2_2 = v2col2[j];
				number_t v2_3 = v2col3[j];

				// UPDATE
				number_t sum1	= v1_0 + v2_0;
				number_t sum2	= v1_1 + v2_1;
				number_t sum3	= v1_2 + v2_2;
				number_t sum4	= v1_3 + v2_3;
				uint32_t jnext	= j + 4;
				uint32_t jlnext	= jlimit - 1;

				// STORE
				outcol0[j]	= sum1;
				outcol1[j]	= sum2;
				outcol2[j]	= sum3;
				outcol3[j]	= sum4;

				// TEST
				if(jlnext == 0){ break; }
				jlimit		= jlnext;
				j			= jnext;
			} /* while */
		} /* jlimit */

		uint32_t jres = NCOLS & 3;
		if(jres){
			while(1){
				// LOAD
				number_t v1_0 = v1col0[j];
				number_t v2_0 = v2col0[j];

				// UPDATE
				number_t sum0	= v1_0 + v2_0;
				uint32_t jnext	= j + 1;
				uint32_t jrnext	= jres - 1;

				// STORE
				outcol0[j] = sum0;

				// TEST
				if(jrnext == 0){ break; }
				j		= jnext;
				jres	= jrnext;
			} /* while */
		} /* jres */
		
		i += 1;
		ilimit -= 1;
		if(ilimit == 0){ break; }
	} /* while */
}

/*
 * Multiply "v1" by "v2" and return the result in "out"
 */
void vector2_mul(vector2_t out, vector2_t v1, vector2_t v2){
	number_t *iout	= &out[0][0];
	number_t *iv1	= &v1[0][0];
	number_t ikv1	= iv1[0];
	number_t *kv2	= &v2[0][0];

	// LOAD
	uint32_t i = 0;
	uint32_t iiter = NROWS;
	uint32_t k = 0;
	uint32_t kiter = NCOLS;
	uint32_t j = 0;
	uint32_t jiter = NCOLS;

	uint32_t inext		= 1;
	uint32_t iiter_next	= NROWS - 1;
	uint32_t knext		= 1;
	uint32_t kiter_next	= NCOLS - 1;

	while(1){
		while(1){ /* kiter */
			while(1){ /* jiter */
				// LOAD
				number_t kjv2		= kv2[j];
				number_t ijout		= iout[j];

				// UPDATE
				number_t mul		= ikv1 * kjv2;

				// STORE
				iout[j]	= ijout + mul;
				j += 1;
				jiter -= 1;

				// TEST
				if(jiter == 0){ break; }
			} /* jiter */

			// RESET J
			j			= 0;
			jiter		= NCOLS;

			// UPDATE K
			ikv1	= iv1[knext];
			kv2		= &v2[knext][0];
			k		= knext;
			kiter	= kiter_next;
			knext		+= 1;
			kiter_next	-= 1;

			if(kiter == 0){ break; }
		} /* kiter */

		// RESET K
		k			= 0;
		kiter		= NCOLS;
		knext		= 1;
		kiter_next	= NCOLS - 1;

		// UPDATE I
		iout		= &out[inext][0];
		iv1			= &v1[inext][0];
		i			= inext;
		iiter		= iiter_next;
		inext		+= 1;
		iiter_next	-= 1;

		if(iiter == 0){ break; }
	} /* iiter */
}

/*
 * Transpose "v" (i.e., v[i][j] = v[j][i])
 *
 * NOTE: the indices are inverted to minimize the number of cache misses when 
 * loading the values of the "v" object from main memory.
 */
void vector2_transpose(vector2_t out, vector2_t v){
	for(uint32_t i = 0; i < NROWS; i++){
		for(uint32_t j = 0; j < NCOLS; j++){
			out[j][i] = v[i][j];
		}
	}
}

/*
 * Multiply "v1" by the transpose of "v2" and store the result in "out".
 * Use of this interface MUST call the procedure with the already transposed 
 * version of "v2"
 */
void vector2_mul_transpose(vector2_t out, vector2_t v1, vector2_t tv2){
	for(uint32_t i = 0; i < NROWS; i++){
		for(uint32_t j = 0; j < NCOLS; j++){
			for(uint32_t k = 0; k < NCOLS; k++){
				out[i][j] += v1[i][k] * tv2[j][k];
			}
		}
	}
}

/*
 * Multiply "v1" by "v2" in a block-by-block fashion and store the result in 
 * "out".
 *
 * Each block is "stride"x"stride" in size
 */
void vector2_mul_localized(vector2_t out, vector2_t v1, vector2_t v2, uint32_t stride){
	for(uint32_t i = 0; i < NROWS; i+=stride){
		for(uint32_t j = 0; j < NCOLS; j+=stride){
			for(uint32_t k = 0; k < NCOLS; k+=stride){
				number_t *rres = &out[i][j];
				number_t *rmul1 = &v1[i][k];
				for(uint32_t i2 = 0; i2 < stride; i2++, rres+=NCOLS, rmul1+=NCOLS){
					number_t *rmul2 = &v2[k][j];
					for(uint32_t k2 = 0; k2 < stride; k2++, rmul2+=NCOLS){
						for(uint32_t j2 = 0; j2 < stride; j2++){
							rres[j2] += rmul1[k2] * rmul2[j2];
						}
					}
				}
			}
		}
	}
}

/*
 * Compute the sum over "v" rows and return the result in "out"
 */
void vector2_sum_rows(rowsum1_t out, vector2_t v){
	uint32_t i = 0;
	uint32_t ilimit = NROWS;
	if(ilimit){
		while(1){
			number_t *restrict icol0 = &v[i][0];
			number_t *restrict icol1 = &v[i][1];
			number_t *restrict icol2 = &v[i][2];
			number_t *restrict icol3 = &v[i][3];

			number_t sum0 = 0;
			number_t sum1 = 0;
			number_t sum2 = 0;
			number_t sum3 = 0;
			
			uint32_t j = 0;
			uint32_t jlimit = NCOLS >> 2;
			if(jlimit){
				while(1){
					sum0 += icol0[j];
					sum1 += icol1[j];
					sum2 += icol2[j];
					sum3 += icol3[j];

					j += 4;
					jlimit -= 1;
					if(jlimit == 0){ break; }
				} /* while */
			} /* jlimit */

			uint32_t jres = NCOLS & 3;
			if(jres){
				while(1){
					sum0 += icol0[j];

					j += 1;
					jres -= 1;
					if(jres == 0){ break; }
				} /* while */
			} /* jres */

			number_t sum01 = sum0 + sum1;
			number_t sum23 = sum2 + sum3;
			out[i] = sum01 + sum23;

			i += 1;
			ilimit -= 1;
			if(ilimit == 0){ break; }
		} /* while */
	} /* ilimit */
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

/*
 * Zero initialize an object of type vector2_t
 */
void vector2_zero_init_vector2(vector2_t *v){
	memset(v, 0, sizeof *v);
}

/*
 * Print the content of an object of type rowsum1_t
 */
void vector2_print_rowsum1_data(rowsum1_t v){
	for(int i = 0; i < NROWS; i++){
		printf("sum of the %d-th row = %.4f\n", i, v[i]);
	}
}

/*
 * Print the content of an object of type colsum1_t
 */
void vector2_print_colsum1_data(colsum1_t v){
	for(int i = 0; i < NCOLS; i++){
		printf("sum of the %d-th column = %.4f\n", i, v[i]);
	}
}

