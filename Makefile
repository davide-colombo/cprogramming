
all: order order.s

order: order.c
	clang -O2 -Wgnu-alignof-expression order.c -o order

order.s: order.c
	clang -O2 -S order.c -o order.s

clean:
	rm -f order.s order
