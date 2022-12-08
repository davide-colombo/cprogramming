
lp.s: lp.c
	clang -S -fstack-usage lp.c

clean:
	rm -f lp.s lp.su
