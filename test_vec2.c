
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "vec2.h"

double icps = 1.0f / (double)CLOCKS_PER_SEC;

vector2_t v;

int main(int argc, char *argv[]){
	srand(time(NULL));

	vector2_print_vector2_type_info();
	vector2_rand_init_vector2(v, 1000.0f, 10.0f);
	//vector2_print_vector2_data(v);

	clock_t start, end;
	start = clock();
	vector2_t *v2 = vector2_alloc_vector2();
	end = clock();
	double e = end - start;
	double t = e * icps;
	printf("v2 alloc: %.20f\n", t);

	if(v2 == NULL){
		fprintf(stderr, "Cannot allocate memory for v2 object\n");
		return 1;
	}

	start = clock();
	vector2_t *sum = vector2_alloc_vector2();
	end = clock();
	e = end - start;
	t = e * icps;
	printf("sum alloc: %.20f\n", t);

	if(sum == NULL){
		fprintf(stderr, "Cannot allocate memory for sum object\n");
		return 2;
	}

	vector2_rand_init_vector2(&v2[0][0], 800.0f, 20.0f);
	//vector2_print_vector2_data(&v2[0][0]);

	start = clock();
	vector2_add(&sum[0][0], v, &v2[0][0]);
	end = clock();
	e = end - start;
	t = e * icps;
	printf("add: %.20f\n", t);

	//vector2_print_vector2_data(&sum[0][0]);

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

	vector2_free_vector2(v2);
	vector2_free_vector2(sum);
	vector2_free_rowsum1(rsum);


	return 0;
}