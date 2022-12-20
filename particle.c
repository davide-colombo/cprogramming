
#include <math.h>
#include "particle.h"

/*
 * Gravitational force between two particles.
 */
void particle3_gravitational_force(particle3_t *particles, float mass){
	for(int i = 0; i < PARTICLES; i++){
		float3_t net_acc;
		net_acc.x = net_acc.y = net_acc.z = 0;
		for(int j = 0; j < PARTICLES; j++){
			float3_t r;
			r.x = particles[j].pos.x - particles[i].pos.x;
			r.y = particles[j].pos.y - particles[i].pos.y;
			r.z = particles[j].pos.z - particles[i].pos.z;
			float d = sqrt( (r.x * r.x) + (r.y * r.y) + (r.z * r.z) );
			float id = 1.0f / d;
			float delta_acc = id * id * id * mass;
			net_acc.x += r.x * delta_acc;
			net_acc.y += r.y * delta_acc;
			net_acc.z += r.z * delta_acc;
		}
		particles[i].acc.x += net_acc.x;
		particles[i].acc.y += net_acc.y;
		particles[i].acc.z += net_acc.z;
	}
}
