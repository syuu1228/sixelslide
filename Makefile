all: kernel.elf

CFLAGS=-Wall -Werror -std=gnu11
CC=i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-gcc
LD=i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-ld
AS=i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-as

boot.o: boot.s
	$(AS) -c boot.s -o boot.o

kernel.elf: boot.o kernel.o io.o com.o power.o slide.001.o slide.002.o slide.003.o
	$(CC) -T linker.ld -o kernel.elf -ffreestanding -nostdlib $^ -lgcc

compiler:
	wget http://newos.org/toolchains/i686-elf-4.9.0-Linux-x86_64.tar.xz
	tar xpf i686-elf-4.9.0-Linux-x86_64.tar.xz

run: kernel.elf
	qemu-system-i386 -nographic -kernel kernel.elf

clean:
	rm -f *.o kernel.elf
