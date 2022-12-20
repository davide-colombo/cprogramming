
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "particle.h"

#define alignof(n) __alignof__( n )

void particle3_print_float3_info(){
	printf("sizeof(float3_t) = %zu\n", sizeof(float3_t));
	printf("alignof(float3_t) = %zu\n", alignof(float3_t));
}

void particle3_print_particle3_info(){
	printf("sizeof(particle3_t) = %zu\n", sizeof(particle3_t));
	printf("alignof(particle3_t) = %zu\n", alignof(particle3_t));
}

/*
 * Gravitational force between two particles.
 */
void particle3_gravitational_force(particle3_t *particles, float mass){
	for(int i = 0; i < PARTICLES; i++){
		particle3_t pi = particles[i];
		float3_t ipos = pi.pos;
		float iposx = ipos.x;
		float iposy = ipos.y;
		float iposz = ipos.z;

		float3_t net_acc;
		net_acc.x = net_acc.y = net_acc.z = 0;
		for(int j = 0; j < PARTICLES; j++){
			particle3_t pj = particles[j];
			float3_t jpos = pj.pos;
			float jposx = jpos.x;
			float jposy = jpos.y;
			float jposz = jpos.z;

			float3_t r;
			r.x = jposx - iposx;
			r.y = jposy - iposy;
			r.z = jposz - iposz;

			float rx2 = r.x * r.x;
			float ry2 = r.y * r.y;
			float rz2 = r.z * r.z;
			float rxyz = (rx2 + ry2) + rz2;

			float d = sqrt(rxyz);
			float id = 1.0f / d;
			float id2 = id * id;
			float idmass = mass * id;
			float delta_acc = idmass * id2;

			float inc_x = r.x * delta_acc;
			float inc_y = r.y * delta_acc;
			float inc_z = r.z * delta_acc;

			net_acc.x += inc_x;
			net_acc.y += inc_y;
			net_acc.z += inc_z;
		}
		particles[i].acc.x += net_acc.x;
		particles[i].acc.y += net_acc.y;
		particles[i].acc.z += net_acc.z;
	}
}

/*
 * Randomly initialize an array of particles
 */
void particle3_rand_init(particle3_t *particles){
	srand(time(NULL));
	double irm = 1.0f / (double) RAND_MAX;
	double scale_factor = irm * 1.1f;
	for(int i = 0; i < PARTICLES; i++){
		double rposx = rand();
		double rposy = rand();
		double rposz = rand();

		double rvelx = rand();
		double rvely = rand();
		double rvelz = rand();

		double raccx = rand();
		double raccy = rand();
		double raccz = rand();

		particles[i].pos.x = rposx * scale_factor;
		particles[i].pos.y = rposy * scale_factor;
		particles[i].pos.z = rposz * scale_factor;

		particles[i].vel.x = rvelx * scale_factor;
		particles[i].vel.y = rvely * scale_factor;
		particles[i].vel.z = rvelz * scale_factor;

		particles[i].acc.x = raccx * scale_factor;
		particles[i].acc.y = raccy * scale_factor;
		particles[i].acc.z = raccz * scale_factor;
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
