
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
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
		printf("net_acc.x = %.8f\tnet_acc.y = %.8f\tnet_acc.z = %.8f\n", \
				net_acc.x, net_acc.y, net_acc.z);
	}
}

/*
 * Randomly initialize an array of particles
 */
void particle3_rand_init(particle3_t *particles){
	srand(time(NULL));
	double irm = 1.0f / (double) RAND_MAX;
	for(int i = 0; i < PARTICLES; i++){
		particles[i].pos.x = rand() * irm;
		particles[i].pos.y = rand() * irm;
		particles[i].pos.z = rand() * irm;

		particles[i].vel.x = rand() * irm;
		particles[i].vel.y = rand() * irm;
		particles[i].vel.z = rand() * irm;

		particles[i].acc.x = rand() * irm;
		particles[i].acc.y = rand() * irm;
		particles[i].acc.z = rand() * irm;
	}
}

/*
 * Print 3D components of position, velocity and acceleration for every 
 * particle in the array.
 */
void particle3_print(particle3_t *particles){
	for(int i = 0; i < PARTICLES; i++){
		particle3_t p = particles[i];
		printf("particle %d: ", i);
		printf("pos.x = %.4f, ", p.pos.x);
		printf("pos.y = %.4f, ", p.pos.y);
		printf("pos.z = %.4f, ", p.pos.z);
		printf("vel.x = %.4f, ", p.vel.x);
		printf("vel.y = %.4f, ", p.vel.y);
		printf("vel.z = %.4f, ", p.vel.z);
		printf("acc.x = %.4f, ", p.acc.x);
		printf("acc.y = %.4f, ", p.acc.y);
		printf("acc.z = %.4f\n", p.acc.z);
	}
}
