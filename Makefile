all: sixelslide

CFLAGS=-Wall -Werror -std=gnu11
CC=i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-gcc
LD=i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-ld
AS=i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-as

boot.o: boot.s
	$(AS) -c boot.s -o boot.o

sixelslide: boot.o sixelslide.o io.o com.o power.o
	$(CC) -T sixelslide.ld -o sixelslide -ffreestanding -nostdlib $^ -lgcc

compiler:
	wget http://newos.org/toolchains/i686-elf-4.9.0-Linux-x86_64.tar.xz
	tar xpf i686-elf-4.9.0-Linux-x86_64.tar.xz

run: sixelslide
	qemu-system-i386 -nographic -kernel sixelslide

clean:
	rm -f *.o sixelslide
