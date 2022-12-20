
#ifndef MATRIX_H_INCLUDED
#define MATRIX_H_INCLUDED

#define NROWS 10
#define NCOLS 10

/*
 * Numeric data type
 */
typedef double number_t;

/*
 * Two dimensional vector represented as a 2D array of items
 */
typedef number_t vector2_t[NROWS][NCOLS];


/*
 * Print the content of the 2d vector item
 */
void vector2_print(vector2_t vec2);

/*
 * Randomly initialize the 2d vector
 */
void vector2_rand_init(vector2_t vec2, double scale, double shift);

#endif