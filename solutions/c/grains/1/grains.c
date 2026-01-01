#include "grains.h"
#include <math.h>

uint64_t square(uint8_t index) {
    uint64_t result = pow(2, index - 1);
    return result;
}

uint64_t total(void) {
    uint64_t result = 0;
    int i = 1;
    for (i = 1; i <= 64; i++) {
        result += square(i);
    }
    return result;
}