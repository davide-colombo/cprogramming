#include <stdio.h>
#include <stdbool.h>
#include <stdalign.h>
#include <time.h>
#include <stdlib.h>

#define NUMBER_OF_ORDERS 1000
#define NUMBER_OF_BUYERS 5
#define NUMBER_OF_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS / NUMBER_OF_BUYERS)
#define NUMBER_OF_PAID_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS_PER_BUYER / 2)
#define NUMBER_OF_UNPAID_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS_PER_BUYER - NUMBER_OF_PAID_ORDERS_PER_BUYER)

/*
 * Cache line size
 */
#define CLS 128

/*
 * The goal of this program is to compute the total amount of paid and unpaid 
 * orders for each buyer.
 *
 * Each order is associated to a buyer identifier and has a price.
 *
 * The first implementation (inefficient) of this program relies on a data 
 * structure that packed together buyer identifier, the price of the order and 
 * a boolean flag that is true if the order is paid.
 *
 * This is inefficient for different reasons.
 *
 * The first is the encoding of the boolean flag into the data structure.
 *
 * This is not efficient since it moves the `conditional branch` lower in the 
 * loop that computes the sum of the price.
 *
 * This means that at every loop iteration the program needs to test a 
 * condition and branch.
 *
 * Also consider that the flag is stored as a 1 byte value but only 1 bit 
 * could be used to encode the value true or false.
 *
 * This is already a `smell` of an unoptimal approach.
 *
 * The second inefficiency came from the fact that the buyer identifier is 
 * stored together with the order.
 *
 * The total sum of the orders needs the price, not the buyer's identifier.
 *
 * This is inefficient because it `pollutes` the cache lines with UNNECESSARY 
 * DATA.
 *
 * Even worst when the data structure contains the boolean flag.
 *
 * A better approach should deal with both SPATIAL & TEMPORAL LOCALITY of the 
 * data.
 *
 * To understand how to reorganize the data structure it's important to start 
 * from the question:
 *
 *		`what has to be computed by this program?`
 *
 * To maximize SPATIAL LOCALITY the goal is to pack together data that will be 
 * processed together sequentially.
 *
 * To maximize TEMPORAL LOCALITY the goal is to define a small set of 
 * instructions that can be executed many times sequentially.
 *
 * Since the goal of the program is to compute the total amount of paid and 
 * unpaid orders it is ideal to split the two into different data structures 
 * and associate each of them to the buyer's identifier.
 *
 * This approach ensures both SPATIAL LOCALITY by removing the UNNECESSARY 
 * buyer identifier from the data structure and avoid to polluting the cache 
 * line.
 *
 * Also, it provides a better TEMPORAL LOCALITY since the computation can be 
 * expressed in terms of small number of instructions repeated many times.
 *
 * This solution also avoids to test whether the order is paid or not at every 
 * loop iteration.
 *
 * To recap:
 *
 * 1. pushed out of the loop the `conditional branch` by splitting orders into 
 *    two data structures;
 * 2. move at a higher level of abstraction the KEYWORD used to identify a 
 *    single item of interest (in this example is the buyer identifier).
 *
 */

// ===========================================================================

/*
 * The elements must be aligned on a MEMORY ADDRESS that is a multiple of the 
 * CACHE LINE SIZE.
 *
 * Items of this data structure are loaded into the CACHE for computations.
 *
 * Data structure aligned on 8 bytes boundary with a total size of 8 bytes.
 *
 * With a CACHE LINE SIZE of 128 bytes it's possible to contain 16 orders in 
 * each cache line.
 *
 */
struct order {
	double price;		// 8 bytes
} __attribute__((aligned (CLS) ));

/*
 * The buyer is not necessary to make computations on the orders.
 */
struct buyer_orders {
	long buyer_id;						// 8 bytes
	struct order *paid_orders;			// 8 bytes
	size_t number_of_paid_orders;		// 8 bytes
	struct order *unpaid_orders;		// 8 bytes
	size_t number_of_unpaid_orders;		// 8 bytes
};

/*
 * stack frame 16 bytes
 * 8 bytes allocated for the first argument
 * 8 bytes allocated for the second argument
 * 8 bytes allocated for the local variable
 */
double _order_sum_priced(struct order *orders, size_t number_of_orders) {
	double sum = 0;
	for(size_t i = 0; i < number_of_orders; ++i) {
		sum += orders[i].price;
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
	//printf("sizeof(struct order) = %zu\n", sizeof(struct buyer_orders));
	//printf("alignof(struct order) = %zu\n", alignof(struct buyer_orders));

	/*
	 * Initialize pseudo-random number generator to make the result 
	 * reproducible.
	 */
	srand(time(NULL));

	/*
	 * Record the start of the initialization
	 */
	clock_t start_clock, end_clock;
	start_clock = clock();

	/*
	 * Array of buyers; not aligned to the cache line size;
	 */
	struct buyer_orders orders_per_buyer[NUMBER_OF_BUYERS];
	struct order *ptr = NULL;

	/*
	 * Initialize the array of orders
	 */
	for(unsigned long i = 0; i < NUMBER_OF_BUYERS; ++i) {
		ptr = malloc(sizeof(struct order) * ((size_t)NUMBER_OF_PAID_ORDERS_PER_BUYER));
		if ( ptr == NULL ) {
			fprintf(stderr, "[paid orders] buyer_id = %lu\n", i);
			return -1;
		}

		/*
		 * TODO: optimize loop
		 *
		 * If I end the list with NULL I can remove the field that stores the 
		 * number of paid/unpaid orders from the data structure and squeeze 
		 * out redundancy.
		 */
		for (int j = 0; j < NUMBER_OF_PAID_ORDERS_PER_BUYER; ++j) {
			(ptr+j)->price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;
		}

		/*
		 * IMPORTANT!!!
		 *
		 * Store the value in the data structure before using it to get 
		 * another block of memory.
		 */
		orders_per_buyer[i].paid_orders = ptr;
		ptr = NULL;

		ptr = malloc(sizeof(struct order) * ((size_t)NUMBER_OF_UNPAID_ORDERS_PER_BUYER));
		if( ptr == NULL ) {
			fprintf(stderr, "[unpaid orders] buyer_id = %lu\n", i);
			return -1;
		}
		
		/*
		 * TODO: optimize the loop.
		 */
		for(int j = 0; j < NUMBER_OF_UNPAID_ORDERS_PER_BUYER; ++j) {
			(ptr+j)->price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;
		}

		orders_per_buyer[i].unpaid_orders = ptr;
		orders_per_buyer[i].buyer_id = i;
		orders_per_buyer[i].number_of_paid_orders = NUMBER_OF_PAID_ORDERS_PER_BUYER;
		orders_per_buyer[i].number_of_unpaid_orders = NUMBER_OF_UNPAID_ORDERS_PER_BUYER;
		ptr = NULL;
	}

	end_clock = clock();
	unsigned long elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/*
	 * Measure how much time it takes to compute the total amount of paid and 
	 * not-paid orders.
	 */
	start_clock = clock();

	/*
	 * Sum paid orders for each buyer ID
	 */
	for(unsigned long j = 0; j < NUMBER_OF_BUYERS; ++j) {
		printf("[`buyer_id` = %ld]\ttotal paid = %.4f\n",
			j, 
			_order_sum_priced(
				orders_per_buyer[j].paid_orders, 
				orders_per_buyer[j].number_of_paid_orders
			)
		);
		printf("[`buyer_id` = %ld]\ttotal NOT paid = %.4f\n",
			j, 
			_order_sum_priced(
				orders_per_buyer[j].unpaid_orders, 
				orders_per_buyer[j].number_of_unpaid_orders
			)
		);
	}

	end_clock = clock();
	elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	return 0;
}
