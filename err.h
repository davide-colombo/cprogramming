/*
 * Define error and success status code and data types.
 */
#ifndef ERR_H
#define ERR_H

#include <stdint.h>

/*
 * Error data type.
 *
 * Every function in the project should return a value of this type.
 *
 * The possible values are defined below by the #define directive.
 *
 * There is room for 256 integer code from 0 to 255.
 *
 * The code space is divided into two using the most significant bit:
 *
 * 0, success code
 * 1, error code
 *
 * This may be changed in future extension without problems since the #define 
 * directive provide an abstraction layer to hide the implementation details 
 * of the error code convention.
 */
typedef uint8_t err_t;


#define SUCC_ALLOC		(err_t) 0x00
#define SUCC_FREE		(err_t) 0x01

#define BAD_ALLOC		(err_t) 0x80
#define BAD_FREE		(err_t) 0x81

#endif	/* ERR_H */
