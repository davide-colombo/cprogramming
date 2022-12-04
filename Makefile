
order: order.c
	clang order.c -Wgnu-alignof-expression -o order

order.s: order.c
	clang -S order.c -o order.s

clean:
	rm -f order.s
