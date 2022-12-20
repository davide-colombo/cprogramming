
#include <stdio.h>
#include "particle_cache_friendly.h"

particle_pos3_t pos[PARTICLES];
particle_acc3_t acc[PARTICLES];

int main(int argc, char *argv[]){
	particle3_cache_friendly_rand_init_pos3(&pos[0], 1000.0f, 10.0f);
	particle3_cache_friendly_rand_init_acc3(&acc[0], 1000.0f, 10.0f);
	return 0;
}