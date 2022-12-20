
/*
 * A cache-friendly implementation of the particle data structure.
 */
#ifndef PARTICLE_CACHE_FRIENDLY_H
#define PARTICLE_CACHE_FRIENDLY_H

#define PARTICLES 4096

/*
 * 3 dimensional vector
 */
typedef struct _float3{
	float x;
	float y;
	float z;
} float3_t;

typedef float3_t particle_pos3_t;
typedef float3_t particle_vel3_t;
typedef float3_t particle_acc3_t;

/*
 * Procedure to compute the gravitational force between two particles.
 * The position of every particle is passed in `pos`.
 * The acceleration of every particle is passed in `acc`.
 */
void particle3_cache_friendly_grav_force(particle_acc3_t *acc, particle_pos3_t *pos, float mass);

void particle3_cache_friendly_rand_init_pos3(particle_pos3_t *pos, double scale, double shift);
void particle3_cache_friendly_rand_init_acc3(particle_acc3_t *acc, double scale, double shift);

#endif