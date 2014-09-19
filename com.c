#include "io.h"
#include "com.h"

#define UTOC(u) ('0' + u)

void com_putc(char c) {
    while ((inb(0x3f8 + 5) & 0x20) == 0)
        ;
    outb(0x3f8 + 0, c);
}

void com_putu(unsigned u) {
    char buf[1024];

    if (u < 10)
        com_putc(UTOC(u));
    else
    {
        char *bp;

        bp = buf + 1024 - 1;
        *bp-- = '\0';
        while (u && bp >= buf)
        {
            *bp-- = UTOC(u % 10);
            u /= 10;
        }
        com_puts(++bp);
    }
}

void com_puts(char *s) {
    char c;
    while((c = *s++))
        com_putc(c);
}

char com_getc(void) {
    while ((inb(0x3f8 + 5) & 1) == 0)
        ;
    return inb(0x3f8 + 0);
}
