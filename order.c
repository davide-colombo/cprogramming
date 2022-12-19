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
	err_t ret = (*optr) ? SUCC_FREE : BAD_FREE;
	free(*optr);
	return ret;
}

/*
 * Alloc memory for an array of pointers to `order4_t`
 */
err_t order_head_alloc(order4_t **optr, size_t n){
	n *= sizeof *optr;
	optr = malloc(n);
	err_t ret = (optr) ? SUCC_ALLOC : BAD_ALLOC;
	return ret;
}

/*
 * Deallocate memory for an array of pointers to `order4_t`.
 * Need to free the array of `order4_t` items before freeing the pointer to 
 * the array.
 */
err_t order_head_free(order4_t **optr){
	err_t ret = order_free(optr);
	err_t ret1 = (optr) ? SUCC_FREE : BAD_FREE;
	free(optr);
	return (ret & ret1);
}
