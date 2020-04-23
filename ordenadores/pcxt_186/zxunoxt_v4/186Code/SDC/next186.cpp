#include "next186.h"

unsigned int Random32(int _seed)
{
    static unsigned long seed;
    if(_seed) seed = _seed;
    seed = (2147001325ul*seed + 715136305ul);
    return seed & 65535;
}

void circle(int xc, int yc, int r, char col)
{
    int x = r, y = 0, h = r;

    do
    {
        cputpixel(xc+x, yc+y, col);
        cputpixel(xc+x, yc-y, col);
        cputpixel(xc-x, yc+y, col);
        cputpixel(xc-x, yc-y, col);
        cputpixel(xc+y, yc+x, col);
        cputpixel(xc+y, yc-x, col);
        cputpixel(xc-y, yc+x, col);
        cputpixel(xc-y, yc-x, col);
        ++y;
        if((h = h - y - y - 1) < 0)
        {
            h = h + x + x;
            --x;
        }
    } while(x >= y);
}

