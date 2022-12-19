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

