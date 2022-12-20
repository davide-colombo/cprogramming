/*
 * Define particles data structure
 */

#ifndef PARTICLE_H
#define PARTICLE_H

/*
 * The number of particles
 */
#define PARTICLES 4096

/*
 * Three dimensional vector
 */
typedef struct float3{
	float x;
	float y;
	float z;
} float3_t;

/*
 * Particle has position, velocity and acceleration
 */
typedef struct particle3{
	float3_t pos;
	float3_t vel;
	float3_t acc;
} particle3_t;

/*
 * Print float3 data structure size and alignment info
 */
void particle3_print_float3_info();

/*
 * Print particle3 data structure size and alignment info
 */
void particle3_print_particle3_info();

/*
 * Return the gravitational force between two particles
 */
void particle3_gravitational_force(particle3_t *particles, double mass);

/*
 * Initialize an array of particles with a position, velocity and acceleration 
 * as random values between 0.0 and 1.0
 */
void particle3_rand_init(particle3_t *particles);

/*
 * Print position, velocity and acceleration 3D components for every particle 
 * in the array of particles.
 */
void particle3_print(particle3_t *particles);

#endif	/* PARTICLE_H */