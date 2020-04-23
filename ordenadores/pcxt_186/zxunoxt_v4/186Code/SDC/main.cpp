#include <i86.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "next186.h"
#include "tty.h"
#include "sd.h"
#define min(a,b)  (((a) < (b)) ? (a) : (b))
#define max(a,b)  (((a) > (b)) ? (a) : (b))


void dispstr(char *)
{
    _asm mov dx, ax
    _asm mov ah,9
    _asm int 21h
}


static char pal[] = {0,0,0, 31,0,0, 0,31,0, 31,31,0, 0,0,31, 31,0,31, 0,31,31, 31,31,31};
char c[128];
char buf[512*32];
//static unsigned char CMD_12[] = {0x4c, 0, 0, 0, 0, 0xff};


struct sPartInfo
{
    unsigned char active;
    unsigned char head;
    unsigned short cyl_sect;
    unsigned char type;
    unsigned char endhead;
    unsigned short endcyl_sect;
    unsigned long mbr_to_part_sectors;
    unsigned long sectors;  
};

unsigned long HCS_to_LBA(unsigned int h, unsigned int cs)
{
    unsigned int s = cs & 0x3f;
    unsigned int c = ((cs & 0xc0) << 2) | (cs >> 8);
    return (c*255l + h)*63l + s - 1l;
}

void showpartinfo(sPartInfo *pi, int pn)
{
    sprintf(c, "\nPartition %d - %s, Type: %02xh, Size %d MB\n", pn, pi->active == 0x80 ? "Active" : "Inactive", pi->type, pi->sectors/2048);
    dispstr(c);
    unsigned long l = HCS_to_LBA(pi->head, pi->cyl_sect);
    sprintf(c, "Start sector = %x%xh\n", (unsigned int)(l >> 16), (unsigned int)(l & 0xffff));
    dispstr(c);
    l = HCS_to_LBA(pi->endhead, pi->endcyl_sect);
    sprintf(c, "End sector = %x%xh\n", (unsigned int)(l >> 16), (unsigned int)(l & 0xffff));
    dispstr(c);
    sprintf(c, "MBR to partition sectors = %x%xh\n", (unsigned int)(pi->mbr_to_part_sectors>>16), (unsigned int)(pi->mbr_to_part_sectors & 0xffff));
    dispstr(c);
}

void diskinfo(unsigned long s, int pn)
{
    char b[512];
    sdread(s, b, 1); // read master boot record
    if(*(unsigned short *)(b+510) == 0xaa55)
    {
        for(sPartInfo *p = (sPartInfo *)(b + 0x1be); p->type; p++)
            if(p->type == 5 || p->type == 0xf) diskinfo(HCS_to_LBA(p->head, p->cyl_sect), pn++);
            else showpartinfo(p, pn++);
    }
    else dispstr("Unformatted disk.\n");
}

int main()
{
  initTTY();
  cls(0x700);
  setpal(0, 8, pal);
//  for(int i=0; i<sizeof(pal); i++) pal[i] <<= 1;
//  setpal(8, 8, pal);
  SetTextColor(7);

  showcursor(1);
  setcursor(23, 3);
  flush();


  int i, j, sc=0;
  if(i = sdinit())
  {
      sprintf(c, "%X%Xh available 512b sectors \n", i>>6, (i & 0x3f) << 10);
      dispstr(c);

//      for(j=0; j<625/2; j++) sc+=sdread((j<<5), buf, 32);
//      sprintf(c, "%d sectors read\n", sc);
//      dispstr(c);
//      for(j=0; j<1000; j++)

/*      sdread(7744512l-4, buf, 4);
      for(i=0; i<128; i++)
      {
          if(i < 6) sprintf(c, "%2x ", sdsb(CMD_12[i]));
          else sprintf(c, "%2x ", sdsb(0xff));
          dispstr(c);
      }*/

      for(i=0; i<2048; i++) buf[i] = 1;
      if((j=sdwrite(7744512l-3, buf, 2)) ==  2) dispstr("Write OK\n");
      else dispstr("Write error\n");
//      sdwrite(7744512l-1, buf, 1);
//      for(i=0; i<128; i++)
//      {
//          sprintf(c, "%2x ", sdsb(0xff));
//          dispstr(c);
//      }
//      flush();
//      return 0;

//      memset(buf, 9, sizeof(buf));
//      for(j=0; j<625/2; j++) sc+=sdwrite(77l+(j<<5), buf, 32);
//      sprintf(c, "%d sectors write\n", sc);
//      dispstr(c);      
      if((j=sdread(7744512l-3, buf, 3)) == 3 )
      {
         for(i=0; i<(j<<9); i++)
         {
          sprintf(c, "%x", buf[i]);
          dispstr(c);
         }
      }
      else
      {
         sprintf(c, "Sector read error: %x\n", j);
         dispstr(c);
      }

//      sdwrite(77, MK_FP(0x1000, 0), 600);
//      sdread(77, MK_FP(0xa000, 0), 600);
//     defpal();
      
  }
  else dispstr("SD init error\n");

  flush(); 
  _asm hlt
}
