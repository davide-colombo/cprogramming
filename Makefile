
all: order order.s

order: order.c
	clang order.c -o order -O2 -std=c99 -fstrict-aliasing

order.s: order.c
	clang -S order.c -o order.s -O2 -std=c99 -fstrict-aliasing

clean:
	rm -f order.s order
