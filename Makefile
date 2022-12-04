
order.s: order.c
	clang -S order.c

clean:
	rm -f order.s
