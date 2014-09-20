all: slide-0.png build

.PHONY: build
build:
	$(MAKE) sixelslide

CFLAGS = -Wall -Werror -std=gnu11
CC = i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-gcc
LD = i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-ld
AS = i686-elf-4.9.0-Linux-x86_64/bin/i686-elf-as

boot.o: boot.s
	$(AS) -c boot.s -o boot.o

slide-0.png: slide.pdf
	convert slide.pdf slide.png

.SUFFIXES: .png .txt .o
.png.txt:
	img2sixel -8 $< > $@
.txt.o:
	$(LD) -r -b binary -o $@ $<

PNGS = $(wildcard *.png)
TXTS = $(PNGS:.png=.txt)
BINS = $(TXTS:.txt=.o)

slide.h:
	ruby genslideh.rb > slide.h
slide.c: slide.h
	ruby genslidec.rb > slide.c
main.o: slide.h
	$(CC) $(CFLAGS) -c main.c

sixelslide: boot.o main.o io.o com.o power.o slide.o $(BINS)
	$(CC) -T sixelslide.ld -o sixelslide -ffreestanding -nostdlib $^ -lgcc

compiler:
	wget http://newos.org/toolchains/i686-elf-4.9.0-Linux-x86_64.tar.xz
	tar xpf i686-elf-4.9.0-Linux-x86_64.tar.xz

run: sixelslide
	qemu-system-i386 -nographic -kernel sixelslide

clean:
	rm -f *.o *.txt *.png slide.[ch] sixelslide
