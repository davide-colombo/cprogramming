
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "particle.h"

/*
 * Gravitational force between two particles.
 */
void particle3_gravitational_force(particle3_t *particles, double mass){
	for(int i = 0; i < PARTICLES; i++){
		float3_t net_acc;
		net_acc.x = net_acc.y = net_acc.z = 0;
		for(int j = 0; j < PARTICLES; j++){
			float3_t r;
			r.x = particles[j].pos.x - particles[i].pos.x;
			r.y = particles[j].pos.y - particles[i].pos.y;
			r.z = particles[j].pos.z - particles[i].pos.z;
			double d = sqrt( (r.x * r.x) + (r.y * r.y) + (r.z * r.z) );
			double id = 1.0f / d;
			double id2 = id * id;
			double idmass = mass * id;
			double delta_acc = idmass * id2;
			printf("d = %.4f\tid = %.4f\tid2 = %.4f\tidmass = %.4f\tdelta = %.4f\n", d, id, id2, idmass, delta_acc);
			double inc_x = r.x * delta_acc;
			double inc_y = r.y * delta_acc;
			double inc_z = r.z * delta_acc;
			printf("inc_x = %.4f\tinc_y = %.4f\tinc_z = %.4f\n",\
					inc_x, inc_y, inc_z);
			net_acc.x += inc_x;
			net_acc.y += inc_y;
			net_acc.z += inc_z;
			printf("net_acc.x = %.8f\tnet_acc.y = %.8f\tnet_acc.z = %.8f\n", \
					net_acc.x, net_acc.y, net_acc.z);
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
//	double irm_scaled_10 = irm * 10.0f;
//	double irm_scaled_12 = irm * 12.0f;
//	double irm_scaled_8 = irm * 8.0f;
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
