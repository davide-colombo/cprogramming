
#ifndef MATRIX_H_INCLUDED
#define MATRIX_H_INCLUDED

#define NROWS 4096
#define NCOLS 4096

/* The cache line size in bytes */
#define CLS		(uint32_t) 128

/* The number of items of type "number_t" that fits in a cache line */
#define BLS		(uint32_t) ( CLS / sizeof(number_t) )

/*
 * Numeric data type
 */
typedef double number_t;

/*
 * One dimensional vector with as many items as the number of rows
 */
typedef number_t rowsum1_t[NROWS];

/*
 * One dimensional array with as many items as the number of columns
 */
typedef number_t colsum1_t[NCOLS];

/*
 * Two dimensional vector represented as a 2D array of items
 */
typedef number_t vector2_t[NROWS][NCOLS] __attribute__( (aligned(128)) );

// ===========================================================================
// COMPUTATIONAL PROCEDURES
// ===========================================================================

/*
 * Print the content of the 2d vector item
 */
void vector2_print_vector2_data(vector2_t vec2);

/*
 * Print the content of an object of type rowsum1_t
 */
void vector2_print_rowsum1_data(rowsum1_t v);

/*
 * Print the content of an object of type colsum1_t
 */
void vector2_print_colsum1_data(colsum1_t v);

/*
 * Print vector2_t data type size and alignment
 */
void vector2_print_vector2_type_info();

/*
 * Randomly initialize the 2d vector
 */
void vector2_rand_init_vector2(vector2_t vec2, double scale, double shift);

/*
 * Set each item of an object of type vector2_t to 0
 */
void vector2_zero_init_vector2(vector2_t *v);

/*
 * Add 2 two-dimensional vectors together
 */
void vector2_add(vector2_t out, vector2_t v1, vector2_t v2);

/*
 * Multiply 2 two-dimensional vectors and return the result in "out"
 */
void vector2_mul(vector2_t out, vector2_t v1, vector2_t v2);

/*
 * Multiply 2 two-dimensional vectors and return the result in "out".
 * This version puts the loop over "k" induction variable outside.
 */
void vector2_mul1(vector2_t out, vector2_t v1, vector2_t v2, uint32_t stride);

/*
 * Multiply "v1" by the transpose of "v2" vectors and return the result in 
 * "out"
 */
void vector2_mul_transpose(vector2_t out, vector2_t v1, vector2_t v2);

/*
 * Multiply "v1" by "v2" in a blocks-by-blocks fashion and return the result 
 * in "out".
 *
 * Each block is "stride"x"stride"
 */
void vector2_mul_localized(vector2_t out, vector2_t v1, vector2_t v2, uint32_t stride);

/*
 * Transpose an object of type vector2_t.
 */
void vector2_transpose(vector2_t out, vector2_t v);

/*
 * Compute the sum of the elements on the rows
 */
void vector2_sum_rows(rowsum1_t out, vector2_t v);

/*
 * Return the sum of the elements on the columns
 */
void vector2_sum_cols(colsum1_t out, vector2_t v);

// ===========================================================================
// ALLOCATORS
// ===========================================================================

/*
 * Alloc memory for an object of type "vector2_t"
 */
vector2_t *vector2_alloc_vector2();

/*
 * Alloc memory for an object of type "vector2_t" aligned on a memory that is 
 * a multiple or a divisor of "align_bytes"
 */
vector2_t *vector2_alloc_vector2_aligned(size_t alignment);

/*
 * Free memory previously allocated for an object of type "vector2_t"
 */
void vector2_free_vector2(vector2_t **v);

/*
 * Alloc memory for an object of type "rowsum1_t"
 */
rowsum1_t *vector2_alloc_rowsum1();

/*
 * Free memory previously allocated for an object of type "rowsum1_t"
 */
void vector2_free_rowsum1(rowsum1_t **r);

/*
 * Alloc memory for an object of type "colsum1_t"
 */
colsum1_t *vector2_alloc_colsum1();

/*
 * Free memory previously allocated for an object of type "colsum1_t"
 */
void vector2_free_colsum1(colsum1_t **c);

#endif