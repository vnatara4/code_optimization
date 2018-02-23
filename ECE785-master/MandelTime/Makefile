CC = gcc
CFLAGS = -Wall -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a8 -mtune=cortex-a8 -O3 -ggdb

mandel: mandel.o
	$(CC) $(CFLAGS) $< -lrt -lm -o $@

mandel.s: mandel.c
	$(CC) $(CFLAGS) $< -S
#	$(CC) $(CFLAGS) -fverbose-asm -fopt-info-missed $< -S
#	$(CC) $(CFLAGS) -fopt-info-missed -fdump-rtl-final -fdump-tree-graph $< -S # -fverbose-asm $< -S

clean:
	rm -f *.o *.s mandel
