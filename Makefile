# _*_ MakeFile _*_

CC := clang
DEPS := -I.
OOPTIM := -O2
CFLAGS := -std=c99 -fstrict-aliasing $(OOPTIM) $(DEPS)

SRCS := main.c particles.c
ASMS := $(patsubst %.c,%.s,$(SRCS))
OBJS := $(patsubst %.c,%.o,$(SRCS))

all: particles $(ASMS)

particles: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

%.s: %.c
	$(CC) -o $@ -S $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) $(ASMS) particles