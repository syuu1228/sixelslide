#include "com.h"
#include "slide.h"

int main(void) {
    int i = 0;

    while (1) {
        char *p, *end, key;

        com_putc('\b');
        p = slide_start[i];
        end = slide_end[i];
        while (p < end)
            com_putc(*p++);
        com_putu(i+1);
        com_putc('/');
        com_putu(num_slides);
        com_putc('\n');
        while(1) {
            key = com_getc();
            if (key == 'l' || key == 'j') {
                i++;
                break;
            } else if (key == 'h' || key == 'k') {
                i--;
                break;
            } else if (key == 'q') {
                return 0;
            } else if (key == '1') {
                i = 0;
                break;
            }
        }
        com_putc(key);
        if (i < 0)
            i = 0;
        else if (i >= num_slides) {
            i = num_slides - 1;
        }
    }
    return 0;
}
