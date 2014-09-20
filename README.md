sixelslide
-----------
This is freestanding slideviewer using sixel graphics.
Currently runs on QEMU, does not use any Filesystem or Network, slide images are directly embedded on ELF image.

Prerequires:
- QEMU
- libsixel
- ImageMagick
- GNU Make
- wget
- Linux/x86_64(for other OSes, you'll need to build cross compiler on your own)

Place your slide on this directory and name it slide.pdf, then build binary:

    cp some_where/name_of_the_slide.pdf slide.pdf
    make

Run qemu in mlterm(or other sixel supported terminal):

    make run
