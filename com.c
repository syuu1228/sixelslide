#include "io.h"
#include "com.h"

void com_putc(char c) {
    while ((inb(0x3f8 + 5) & 0x20) == 0)
        ;
    outb(0x3f8 + 0, c);
}

void com_puts(char *s) {
    char c;
    while((c = *s++))
        com_putc(c);
}

