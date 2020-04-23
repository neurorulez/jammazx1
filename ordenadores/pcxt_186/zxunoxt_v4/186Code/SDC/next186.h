
extern "C" void cls(unsigned int color=0x700);
extern "C" void flush();
extern "C" void defpal();
extern "C" void setpal(unsigned char start_color, int colors, void *pal);
extern "C" void getpal(unsigned char start_color, int colors, void *pal);
extern "C" void putpixel(int x, int y, unsigned char color);
extern "C" void cputpixel(int x, int y, unsigned char color); // clipped
extern "C" void LEDdisplay(char c);
extern "C" int muldiv8(int x, int y);
extern "C" int muldiv(int x, int y, int z);
extern "C" void vscroll(unsigned char lines);
extern "C" void delline(int ch, int line);
extern "C" void dispchr(unsigned char c, int x, int y, unsigned char col);
extern "C" void int21hanlder(void *handler);
extern "C" void setcursor(int x, int y);
extern "C" int getcursor();// returns y<<8 + x
extern "C" void showcursor(bool b);

unsigned int Random32(int _seed = 0);
void circle(int xc, int yc, int r, char col);

