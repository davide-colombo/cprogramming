
#include <stdio.h>
#include "vec2.h"

vector2_t v;

int main(int argc, char *argv[]){
	vector2_rand_init(v, 1000.0f, 10.0f);
	vector2_print(v);

	return 0;
}