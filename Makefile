
all: a a.s

a: a.c
	clang a.c -o a

a.s: a.c
	clang -S a.c -o a.s

clean:
	rm -f a.s a
