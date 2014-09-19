#ifndef IO_H_
#define IO_H_

unsigned char inb(unsigned short port);
void outb(unsigned short port, unsigned char val);
unsigned short inw(unsigned short port);
void outw(unsigned short port, unsigned short val);

#endif
