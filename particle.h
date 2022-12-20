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
} particle3_t

/*
 * Return the gravitational force between two particles
 */
double particle3_gravitational_force(particle3_t *p1, particle3_t *p2):

#endif	/* PARTICLE_H */