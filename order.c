#include <stdio.h>
#include <stdbool.h>
#include <stdalign.h>

/*
 * Demonstrating cache locality and how to improve it.
 *
 * Data structure is 8 bytes aligned.
 */
struct order {
	double price;			// 8 bytes
	bool paid;				// 1 byte
	const char *buyer[5];	// 5 bytes
	long buyer_id;			// 8 bytes
};

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

	return 0;
}
