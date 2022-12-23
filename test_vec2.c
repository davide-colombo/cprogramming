
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "vec2.h"


int main(int argc, char *argv[]){
	double icps = 1.0f / (double)CLOCKS_PER_SEC;
	double e, t;
	clock_t start, end;
	
	srand(time(NULL));

	vector2_print_vector2_type_info();

	/* V1 */
	vector2_t *v1 = vector2_alloc_vector2_aligned(128);
	if(v1 == NULL){
		fprintf(stderr, "Cannot allocate memory for v1 object\n");
		return 1;
	}
	printf("v1 = %p\n", v1);

	//vector2_rand_init_vector2(&v1[0][0], 1000.0f, 10.0f);

	(*v1)[0][0] = 1;
	(*v1)[0][1] = 2;
	(*v1)[1][0] = 4;
	(*v1)[1][1] = 5;

	/* V2 */
	start = clock();
	vector2_t *v2 = vector2_alloc_vector2_aligned(128);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("v2 alloc: %.20f\n", t);
	printf("v2 = %p\n", v2);

	if(v2 == NULL){
		fprintf(stderr, "Cannot allocate memory for v2 object\n");
		return 1;
	}

	start = clock();
	vector2_t *sum = vector2_alloc_vector2_aligned(128);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("sum alloc: %.20f\n", t);
	printf("sum = %p\n", sum);

	if(sum == NULL){
		fprintf(stderr, "Cannot allocate memory for sum object\n");
		return 2;
	}

	//vector2_rand_init_vector2(&v2[0][0], 800.0f, 20.0f);
	(*v2)[0][0] = 2;
	(*v2)[0][1] = 3;
	(*v2)[1][0] = 1;
	(*v2)[1][1] = 3;

//	vector2_print_vector2_data(&v2[0][0]);

	/* ADD */
	start = clock();
	vector2_add(&sum[0][0], &v1[0][0], &v2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("add: %.20f\n", t);
	//vector2_print_vector2_data(&sum[0][0]);

	/* TRANSPOSE */
	vector2_t *tv2 = vector2_alloc_vector2_aligned(128);
	if(tv2 == NULL){
		fprintf(stderr, "Cannot allocate memory for tv2 object\n");
		return 7;
	}


	/* MULTIPLICATION TRANSPOSE */
	vector2_t *mul = vector2_alloc_vector2_aligned(128);
	if(mul == NULL){
		fprintf(stderr, "Cannot allocate memory for mul object\n");
		return 5;
	}

	vector2_zero_init_vector2(mul);
	start = clock();
	vector2_transpose(&tv2[0][0], &v2[0][0]);
	vector2_mul_transpose(&mul[0][0], &v1[0][0], &tv2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("mul transposed: %.20f\n", t);
	vector2_print_vector2_data(&mul[0][0]);

	/* FREE TRANSPOSE */
	vector2_free_vector2(&tv2);

	/* MULTIPLICATION LOCALIZED */
	vector2_zero_init_vector2(mul);
	//uint32_t stride = 128 / sizeof(number_t);
	start = clock();
	vector2_mul_localized(&mul[0][0], &v1[0][0], &v2[0][0], 1);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("mul localized: %.20f\n", t);
	vector2_print_vector2_data(&mul[0][0]);

	/* MULTIPLICATION OPTIMIZED */
	vector2_zero_init_vector2(mul);
	start = clock();
	vector2_mul(&mul[0][0], &v1[0][0], &v2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("mul: %.20f\n", t);
	vector2_print_vector2_data(&mul[0][0]);

	/* SUM OVER ROWS */
	rowsum1_t *rsum = vector2_alloc_rowsum1();
	if(rsum == NULL){
		fprintf(stderr, "Cannot allocate memory for rsum object\n");
		return 3;
	}

	start = clock();
	vector2_sum_rows(&rsum[0][0], &sum[0][0]);
	//vector2_print_rowsum1_data(&rsum[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("rowsum: %.20f\n", t);

	/* SUM OVER COLUMNS */
	colsum1_t *csum = vector2_alloc_colsum1();
	if(csum == NULL){
		fprintf(stderr, "Cannot allocate memory for csum object\n");
		return 4;
	}

	start = clock();
	vector2_sum_cols(&csum[0][0], &v2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("colsum: %.20f\n", t);
	//vector2_print_colsum1_data(&csum[0][0]);

	/* FREE */
	vector2_free_vector2(&v1);
	vector2_free_vector2(&v2);
	vector2_free_vector2(&sum);
	vector2_free_vector2(&tv2);
	vector2_free_vector2(&mul);
	vector2_free_rowsum1(&rsum);
	vector2_free_colsum1(&csum);

	return 0;
}