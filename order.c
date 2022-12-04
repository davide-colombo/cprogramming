#include <stdio.h>
#include <stdbool.h>

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
	return 0;
}
