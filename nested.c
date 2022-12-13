
#include <stdio.h>
#include <time.h>

/*
 * Nested for loop optimization
 */
#define NROWS 10000
#define NCOLS 10000

#define CACHE_LINE_SIZE 128

/*
 * The division does not need to be converted because the size of an integer 
 * is a multiple of 2.
 */
#define SM ( CACHE_LINE_SIZE / sizeof(int) )

int ia[NROWS][NCOLS];

/*
 * 1 - declare INDUCTION VARIABLES outside the for loop.
 * 2 - since `ia` is a statically allocated GLOBAL array, it means that every 
 *   time the memory page associated to the variable must be loaded.
 * 3 - split the problem into subproblems to increase cache locality.
 * 4 - unroll the inner loop; try to reduce the number of iterations (i.e., 
 *   the number of times the condition is evaluated).
 * 5 - try to increased parallelism with software pipelining.
 */

void _loop_rowise_optim_internal_column(int *row0, int *row4){
	int unrolled_iterations = (NCOLS >> 4);
	int col0 = 0;
	int col4 = 4;
	int col8 = 8;
	int col12 = 12;
	do{
		do{
			row0[col0] = 1;
			row0[col4] = 1;
			row0[col8] = 1;
			row0[col12] = 1;

			row4[col0] = 1;
			row4[col4] = 1;
			row4[col8] = 1;
			row4[col12] = 1;

			col0 += 1;
			col4 += 1;
			col8 += 1;
			col12 += 1;
		}while( (col0 & 3) != 0 );
			col0 += 12;
			col4 += 12;
			col8 += 12;
			col12 += 12;
		unrolled_iterations -= 1;
	}while(unrolled_iterations);

	if( (NCOLS & 15) ){
		int residual_iterations = (NCOLS & 15);
		do{
			row0[col0] = 1;
			row0[col4] = 1;
			row0[col8] = 1;
			row0[col12] = 1;

			row4[col0] = 1;
			row4[col4] = 1;
			row4[col8] = 1;
			row4[col12] = 1;

			col0 += 1;
			col4 += 1;
			col8 += 1;
			col12 += 1;
			residual_iterations -= 1;
		}while(residual_iterations);
	}
}

void _loop_rowise_optim(int (*ia32)[NCOLS]) {
	int unrolled_rowiter = (NROWS >> 3);
	int row = 0;
	do{
		do{
			_loop_rowise_optim_internal_column(&ia32[row][0], &ia32[row+4][0]);
			row += 1;
		}while( (row & 3) != 0 );
		row += 4;
		unrolled_rowiter -= 1;
	}while(unrolled_rowiter);

	if( (NROWS & 7) ){
		int residual_rowiter = (NROWS & 7);
		do{
			_loop_rowise_optim_internal_column(&ia32[row][0], &ia32[row+4][0]);
			row += 1;
			residual_rowiter -= 1;
		}while(residual_rowiter);
	}
}


void _loop_colwise() {
	int i, j;
	for(j = 0; j < NROWS; j++) {
		for(i = 0; i < NCOLS; i++) {
			ia[i][j] = 1;
		}
	}
}


void _loop_rowise_baseline(){
	int i, j;
	for(j = 0; j < NROWS; j++) {
		for(i = 0; i < NCOLS; i++) {
			ia[j][i] = 1;
		}
	}
}



int main(int argc, char **argv) {
	clock_t start, end;
	start = clock();
	_loop_rowise_optim(&ia[0]);
	//_loop_rowise_baseline();
	end = clock();
	double elapsed = (end - start) / (double) CLOCKS_PER_SEC;
	printf("Elapsed = %.20lf\n", elapsed);
/*
	int *ptr = &ia[0][0];
	for(int i = 0; i < NROWS; i++) {
		printf("ia[%d][...] = ", i);
		for(int j = 0; j < NCOLS; j++) {
			printf("%d ", *(ptr+i+j));
		}
		printf("\n");
	}
*/
	return 0;
}