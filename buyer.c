/*
 * The buyer module
 */

#include <stdlib.h>
#include "buyer.h"

/*
 * Allocate memory for n objects of the type given by **bptr.
 * Return SUCC_ALLOC if *bptr points to a valid memory location after the call 
 * to malloc, otherwise BAD_ALLOC.
 */
err_t buyer_alloc(buyer8_t **bptr, size_t n){
	n 			*= sizeof **bptr;
	*bptr		= malloc(n);
	err_t ret	= (*bptr) ? SUCC_ALLOC : BAD_ALLOC;
	return ret;
}

/*
 * Free the memory pointed to by *bptr.
 * Return SUCC_FREE if pointer is not NULL, otherwise BAD_FREE.
 */
err_t buyer_free(buyer8_t **bptr){
	err_t ret = (*bptr) ? SUCC_FREE : BAD_FREE;
	free(*bptr);
	return ret;
}
