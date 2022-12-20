
#ifndef MATRIX_H_INCLUDED
#define MATRIX_H_INCLUDED

#define NROWS 10
#define NCOLS 10

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
typedef number_t vector2_t[NROWS][NCOLS];

// ===========================================================================
// COMPUTATIONAL PROCEDURES
// ===========================================================================

/*
 * Print the content of the 2d vector item
 */
void vector2_print_vector2_data(vector2_t vec2);

/*
 * Print vector2_t data type size and alignment
 */
void vector2_print_vector2_type_info();

/*
 * Randomly initialize the 2d vector
 */
void vector2_rand_init_vector2(vector2_t vec2, double scale, double shift);

/*
 * Add 2 two-dimensional vectors together
 */
void vector2_add(vector2_t out, vector2_t v1, vector2_t v2);

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
 * Alloc memory for a vec2 object
 */
vector2_t *vector2_alloc_vector2();

/*
 * Free memory for a vec2 object
 */
void vector2_free_vector2(vector2_t *v);

#endif