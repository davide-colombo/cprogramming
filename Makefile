
all: loops loops.s

loops: loops.c
	clang loops.c -o loops -std=c99 -fstrict-aliasing

loops.s: loops.c
	clang -S loops.c -o loops.s -std=c99 -fstrict-aliasing

clean:
	rm -f loops loops.s