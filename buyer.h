
#ifndef BUYER_H
#define BUYER_H

#include <stdint.h>

#define MAX_BUYERS 1024

// 8-byte size and alignment
typedef struct _buyer {
	uint64_t id;
} buyer;


#endif	/* BUYER_H */