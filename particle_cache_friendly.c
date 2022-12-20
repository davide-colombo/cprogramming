
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "particle_cache_friendly.h"

void particle3_cache_friendly_grav_force(particle_acc3_t *acc, particle_pos3_t *pos, float mass){
	for(int i = 0; i < PARTICLES; i++){
		particle_pos3_t ipos = pos[i];
		float iposx = ipos.x;
		float iposy = ipos.y;
		float iposz = ipos.z;

		float3_t net_acc;
		net_acc.x = net_acc.y = net_acc.z = 0;
		for(int j = 0; j < PARTICLES; j++){
			particle_pos3_t jpos = pos[j];
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
		particle_acc3_t iacc = acc[i];
		iacc.x += net_acc.x;
		iacc.y += net_acc.y;
		iacc.z += net_acc.z;
	}
}

void particle3_cache_friendly_rand_init_pos3(particle_pos3_t *pos, double scale, double shift){
	srand(time(NULL));
	double irm = 1.0f / (double) RAND_MAX;
	scale *= irm;
	shift *= irm;
	for(int i = 0; i < PARTICLES; i++){
		particle_pos3_t ipos = pos[i];

		double rxsl = rand() * scale;
		double rysl = rand() * scale;
		double rzsl = rand() * scale;

		double rxsh = rand() * shift;
		double rysh = rand() * shift;
		double rzsh = rand() * shift;

		ipos.x = rxsl + rxsh;
		ipos.y = rysl + rysh;
		ipos.z = rzsl + rzsh;
	}
}

void particle3_cache_friendly_rand_init_acc3(particle_acc3_t *acc, double scale, double shift){
	srand(time(NULL));
	double irm = 1.0f / (double) RAND_MAX;
	scale *= irm;
	shift *= irm;
	for(int i = 0; i < PARTICLES; i++){
		particle_acc3_t ipos = acc[i];

		double rxsl = rand() * scale;
		double rysl = rand() * scale;
		double rzsl = rand() * scale;

		double rxsh = rand() * shift;
		double rysh = rand() * shift;
		double rzsh = rand() * shift;

		iacc.x = rxsl + rxsh;
		iacc.y = rysl + rysh;
		iacc.z = rzsl + rzsh;
	}

}
