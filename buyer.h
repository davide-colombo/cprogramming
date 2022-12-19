
#ifndef BUYER_H
#define BUYER_H

#include <stdio.h>
#include <stdint.h>
#include "err.h"

#define MAX_BUYERS 1024

// 8-byte size and alignment
typedef struct buyer8 {
	uint64_t id;
} buyer8_t;

/*
 * Interface to dynamically allocate memory for "n" objects of type 
 * "buyer8_t".
 *
 * If memory allocation fails "BAD_ALLOC" error code is returned and the value 
 * pointed to by `bptr` is not touched.
 *
 * If memory allocation succeeds "SUCC_ALLOC" code is returned and the value 
 * pointed to by `bptr` is the starting memory address of the dynamically 
 * allocated memory.
 *
 * The caller MUST REMEMBER TO CALL the opposite function `buyer_free()` to 
 * release memory as soon as it is no longer needed.
 *
 */
err_t buyer_alloc(buyer8_t **bptr, size_t n);

/*
 * Release previously dynamically allocated memory pointed to by "bptr" 
 * pointer.
 */
err_t buyer_free(buyer8_t **bptr);


#endif	/* BUYER_H */