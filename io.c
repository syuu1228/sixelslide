#include "io.h"

unsigned char inb(unsigned short port)
{
    unsigned char r;
    asm volatile ("inb %1, %0":"=a" (r):"dN" (port));
    return r;
}

void outb(unsigned short port, unsigned char val)
{
    asm volatile ("outb %0, %1"::"a" (val), "dN" (port));

}

unsigned short inw(unsigned short port)
{
    unsigned short r;
    asm volatile ("inw %1, %0":"=a" (r):"dN" (port));
    return r;
}

void outw(unsigned short port, unsigned short val)
{
    asm volatile ("outw %0, %1"::"a" (val), "dN" (port));

}
