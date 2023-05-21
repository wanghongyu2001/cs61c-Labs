#include <stdio.h>
#include "bit_ops.h"

// Return the nth bit of x.
// Assume 0 <= n <= 31
unsigned get_bit(unsigned x,
                 unsigned n) {
    // YOUR CODE HERE
    // Returning -1 is a placeholder (it makes
    // no sense, because get_bit only returns
    // 0 or 1)

    return (x >> n) & 1;
}
// Set the nth bit of the value of x to v.
// Assume 0 <= n <= 31, and v is 0 or 1
void set_bit(unsigned *x,
             unsigned n,
             unsigned v) {
    // YOUR CODE HERE
    // if (v == 0)
    // {
    //     *x = *x & (~(1 << n));
    // }
    // else
    // {
    //     *x = *x | (1 << n);
    // }
    int get_l = ~(((1 << 31) >> 31) << n);
    unsigned h = (((*x >> n >> 1) << 1) | v) << n;
    // printf(" h = %08x ", h);
    // unsigned l = ((*x << (32 - n) >> 1) | (v << 31)) >> (31 - n);
    unsigned l = get_l & *x;
    // printf(" l = %08x ", l);
    *x = l | h;
}

// Flip the nth bit of the value of x.
// Assume 0 <= n <= 31
void flip_bit(unsigned * x,
              unsigned n) {
    // YOUR CODE HERE
    // int v = get_bit(*x, n);
    // if (v == 1)
    // {
    //     *x = *x & (~(1 << n));
    // }
    // else
    // {
    //     *x = *x ^ (1 << n);
    // }
    int get_l = ~(((1 << 31) >> 31) << n);
    unsigned h = (((*x >> n >> 1) << 1) | !get_bit(*x, n)) << n;
    unsigned l = get_l & *x;
    *x = l | h;
}

