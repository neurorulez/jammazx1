
extern "C" void cls(unsigned char color=0);
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
extern "C" void hrzline(int x, int y, unsigned char col, int dx);
extern "C" void fillrect(int x, int y, unsigned char col, int dx, int dy);
extern "C" void dispchr(unsigned char c, int x, int y, unsigned char col, void const *font);
extern "C" void int21hanlder(void *handler);
extern "C" void __cdecl LineDraw(int XStart, int YStart, int XEnd, int YEnd, int Color);

extern "C" unsigned int SCREEN_SEGMENT;

unsigned int Random32(int _seed = 0);
void circle(int xc, int yc, int r, char col);
void DisplayPage(int p);
void DrawPage(int p);

