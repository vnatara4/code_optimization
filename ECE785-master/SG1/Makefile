CC = gcc
CFLAGS = -c -Wall -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a8 -mtune=cortex-a8 -O3 -ggdb

PROF =  -pg -g # Add for gprof

%.o: %.c
	$(CC) $(CFLAGS) $(PROF) -c -o $@ $<

sg: main.o geometry.o CMAN_coords.o
	$(CC) $(PROF) main.o geometry.o CMAN_coords.o -lrt -lm -static -o $@

geometry_list.s: geometry.c
	$(CC) -Wa,-adhln -g geometry.c -c > geometry_list.s

clean:
	rm -f *.o sg *.s
