#include "io.h"
#include "power.h"

void poweroff(void) {
    outw(0xB004, 0x0 | 0x2000);
}
