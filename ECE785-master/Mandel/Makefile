CC = gcc
CFLAGS = -Wall -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a8 -mtune=cortex-a8 -O0 -ggdb

mandel.s: mandel.c
	$(CC) $(CFLAGS) $< -S
mandel: mandel.o
	$(CC) $(CFLAGS) $< -lrt -lm -o $@

clean:
	rm -f *.o *.s
