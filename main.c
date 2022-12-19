
#include <stdio.h>
#include "err.h"
#include "buyer.h"
#include "order.h"

int main(int argc, char *argv[]){
	err_t err;

	buyer8_t *buyers = NULL;
	err = buyer_alloc(&buyers, 100);
	if( err == BAD_ALLOC){
		fprintf(stderr, "Bad alloc for buyers\n");
		return 1;
	}

	printf("&buyers = %p\tbuyers = %p\tbuyers->id = %llu\n", &buyers, buyers, buyers->id);

	/*
	 * Everything fine, release memory
	 */
	buyer_free(&buyers);

	return 0;
}
