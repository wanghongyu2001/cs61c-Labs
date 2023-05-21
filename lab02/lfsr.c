#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"
#include "bit_ops.h"

void lfsr_calculate(uint16_t* reg) {
    /* YOUR CODE HERE */
    unsigned reg_bit0 = get_bit(*reg, 0);
    unsigned reg_bit2 = get_bit(*reg, 2);
    unsigned reg_bit3 = get_bit(*reg, 3);
    unsigned reg_bit5 = get_bit(*reg, 5);
    unsigned shift_bit = ((reg_bit0 ^ reg_bit2) ^ reg_bit3) ^ reg_bit5;
    // printf("bit0 = %08x, bit2 = %08x, bit3 = %08x, bit5 = %08x, shift_bit = %08x\n",reg_bit0, reg_bit2, reg_bit3, reg_bit5, shift_bit);
    *reg = (*reg >> 1) | (shift_bit << 15);
}

