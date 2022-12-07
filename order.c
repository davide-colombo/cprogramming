#include <stdio.h>
#include <stdbool.h>
#include <stdalign.h>
#include <time.h>
#include <stdlib.h>
#include <assert.h>

#define NUMBER_OF_ORDERS 100000
#define NUMBER_OF_BUYERS 10000
#define NUMBER_OF_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS / NUMBER_OF_BUYERS)
#define NUMBER_OF_PAID_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS_PER_BUYER / 2)
#define NUMBER_OF_UNPAID_ORDERS_PER_BUYER	(NUMBER_OF_ORDERS_PER_BUYER - NUMBER_OF_PAID_ORDERS_PER_BUYER)

/*
 * Cache line size
 */
#define CACHE_LINE_SIZE 128

/*
 * Round `x` to the next multiple of a cache line size.
 *
 * The formula relies on the fact that the size of a cache line is a multiple 
 * of 2.
 *
 * Indeed it exploits the property that 2^i - 1 is a Marsenne number, i.e. a 
 * number with all the bits prior to the i-th position set to 1 and the other 
 * to 0.
 *
 */
#define ROUND_UP_TO_CACHELINE(x) ( ((x) + (CACHE_LINE_SIZE - 1)) & ~(CACHE_LINE_SIZE - 1) )


/*
 * Test whether a number is a multiple of `CACHE_LINE_SIZE`.
 *
 * This can be done efficiently by exploiting the property of Marsenne 
 * numbers.
 */
#define FAST_X_MOD_CACHELINE(x) ( (x) & (CACHE_LINE_SIZE - 1) )

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
 * sizeof = 8 bytes
 * alignof = 8 bytes
 *
 * NOTE: the size of a data type IS ALWAYS a multiple of its alignment.
 *
 * Applicate an alignment equal to CACHE LINE SIZE it means:
 *
 * new sizeof = CACHE LINE SIZE bytes
 * new alignof = CACHE LINE SIZE bytes
 *
 * Enforce an ALIGNMENT that is GREATER THAN the actual size of the data 
 * structure has the SIDE EFFECT of making the data structure occupy much more 
 * memory.
 *
 */
struct order {
	double price;		// 8 bytes
};

/*
 * The purpose of this data structure is to locally store the begin and the 
 * pre-computed end of the array (pointer to the last item in the array) so 
 * that looping through the array can be more efficient.
 *
 * 16 bytes => divisor of `CACHE_LINE_SIZE`
 *
 */
struct orders {
	struct order *o_init;		// 8 bytes
	long delta;					// 8 bytes
};

/*
 * This data structure binds together a buyer to its orders.
 *
 * The orders are split into two sets because the program aims to make 
 * computations on both paid and unpaid orders.
 *
 * This makes the computations faster by increasing the SPATIAL LOCALITY of 
 * the data and remove the needs of a CONDITIONAL BRANCH to test whether the 
 * order is PAID or NOT.
 *
 * Add 8 bytes padding to make the element a divisor of `CACHE_LINE_SIZE`.
 *
 * size before padding => 24 bytes
 * size after padding => 32 bytes
 */
struct buyer_orders {
	long buyer_id;						// 8 bytes
	struct orders *paid_orders;			// 8 bytes
	struct orders *unpaid_orders;		// 8 bytes
	char pad[8];						// 8 bytes
};

/*
 * Compute the sum of the price of all the orders in the array pointed to by 
 * `struct orders *optr`.
 *
 * Since the loop is based on modifying `delta` IT IS WRONG to pass delta by 
 * reference!
 */
double _order_sum_priced(struct order *init, long delta) {
	double sum = 0;
	while( --delta >= 0 ) {
		sum += (init+delta)->price;
	}
	return sum;
}

/*
 * Dynamically alloc memory for the intermediate representation container of 
 * an array of orders.
 *
 * Arguments:
 * struct orders ** => 8 bytes
 */
void _order_alloc_ir_of_orders(struct orders **optr) {
	assert( *optr == NULL );
	/*
	 * Alloc memory dynamically for the intermediate representation data 
	 * structure that holds the array of orders.
	 */
	*optr = malloc(sizeof **optr);
	if( *optr == NULL ) {
		fprintf(stderr, "[ir orders] malloc failed\n");
	}
	assert( *optr != NULL );
}

/*
 * Sometimes it may not be needed to call this function but is very small and 
 * cheap and it's better to call this function ALWAYS then using a conditional 
 * branch to jump to it.
 *
 * Arguments:
 * size_t => 8 byeìtes
 * size_t => 8 bytes
 *
 * One stack frame (16/16 bytes)
 */
size_t _order_get_aligned_memory(size_t nel, size_t sz) {
	//assert( nel > 0 );
	//assert( sz > 0 );
	return ROUND_UP_TO_CACHELINE(nel * sz);
	//assert( FAST_X_MOD_CACHELINE(sz) == 0 );
}

/*
 * Allocate aligned memory for array of orders.
 *
 * Returned memory address is a multiple of `CACHE_LINE_SIZE` (i.e., the 
 * memory address is aligned on the same boundary of `CACHE_LINE_SIZE`).
 *
 * The size MUST be a multiple of the `CACHE_LINE_SIZE`.
 *
 * Arguments:
 * struct orders ** => 8 bytes
 * size_t => 8 bytes
 *
 * Local variables:
 * struct orders * => 8 bytes
 * size_t => 8 bytes
 *
 * Two stack frames (32/32 bytes)
 *
 */
void _order_aligned_alloc_orders(struct orders **optr, size_t aligned_bytes) {
	/*
	 * Dynamically alloc memory for the intermediate representation of the 
	 * array of orders.
	 */
	_order_alloc_ir_of_orders(optr);

	/*
	 * Aligned alloc memory for array of orders
	 */
	(*optr)->o_init = aligned_alloc(CACHE_LINE_SIZE, aligned_bytes);
	if( (*optr)->o_init == NULL ) {
		// FREE ALL THE DYNAMIC ALLOCATED MEMORY!!!
		free(*optr);
		fprintf(stderr, "aligned_alloc(%d, %zu) failed", CACHE_LINE_SIZE, aligned_bytes);
		// CALL TO EXIT?
	}
	//assert(container->o_init != NULL);		// can be removed in future
}

/*
 * Initialize array of orders.
 *
 * Arguments:
 * struct order * => 8 bytes
 * struct order * => 8 bytes
 *
 * One stack frame (16/16 bytes)
 *
 * TODO: optimize the random generation of the prices
 */
void _order_init_array_of_orders(struct order *init, long delta) {
	while( --delta >= 0 ) {
		(init+delta)->price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;
	}
}

// ===========================================================================

/*
 * Static array to store array of paid/unpaid orders of each buyer.
 *
 * Enforce alignment to the cache line size.
 * This would not be efficient if the data structure size and alignment are 
 * not a multiple or a divisor of `CACHE_LINE_SIZE`.
 */
struct buyer_orders orders_per_buyer[NUMBER_OF_BUYERS] \
	__attribute__(( aligned(CACHE_LINE_SIZE) ));

/*
 * Fixed memory address of the end of the array.
 *
 * This speeds up the loop over orders per buyer array.
 */
struct buyer_orders *bo_end = orders_per_buyer+NUMBER_OF_BUYERS;

/*
 * Buyer id counter
 */
unsigned long id = 0;

// ===========================================================================

int main(int argc, char** argv) {
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
	 * Size needed to allocate the array of orders.
	 */
	size_t sz = sizeof(struct order);
	size_t tot_paid = _order_get_aligned_memory(NUMBER_OF_PAID_ORDERS_PER_BUYER, sz);
	size_t tot_unpaid = _order_get_aligned_memory(NUMBER_OF_UNPAID_ORDERS_PER_BUYER, sz);

	/*
	 * Initialize the array of orders
	 */
	struct orders **po_ptr, **uo_ptr;
	for(struct buyer_orders *bo_init = orders_per_buyer; bo_init < bo_end; ++bo_init) {
		/*
		 * This helps the CPU to understand the data access pattern and can be 
		 * more efficient in prefetching data.
		 */
		bo_init->buyer_id = ++id;
		po_ptr = &(bo_init->paid_orders);
		uo_ptr = &(bo_init->unpaid_orders);

		/*
		 * Array of paid orders
		 */
		_order_aligned_alloc_orders(po_ptr, tot_paid);
		(*po_ptr)->delta = NUMBER_OF_PAID_ORDERS_PER_BUYER;
		_order_init_array_of_orders((*po_ptr)->o_init, (*po_ptr)->delta);

		/*
		 * Array of unpaid orders
		 */
		_order_aligned_alloc_orders(uo_ptr, tot_unpaid);
		(*uo_ptr)->delta = NUMBER_OF_UNPAID_ORDERS_PER_BUYER;
		_order_init_array_of_orders((*uo_ptr)->o_init, (*uo_ptr)->delta);
	}

	end_clock = clock();
	unsigned long elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/*
	 * Measuring computations
	 */
	start_clock = clock();
	for(struct buyer_orders *bo_init = orders_per_buyer; bo_init < bo_end; ++bo_init) {
		_order_sum_priced(bo_init->paid_orders->o_init, bo_init->paid_orders->delta);
		_order_sum_priced(bo_init->unpaid_orders->o_init, bo_init->unpaid_orders->delta);
	}

	end_clock = clock();
	elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/* PRINT THE RESULTS */

	return 0;
}
