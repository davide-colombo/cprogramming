#include <stdio.h>
#include <stdbool.h>
#include <stdalign.h>
#include <time.h>
#include <stdlib.h>

#define NUMBER_OF_ORDERS 1000
#define NUMBER_OF_BUYERS 5
#define NUMBER_OF_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS / NUMBER_OF_BUYERS)

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
	printf("sizeof(struct order) = %zu\n", sizeof(struct buyer_orders));
	printf("alignof(struct order) = %zu\n", alignof(struct buyer_orders));

//	/*
//	 * Array of buyers name.
//	 *
//	 * This will be stored in the `order` data structure.
//	 *
//	 * There, the 
//	 */
//	const char *buyers[5] = {
//		"buy1", "buy2", "buy3", "buy4", "buy5"
//	};
//
//	/*
//	 * Statically allocate an array of orders
//	 *
//	 * order == &order[0]
//	 *
//	 */
//	struct order orders[NUMBER_OF_ORDERS];
//
//	/*
//	 * Initialize pseudo-random number generator to make the result 
//	 * reproducible.
//	 */
//	srand(time(NULL));
//	
//	/*
//	 * Record the start of the initialization
//	 */
//	clock_t start_clock, end_clock;
//	start_clock = clock();
//	/*
//	 * Initialize the array of orders
//	 */
//	for(int i = 0; i < NUMBER_OF_ORDERS; ++i) {
//		/*
//		 * Generate a random number between 0 and 1 then scale it between 10.0 
//		 * and 1010.0
//		 */
//		orders[i].price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;
//
//		/*
//		 * Paid if `tmp >= 0.5`, otherwise not paid.
//		 *
//		 * Since a new random value is generated this has the benefit of 
//		 * totally decoupling the generation of order price to the paid value.
//		 */
//		double tmp = ( rand() / (double)RAND_MAX);
//		orders[i].paid = ( tmp >= 0.5 ) ? true : false;
//
//		/*
//		 * Initialize buyer names
//		 */
//		for(int b = 0; b < NUMBER_OF_BUYERS; ++b) {
//			orders[i].buyer[b] = buyers[b];
//		}
//		
//		long tmp_id = (long)(( rand() / (double)RAND_MAX ) * NUMBER_OF_BUYERS);
//		orders[i].buyer_id = tmp_id;
//	}
//
//	end_clock = clock();
//	unsigned long elapsed_clock = (end_clock - start_clock);
//	printf("CLOCKS_PER_SEC = %lu\n", (unsigned long)CLOCKS_PER_SEC);
//	printf("elapsed_clock = %lu\n", elapsed_clock);
//
//	/*
//	 * Measure how much time it takes to compute the total amount of paid and 
//	 * not-paid orders.
//	 */
//	start_clock = clock();
//
//	/*
//	 * Sum paid orders for each buyer ID
//	 */
//	for(long j = 0; j < NUMBER_OF_BUYERS; ++j) {
//		printf("[`buyer_id` = %ld]\ttotal paid = %.4f\n", j, _order_sum_paidd(orders, j));
//		printf("[`buyer_id` = %ld]\ttotal NOT paid = %.4f\n", j, _order_sum_notpaidd(orders, j));
//	}
//
//	end_clock = clock();
//	elapsed_clock = (end_clock - start_clock);
//	printf("elapsed_clock = %lu\n", elapsed_clock);

	return 0;
}
