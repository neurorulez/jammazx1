#include <i86.h>
#include "tty.h"
#include "next186.h"


int cx, cy;
unsigned char textcolor;
void pc(int c)
{
    if(c == 13) cx = 0;
    else if(c == 10) {cx = 0; goto newline;}
    else
    {
        dispchr(c, cx, cy, textcolor);
        if(++cx > 79)
        {
            cx = 0;
newline:
            if(cy == 24)
            {
                vscroll(1);
                delline((int)textcolor << 8, 24);
            }
            else ++cy;
        }
    }
}


void  nint21(unsigned int a, int b)
{
    a >>= 8;
    if(a == 2) pc(b);
    else if(a == 9)
        for(char *p= (char*)b; *p && *p != '$'; pc(*p++));
}

void initTTY()
{
    int21hanlder(nint21);
    cx = cy = 0;
    textcolor = 3;
}

void SetTextColor(unsigned char c){ textcolor = c; }


