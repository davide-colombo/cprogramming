
all: nested nested.s

nested: nested.c
	clang nested.c -o nested -O2 -std=c99 -fstrict-aliasing

nested.s: nested.c
	clang -S nested.c -o nested.s -O2 -std=c99 -fstrict-aliasing

find: find.c
	clang find.c -o find

find.s: find.c
	clang -S find.c -o find.s

a: a.c
	clang a.c -o a

a.s: a.c
	clang -S a.c -o a.s

clean:
	rm -f a.s a find find.s nested nested.s
