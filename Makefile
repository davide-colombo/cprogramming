# _*_ MakeFile _*_

CC := clang
OOPTIM := -O2
INCDIRS := -I.
CFLAGS := -std=c99 -fstrict-aliasing $(OOPTIM) $(INCDIRS)

SRCS := test_vec2.c vec2.c
ASMS := $(patsubst %.c,%.s,$(SRCS))
OBJS := $(patsubst %.c,%.o,$(SRCS))
TRG := vec2

.PHONY: all
all: $(TRG) $(ASMS)

$(TRG): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

%.s: %.c
	$(CC) -o $@ -S $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(TRG) $(ASMS) $(OBJS)
