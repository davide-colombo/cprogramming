
all: loops loops.s

loops: loops.c
	clang loops.c -o loops -O2 -std=c99 -fstrict-aliasing

loops.s: loops.c
	clang -S loops.c -o loops.s -O2 -std=c99 -fstrict-aliasing

clean:
	rm -f loops loops.s