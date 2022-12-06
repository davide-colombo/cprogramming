#include <stdio.h>
#include <stdbool.h>
#include <stdalign.h>
#include <time.h>
#include <stdlib.h>
#include <assert.h>

#define NUMBER_OF_ORDERS 1000
#define NUMBER_OF_BUYERS 5
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
 * The buyer is not necessary to make computations on the orders.
 *
 * Add 8 bytes padding to make the an element a divisor of `CACHE_LINE_SIZE`.
 */
struct buyer_orders {
	long buyer_id;						// 8 bytes
	struct order *paid_orders;			// 8 bytes
	struct order *unpaid_orders;		// 8 bytes
	char pad[8];						// 8 bytes
};

/*
 * stack frame 16 bytes
 * first arg => 8 bytes
 * second arg => 8 bytes
 *
 * Local variable
 * result => 8 bytes
 *
 */
double _order_sum_priced(struct order *orders, size_t nel) {
	double sum = 0;
	struct order tmp;
	for(size_t i = 0; i < nel; ++i) {
		/*
		 * Using the temporary variable increases the data access prediction.
		 */
		tmp = orders[i];
		sum += tmp.price;
	}
	return sum;
}

/*
 * Allocate aligned memory for array of orders.
 *
 * Returned memory address is a multiple of `CACHE_LINE_SIZE`.
 *
 * The size MUST be a multiple of the `CACHE_LINE_SIZE`.
 *
 * Arguments:
 * struct order * => 8 bytes
 * size_t => 8 bytes
 *
 * Local variables:
 * size_t => 8 bytes
 *
 * Two stack frames (24/32 bytes)
 *
 * Return the pointer to the last element in the array according to the 
 * requested number of elements (`nel`).
 *
 * The allocated memory may be greater to ensure the requested size is a 
 * multiple of `CACHE_LINE_SIZE`.
 */
struct order *_order_aligned_alloc_array_of_orders(struct order **orders, size_t nel)
{
	assert( nel != 0 );
	/*
	 * Compute the total amount of memory to be allocated
	 */
	size_t tot = (sizeof **orders) * nel;

	/*
	 * If the total memory bytes are not a multiple of `CACHE_LINE_SIZE` then 
	 * round-up to that value.
	 *
	 * This is crucial otherwise `aligned_alloc()` returns NULL.
	 */
	if( FAST_X_MOD_CACHELINE(tot) != 0 ) {
		tot = ROUND_UP_TO_CACHELINE(tot);
	}
	assert( FAST_X_MOD_CACHELINE(tot) == 0 );

	/*
	 * Aligned alloc memory for array of orders
	 */
	*orders = aligned_alloc(CACHE_LINE_SIZE, tot);
	if( *orders == NULL ) {
		// FREE ALL THE DYNAMIC ALLOCATED MEMORY!!!
		fprintf(stderr, "aligned_alloc(%d, %zu) failed", CACHE_LINE_SIZE, tot);
		// CALL TO EXIT?
	}
	assert(*orders != NULL);		// can be removed in future
	/*
	 * Return the number of requested elements.
	 *
	 * NOTE:
	 *
	 * If given the `nel` value passed to the function the `tot` amount of 
	 * bytes is not a multiple of `CACHE_LINE_SIZE` the true NUMBER OF 
	 * ELEMENTS allocated are more than `nel`!!
	 *
	 * However, this is transparent to the user and the return value is the 
	 * actual number of elements requested by the user.
	 */
	return (*orders)+nel;
}

/*
 * Perform initialization of array of orders
 */
void _order_init_array_of_orders(struct order **orders, struct order *o_end) {
	for (struct order *o_init = *orders; o_init < o_end; ++o_init) {
		o_init->price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;
	}
}

// ===========================================================================

/*
 * Static array to store array of paid/unpaid orders of each buyer.
 */
struct buyer_orders orders_per_buyer[NUMBER_OF_BUYERS] \
	__attribute__(( aligned(CACHE_LINE_SIZE)));

/*
 * Fixed memory address of the end of the array.
 *
 * This speeds up the loop over orders per buyer array.
 */
struct buyer_orders *bo_end = orders_per_buyer+NUMBER_OF_BUYERS;

/*
 * Global variable to store the temporal reference to the array of orders
 *
 * 8 bytes + 8 bytes
 */
struct order **po_ptr;
struct order **uo_ptr;

/*
 * Buyer id counter
 */
unsigned long id = 0;

// ===========================================================================

int main(int argc, char** argv) {
	printf("alignof(orders_per_buyer) = %zu\n", _Alignof(orders_per_buyer));
	printf("alignof(bo_end) = %zu\n", _Alignof(bo_end));
	printf("alignof(po_ptr) = %zu\n", _Alignof(po_ptr));
	printf("alignof(uo_ptr) = %zu\n", _Alignof(uo_ptr));

	printf("sizeof(orders_per_buyer) = %zu\n", sizeof(orders_per_buyer));
	printf("sizeof(bo_end) = %zu\n", sizeof(bo_end));
	printf("sizeof(po_ptr) = %zu\n", sizeof(po_ptr));
	printf("sizeof(uo_ptr) = %zu\n", sizeof(uo_ptr));
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
	 * Initialize the array of orders
	 */
	struct order *o_end;
	for(struct buyer_orders *bo_init = orders_per_buyer; bo_init < bo_end; ++bo_init) {
		/*
		 * This helps the CPU to understand the data access pattern and can be 
		 * more efficient in prefetching data.
		 */
		bo_init->buyer_id = ++id;
		po_ptr = &(bo_init->paid_orders);
		uo_ptr = &(bo_init->unpaid_orders);

		o_end = _order_aligned_alloc_array_of_orders(po_ptr, NUMBER_OF_PAID_ORDERS_PER_BUYER);
		_order_init_array_of_orders(po_ptr, o_end);

		o_end = _order_aligned_alloc_array_of_orders(uo_ptr, NUMBER_OF_UNPAID_ORDERS_PER_BUYER);
		_order_init_array_of_orders(uo_ptr, o_end);
	}

	end_clock = clock();
	unsigned long elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/*
	 * Measuring computations
	 */
	start_clock = clock();
	for(struct buyer_orders *bo_init = orders_per_buyer; bo_init < bo_end; ++bo_init)
	{
		/*
		 * This seems inefficient but in reality allows the CPU to understand 
		 * that there is a pattern in accessing the data, so prefetching can 
		 * be done.
		 */
		_order_sum_priced(bo_init->paid_orders, NUMBER_OF_PAID_ORDERS_PER_BUYER);
		_order_sum_priced(bo_init->unpaid_orders, NUMBER_OF_UNPAID_ORDERS_PER_BUYER);
	}

	end_clock = clock();
	elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/* PRINT THE RESULTS */

	return 0;
}
