
#ifndef ORDER_H
#define ORDER_H

#define MAX_ORDERS 1024

/*
 * 4-byte size
 * 4-byte alignment
 */
typedef struct _order {
	float price;
} order;


/*****************************************************************************
 * Worst case scenario of memory resources consumption:
 *
 * 		MAX_BUYERS * 8 bytes = 2^10 * 2^3 = 2^13 (8192 bytes)
 *
 * 		For each buyer:
 * 			MAX_ORDERS * 4 bytes = 2^10 * 2^2 = 2^12 (4096 bytes)
 *
 * Each buyer may have both paid and unpaid orders so the latter computation 
 * leads to 8192 bytes of memory instead of 4096 bytes.
 *
 * Buyers and orders are stored separately to improve data locality and avoid 
 * to mix hot-and-cold data that waste precious cache space.
 *
 * There must be an intermediate array in which are stored the memory 
 * addresses of each order.
 *
 * Since the goal of the program is to keep track of both paid and unpaid 
 * orders there must be two of them.
 *
 * This solution makes the buyers independent from the orders and is also 
 * scalable to any other new kind of information that may be added in future 
 * versions.
 *
 * A pointer on this machine is 8 bytes in size so to keep track of all the 
 * orders associated to all the buyers we need:
 *
 * 		MAX_BUYERS * 8 bytes = 2^10 * 2^3 = 2^13 (8192 bytes)
 *
 * Again, there are two different information we are interested to store, so 
 * we need to multiply that quantity by 2.
 *
 * In total:
 *
 * 8192 bytes (BUYERS) +
 * 4096 bytes (PAID ORDERS/BUYER) +
 * 4096 bytes (UNPAID ORDERS/BUYER) +
 * 8192 bytes (PAID ORDERS HEAD/BUYER) +
 * 8192 bytes (UNPAID ORDERS HEAD/BUYER)
 *
 * 32768 bytes
 *
 * Considerations on the hardware:
 *
 * The L1 data cache installed on this machine is 64 Kbytes (2^16 bytes).
 *
 * A cache line is 128 (2^7) bytes.
 *
 * The cache memory has an associativity of 8 (2^3).
 *
 * We can derive the number of cache sets as:
 *
 * 		64 Kbytes / (128 bytes * 8 bytes) = 64 cache set
 *
 * This means that data stored at a memory address that is a multiple of:
 *
 * 		64 * 128 * 4 = 2^6 * 2^7 * 2^2 = 2^15 (32768 bytes)
 *
 * race for the same cache set!
 *
 * If there are more than 8 items accessed concurrently that are in the same 
 * cache set this will cause cache trashing!
 *
 * NOTE: 4 factor in the above multiplication is to obtain the memory address 
 * since on ARM64 a memory address is 32-bit or 4 bytes.
 *
 * For this program the likelihood of suffering cache trashing is minimal.
 *
 * Given the above specs and data structures we can make considerations on the 
 * cache usage 
 *
 * The array of buyers occupies:
 *
 *		2^13 / 2^7 = 2^6 cache lines
 *
 * Each cache line contains:
 *
 *		2^7 / 2^3 = 2^4 items of the buyer array
 *
 * The same considerations are valid for paid/unpaid orders head.
 *
 * Each buyer may have an array of paid/unpaid orders. Each array may at most 
 * occupy:
 *
 * 		2^12 / 2^7 = 2^5 cache lines
 *
 * Each cache line contains:
 *
 * 		2^7 / 2^2 = 2^5 items of the (paid/unpaid) order array.
 *
 ****************************************************************************/

#endif	/* ORDER_H */
