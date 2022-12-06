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
	struct order *o_end;		// 8 bytes
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
 * Arguments:
 * struct orders * => 8 bytes
 *
 * Local variables:
 * double => 8 bytes
 *
 * One full stack frame (16 bytes)
 */
double _order_sum_priced(struct orders *optr) {
	double sum = 0;
	for(struct order *o_init = optr->o_init; o_init < optr->o_end; ++o_init) {
		sum += o_init->price;
	}
	return sum;
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
void _order_aligned_alloc_array_of_orders(struct orders **optr, size_t nel)
{
	assert( nel != 0 );
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

	/*
	 * Compute the total amount of memory to be allocated
	 */
	struct orders *container = *optr;
	size_t tot = (sizeof *(container->o_init)) * nel;

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
	container->o_init = aligned_alloc(CACHE_LINE_SIZE, tot);
	if( container->o_init == NULL ) {
		// FREE ALL THE DYNAMIC ALLOCATED MEMORY!!!
		free(*optr);
		fprintf(stderr, "aligned_alloc(%d, %zu) failed", CACHE_LINE_SIZE, tot);
		// CALL TO EXIT?
	}
	assert(container->o_init != NULL);		// can be removed in future
	/*
	 * NOTE:
	 *
	 * If given the `nel` value passed to the function the `tot` amount of 
	 * bytes is not a multiple of `CACHE_LINE_SIZE` the true NUMBER OF 
	 * ELEMENTS allocated are more than `nel`!!
	 *
	 * However, this is transparent to the user and the return value is the 
	 * actual number of elements requested by the user.
	 */
	container->o_end = (container->o_init) + nel;

	/*
	 * Initialize the array of orders pointed to by the container.
	 */
	for (struct order *o_init = container->o_init; o_init < container->o_end; ++o_init) {
		o_init->price = ((rand() / (double)RAND_MAX) * 1000.0) + 10.0;
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
		 * */
		_order_aligned_alloc_array_of_orders(po_ptr, NUMBER_OF_PAID_ORDERS_PER_BUYER);

		/*
		 * Array of unpaid orders
		 */
		_order_aligned_alloc_array_of_orders(uo_ptr, NUMBER_OF_UNPAID_ORDERS_PER_BUYER);
	}

	end_clock = clock();
	unsigned long elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/*
	 * Measuring computations
	 */
	start_clock = clock();
	for(struct buyer_orders *bo_init = orders_per_buyer; bo_init < bo_end; ++bo_init) {
		_order_sum_priced(bo_init->paid_orders);
		_order_sum_priced(bo_init->unpaid_orders);
	}

	end_clock = clock();
	elapsed_clock = (end_clock - start_clock);
	printf("elapsed_clock = %lu\n", elapsed_clock);

	/* PRINT THE RESULTS */

	return 0;
}
