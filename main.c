
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>

#include "err.h"
#include "buyer.h"
#include "order.h"

#define TEST_N_BUYERS 100
#define TEST_N_ORDERS 50

int main(int argc, char *argv[]){

	srand(time(NULL));

	err_t err;

	buyer8_t *buyers = NULL;
	err = buyer_alloc(&buyers, TEST_N_BUYERS);
	if( err == BAD_ALLOC){
		fprintf(stderr, "Bad alloc for buyers\n");
		return 1;
	}

	printf("&buyers = %p\tbuyers = %p\tbuyers->id = %llu\n", &buyers, buyers, buyers->id);

	order4_t **paid_orders_head = NULL;
	err = order_head_alloc(&paid_orders_head, TEST_N_BUYERS);
	if( err == BAD_ALLOC ){
		fprintf(stderr, "Bad alloc for paid orders head\n");
		buyer_free(&buyers);
		return 1;
	}

	
	double c = 1.0f / (double)RAND_MAX;

	order4_t *optr = NULL;
	for(uint64_t i = 0; i < TEST_N_BUYERS; i++){
		/*
		 * Assign buyer ID
		 * This is used to retrieve the array of orders that corresponds to 
		 * this buyer
		 */
		buyers->id = i;

		/*
		 * optr contains the memory address of the first item in the array of 
		 * orders
		 */
		err = order_alloc(&optr, TEST_N_ORDERS);
		if( err == BAD_ALLOC ){
			fprintf(stderr, "Bad alloc for paid orders array %llu\n", i);
			buyer_free(&buyers);
			order_head_free(&paid_orders_head);
			return 1;
		}

		for(uint64_t j = 0; j < TEST_N_ORDERS; j++){
			double r = rand();
			double p = r * c;
			double p1 = p * 1000.0f;
			(optr+j)->price = p1;
		}

		/*
		 * Assign the starting memory address of the array of paid orders to 
		 * the memory of head pointers.
		 */
		paid_orders_head[i] = optr;
	}

	/*
	 * Everything fine, release memory
	 */
	buyer_free(&buyers);

	return 0;
}
