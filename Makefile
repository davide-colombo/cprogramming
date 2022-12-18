
all: o1 o1.s

o1: order_v1.c
	clang order_v1.c -o o1 -O2 -std=c99 -fstrict-aliasing

o1.s: order_v1.c
	clang -S order_v1.c -o o1.s -O2 -std=c99 -fstrict-aliasing

order: order.c
	clang order.c -o order -O2 -std=c99 -fstrict-aliasing

order.s: order.c
	clang -S order.c -o order.s -O2 -std=c99 -fstrict-aliasing

clean:
	rm -f order.s order o1.s o1
