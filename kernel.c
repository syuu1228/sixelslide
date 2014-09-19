#include "com.h"
#include "power.h"

extern int _binary_slide_001_txt_start;
extern int _binary_slide_001_txt_end;
extern int _binary_slide_002_txt_start;
extern int _binary_slide_002_txt_end;
extern int _binary_slide_003_txt_start;
extern int _binary_slide_003_txt_end;

void kernel_main(void) {
    char *p, *end, key;
    p = (char *)&_binary_slide_001_txt_start;
    end = (char *)&_binary_slide_001_txt_end;
    while(p < end)
        com_putc(*p++);
    key = com_getc();
    com_putu(key);
    com_putc('\n');
    p = (char *)&_binary_slide_002_txt_start;
    end = (char *)&_binary_slide_002_txt_end;
    while(p < end)
        com_putc(*p++);
    key = com_getc();
    com_putu(key);
    com_putc('\n');
    p = (char *)&_binary_slide_003_txt_start;
    end = (char *)&_binary_slide_003_txt_end;
    while(p < end)
        com_putc(*p++);
    key = com_getc();
    com_putu(key);
    com_putc('\n');
    poweroff();
}
