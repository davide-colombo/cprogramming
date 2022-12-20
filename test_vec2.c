
#include <stdio.h>
#include "vec2.h"

vector2_t v;

int main(int argc, char *argv[]){
	vector2_print_vector2_type_info();
	vector2_rand_init_vector2(v, 1000.0f, 10.0f);
	vector2_print_vector2_data(v);

	vector2_t *v2 = vector2_alloc_vector2();
	if(v2 == NULL){
		fprintf(stderr, "Cannot allocate memory for v2 object\n");
		return 1;
	}

	vector2_t *sum = vector2_alloc_vector2();
	if(sum == NULL){
		fprintf(stderr, "Cannot allocate memory for sum object\n");
		return 2;
	}

	vector2_rand_init_vector2(&v2[0][0], 800.0f, 20.0f);
	vector2_print_vector2_data(&v2[0][0]);

	vector2_add(&sum[0][0], v, &v2[0][0]);
	vector2_print_vector2_data(&sum[0][0]);

	vector2_free_vector2(v2);
	vector2_free_vector2(sum);


	return 0;
}