#include <i86.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <ctype.h>
#include <conio.h>
#include "next186.h"
#define min(a,b)  (((a) < (b)) ? (a) : (b))
#define max(a,b)  (((a) > (b)) ? (a) : (b))

void dispstr(char *)
{
    _asm mov dx, ax
    _asm mov ah,9
    _asm int 21h
}


#define nmax 50
#define uplimit 200
#define rightlimit 320

int ll, g, i, j, n, l, x, y, ia, ib, ic, id, ie, rl2d;
float a, b, c, d, e, ix, iy;
char z;
int o[rightlimit], u[rightlimit], v[rightlimit];
bool q, qq, ql;
int s[nmax][nmax];
int m[nmax][2];

float f(float x, float y)
{
    return sin(x) * sin(y);
}

void draw(int j)
{
    int hl,ax,ay,b,c,z,k,i,h,l;
    ax = x - m[j][0];
    if(ax < 0)
    {
        ax = -ax;
        b = x;
        c = y;
    }
    else
    {
        b = m[j][0];
        c = m[j][1];
    }
    hl = b + 1;
    ay = c + c - y - m[j][1];
    z = 0;
    k = 0;
    if(ay < 0) i = 1;
    else i = -1;
    ay = abs(ay);
    if(ax < ay)
    {
        l = ay;
        ay = ax;
        ax = l;
        z = i;
    }
    else
    {
        k = i;
        l = ax;
    }
    h = 0;
    for(i=1; i<=l; i++)
    {
        b += abs(k);
        c += z;
        h -= ay;
        if(h<0)
        {
            b += abs(z);
            c += k;
            h += ax;
        }
        if(b>=0 && b<rightlimit)
            if(c<v[b] || c>u[b])
            {
                o[b] = c;
                putpixel(b, c, c < v[b] ? 4 : 1);
            }
    }
    for(i=hl; i<=b; i++)
        if(i>=0 && i<rightlimit)
        {
            if(o[i]<v[i]) v[i] = o[i];
            if(o[i]>u[i]) u[i] = o[i];
        }
}

void Draw3D()
{
    n = 25;
    a = -5; b = 5;
    c = -5; d = 5;
    e = 40;
    ix = (b-a) / n;
    iy = (d-c) / n;
    for(i=0; i<=n; i++)
        for(j=0; j<=n; j++) s[i][j] = int(e*f(a+j*ix,c+i*iy));
    rl2d = rightlimit >> 1;


    int page = 0;
    for(int azimut=0; azimut<7200; azimut+=3)
    {
        DisplayPage(page);
        DrawPage(page = (page + 1) % 3); // triple buffering, page swapping
//        while(inp(0x3da) & 8);
//        while(!(inp(0x3da) & 8));
//        while(inp(0x3da) & 8);
//        while(!(inp(0x3da) & 8));
        cls();

        /*delline;write(#13'Azimut:');read(d);*/ d = azimut;
        /*delline;write(#13'Elevatie:');read(e);*/ e = -10 +7*sin(azimut*3.1415f/180);
        /*delline;write(#13'Dimensiune verticala:');read(g);*/ g = 110;
        /*delline;write(#13#142'S'#143'quare/'#142'W'#143'ire:');read(z);*/ z = 's';
        ql = toupper(z) == 'S';
        d *= 3.1415f/180;
        e *= 3.1415/180;
        a = cos(d);
        b = sin(d);
        q = cos(d-0.7856) > 0;
        if(cos(e)<0) e = -e;
        qq = sin(d-0.7856) > 0;
        ic = int(-rl2d*b*sin(e));
        id = int(rl2d*a*sin(e));
        ie = int(n*cos(e));
        q = q ^ qq;
        ia = int(rl2d*a);
        ib = int(rl2d*b);
        for(i=0; i<rightlimit; i++)
        {
            u[i] = 0;
            v[i] = uplimit;
            o[i] = 0;
//            putpixel(i, 0, 3);
//            putpixel(i, uplimit-1, 3);
        }
//        for(i=0; i<uplimit; i++)
//        {
//            putpixel(0, i, 3);
//            putpixel(rightlimit-1, i, 3);
//        }
        for(l=0; l<=n; l++)
            for(ll=0; ll<=n; ll++)
            {
                i = qq ? n-l : l;
                if(q) j = ll;
                else { j = i;  i = ll; }
                x = ((j+j-n)*ia+(i+i-n)*ib) / n + rl2d;
                y = ((j+j-n)*ic+(i+i-n)*id+ie*s[i][j]) / n + g;
                if(l!=0 && (ql || ll==0 || ll==n)) draw(ll);
                if(ll!=0) draw(ll-1);
                m[ll][0] = x;
                m[ll][1] = y;
            }
    }
}

int main()
{
  char far *screen = (char far*)MK_FP(0xa000,0);

  cls(0);
  defpal();

//  for(int i=0; i<200; i++)
//    LineDraw(0, i, 320, 100, 6);

again:
  Draw3D();
  goto again;
  DisplayPage(0);
  DrawPage(0);
  flush();
  return 0;
}

