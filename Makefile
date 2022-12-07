
all: order order.s

order: order.c
	clang -Wgnu-alignof-expression order.c -o order

order.s: order.c
	clang -S order.c -o order.s

clean:
	rm -f order.s order
