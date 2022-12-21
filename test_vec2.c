
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "vec2.h"

//vector2_t v __attribute__( (aligned(128)) );

int main(int argc, char *argv[]){
	double icps = 1.0f / (double)CLOCKS_PER_SEC;
	double e, t;
	clock_t start, end;
	
	srand(time(NULL));

	vector2_print_vector2_type_info();
	//vector2_rand_init_vector2(v, 1000.0f, 10.0f);
	//vector2_print_vector2_data(v);

	/* V1 */
	vector2_t *v1 = vector2_alloc_vector2_aligned(128);
	if(v1 == NULL){
		fprintf(stderr, "Cannot allocate memory for v1 object\n");
		return 1;
	}
	printf("v1 = %p\n", v1);

	vector2_rand_init_vector2(&v1[0][0], 1000.0f, 10.0f);

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

	vector2_rand_init_vector2(&v2[0][0], 800.0f, 20.0f);
	//vector2_print_vector2_data(&v2[0][0]);

	start = clock();
	vector2_add(&sum[0][0], &v1[0][0], &v2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("add: %.20f\n", t);
	//vector2_print_vector2_data(&sum[0][0]);

	vector2_t *mul = vector2_alloc_vector2_aligned(128);
	if(mul == NULL){
		fprintf(stderr, "Cannot allocate memory for mul object\n");
		return 5;
	}

	start = clock();
	vector2_mul(&mul[0][0], &v1[0][0], &v2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("mul: %.20f\n", t);

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

	vector2_free_vector2(v1);
	vector2_free_vector2(v2);
	vector2_free_vector2(sum);
	vector2_free_rowsum1(rsum);
	vector2_free_colsum1(csum);

	return 0;
}