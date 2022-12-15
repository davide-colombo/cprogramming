
all: loops loops.s

loops: loops.c
	clang loops.c -o loops

loops.s: loops.c
	clang -S loops.c -o loops.s

clean:
	rm -f loops loops.s