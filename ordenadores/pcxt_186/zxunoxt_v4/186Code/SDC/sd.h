extern "C" int sdinit();
extern "C" int sdread(unsigned long sector, void far *buf, int sectors);
extern "C" int sdwrite(unsigned long sector, void far *buf, int sectors);
extern "C" int sdsb(unsigned char b);

