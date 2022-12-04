#include <stdio.h>
#include <stdbool.h>
#include <stdalign.h>
#include <time.h>
#include <stdlib.h>

#define NUMBER_OF_ORDERS 1000
#define NUMBER_OF_BUYERS 5

/*
 * Demonstrating cache locality and how to improve it.
 *
 * Data structure is 8 bytes aligned.
 */
struct order {
	double price;							// 8 bytes
	bool paid;								// 1 byte (+ 7 bytes padding)
	const char *buyer[NUMBER_OF_BUYERS];	// 5 * 8 bytes
	long buyer_id;							// 8 bytes
};

/*
 * Sum the price of all the paid orders corresponding to the buyer_id
 *
 * struct order * => 8 bytes
 *
 * waste 8 bytes in the stack frame (16 bytes aligned)
 */
double _order_sum_paidd(struct order *o, long buyer_id) {
	double sum = 0;
	for(int i = 0; i < NUMBER_OF_ORDERS; ++i) {
		if(o[i].buyer_id == buyer_id && o[i].paid) {
			sum += o[i].price;
		}
	}
	return sum;
}

/*
 * Sum the price of all the unpaid orders corresponding to the buyer_id
 *
 * struct order * => 8 bytes
 *
 * waste 8 bytes in the stack frame (16 bytes aligned)
 */
double _order_sum_notpaidd(struct order *o, long buyer_id) {
	double sum = 0;
	for(int i = 0; i < NUMBER_OF_ORDERS; ++i) {
		if(o[i].buyer_id == buyer_id && !o[i].paid) {
			sum += o[i].price;
		}
	}
	return sum;
}


int main(int argc, char** argv) {
	/*
	 * 64 bytes on an 8 bytes alignment
	 *
	 * 4 items aligned on a memory address required to be a multiple of the 
	 *   largest data type in the `struct` (8 bytes).
	 *
	 */
	printf("sizeof(struct order) = %zu\n", sizeof(struct order));
	printf("alignof(struct order) = %zu\n", alignof(struct order));

	/*
	 * Array of buyers name.
	 *
	 * This will be stored in the `order` data structure.
	 *
	 * There, the 
	 */
	const char *buyers[5] = {
		"buy1", "buy2", "buy3", "buy4", "buy5"
	};

	/*
	 * Statically allocate an array of orders
	 *
	 * order == &order[0]
	 *
	 */
	struct order orders[NUMBER_OF_ORDERS];

	/*
	 * Initialize pseudo-random number generator to make the result 
	 * reproducible.
	 */
	srand(time(NULL));

	/*
	 * Initialize the array of orders
	 */
	for(int i = 0; i < NUMBER_OF_ORDERS; ++i) {
		/*
		 * Generate a random number between 0 and 1 then scale it between 10.0 
		 * and 1010.0
		 */
		orders[i].price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;

		/*
		 * Paid if `tmp >= 0.5`, otherwise not paid.
		 *
		 * Since a new random value is generated this has the benefit of 
		 * totally decoupling the generation of order price to the paid value.
		 */
		double tmp = ( rand() / (double)RAND_MAX);
		orders[i].paid = ( tmp >= 0.5 ) ? true : false;

		/*
		 * Initialize buyer names
		 */
		for(int b = 0; b < NUMBER_OF_BUYERS; ++b) {
			orders[i].buyer[b] = buyers[b];
		}
		
		long tmp_id = (long)(( rand() / (double)RAND_MAX ) * NUMBER_OF_BUYERS);
		orders[i].buyer_id = tmp_id;
	}

	/*
	 * Sum paid orders for each buyer ID
	 */
	for(long j = 0; j < NUMBER_OF_BUYERS; ++j) {
		printf("[`buyer_id` = %ld]\ttotal paid = %.4f\n", j, _order_sum_paidd(orders, j));
		printf("[`buyer_id` = %ld]\ttotal NOT paid = %.4f\n", j, _order_sum_notpaidd(orders, j));
	}

	return 0;
}
