
all: find find.s

find: find.c
	clang find.c -o find

find.s: find.c
	clang -S find.c -o find.s

a: a.c
	clang a.c -o a

a.s: a.c
	clang -S a.c -o a.s

clean:
	rm -f a.s a find find.s
