/*
 * An example of writing cache friendly data structures.
 *
 * We have a set of buyers, each one may have a number of paid and unpaid 
 * orders associated.
 *
 * The idea is to compute the sum of the price of both paid and unpaid orders.
 *
 */

#include <stdlib.h>
#include "order.h"

err_t order_alloc(order4_t **optr, size_t n){
	n *= sizeof **optr;
	*optr = malloc(n);
	err_t ret = (*optr) ? SUCC_ALLOC : BAD_ALLOC;
	return ret;
}

err_t order_free(order4_t **optr){
	if(*optr == NULL){
		return BAD_FREE;
	}
	free(*optr);
	return SUCC_FREE;
}

/*
 * Alloc memory for an array of pointers to `order4_t`
 */
err_t order_head_alloc(order4_t ***optr, size_t n){
	n *= sizeof **optr;
	*optr = malloc(n);
	err_t ret = (*optr) ? SUCC_ALLOC : BAD_ALLOC;
	return ret;
}

/*
 * Deallocate memory for an array of pointers to `order4_t`.
 * Need to free the array of `order4_t` items before freeing the pointer to 
 * the array.
 */
err_t order_head_free(order4_t ***optr){
	if(*optr == NULL){
		return BAD_FREE;
	}

	err_t ret;
	for(order4_t **tmp = *optr; tmp != NULL; tmp++){
		ret &= order_free(tmp);
	}

	free(*optr);
	return ret;			// here it does not make a difference to return 
						// `ret` or `ret & SUCC_FREE`
}
