#include "host.h"

//#include "osd.h"
//#include "keyboard.h"
//#include "menu.h"
#include "ps2.h"
#include "minfat.h"
#include "spi.h"
#include "fileselector.h"
#include <string.h>

fileTYPE file;

/*
int OSD_Puts(char *str)
{
	int c;
	while((c=*str++))
		OSD_Putchar(c);
	return(1);
}


void TriggerEffect(int row)
{
	int i,v;
	Menu_Hide();
	for(v=0;v<=16;++v)
	{
		for(i=0;i<4;++i)
			PS2Wait();

		HW_HOST(REG_HOST_SCALERED)=v;
		HW_HOST(REG_HOST_SCALEGREEN)=v;
		HW_HOST(REG_HOST_SCALEBLUE)=v;
	}
	Menu_Show();
}
*/
void Delay()
{
	int c=16384; // delay some cycles
	while(c)
	{
		c--;
	}
}
void SuperDelay()
{	int i=1;
	for (i=1;i<=576;i++)
	{
		Delay();
	}
}

void Reset(int row)
{
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_RESET|HOST_CONTROL_DIVERT_KEYBOARD; // Reset host core
	Delay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
}

void SwichRomSignal(int row)
{
	
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_LOADROM|HOST_CONTROL_DIVERT_KEYBOARD; // Send SwichRomSignal
	SuperDelay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
}

//static struct menu_entry topmenu[]; // Forward declaration.
/*
// RGB scaling submenu
static struct menu_entry rgbmenu[]=
{
	{MENU_ENTRY_SLIDER,"Red",MENU_ACTION(16)},
	{MENU_ENTRY_SLIDER,"Green",MENU_ACTION(16)},
	{MENU_ENTRY_SLIDER,"Blue",MENU_ACTION(16)},
	{MENU_ENTRY_SUBMENU,"Exit",MENU_ACTION(topmenu)},
	{MENU_ENTRY_NULL,0,0}
};


// Test pattern names
static char *testpattern_labels[]=
{
	"Test pattern 1",
	"Test pattern 2",
	"Test pattern 3",
	"Test pattern 4"
};
*/
// Our toplevel menu
/*
static struct menu_entry topmenu[]=
{
	{MENU_ENTRY_CALLBACK,"    =ZXDOS=    ",0},
	{MENU_ENTRY_CALLBACK,"               ",0},
	{MENU_ENTRY_CALLBACK,"Reset",MENU_ACTION(&Reset)},
//	{MENU_ENTRY_CYCLE,(char *)testpattern_labels,MENU_ACTION(4)},
//	{MENU_ENTRY_SUBMENU,"RGB Scaling \x10",MENU_ACTION(rgbmenu)},
	{MENU_ENTRY_TOGGLE,"Scanlines",MENU_ACTION(0)},
	{MENU_ENTRY_TOGGLE,"PAL / NTSC",MENU_ACTION(1)},
	{MENU_ENTRY_TOGGLE,"Color",MENU_ACTION(2)},
	{MENU_ENTRY_TOGGLE,"Difficulty A",MENU_ACTION(3)},
	{MENU_ENTRY_TOGGLE,"Difficulty B",MENU_ACTION(4)},
	{MENU_ENTRY_CALLBACK,"Select",MENU_ACTION(&Select)},
	{MENU_ENTRY_CALLBACK,"Start",MENU_ACTION(&Start)},
//	{MENU_ENTRY_CALLBACK,"Animate",MENU_ACTION(&TriggerEffect)},
	{MENU_ENTRY_CALLBACK,"Cargar ROM \x10",MENU_ACTION(&FileSelector_Show)},
	{MENU_ENTRY_CALLBACK,"Exit",MENU_ACTION(&Menu_Hide)},
	{MENU_ENTRY_NULL,0,0}
};


// An error message
static struct menu_entry loadfailed[]=
{
	{MENU_ENTRY_SUBMENU,"Carga de ROM Fallida",MENU_ACTION(loadfailed)},
	{MENU_ENTRY_SUBMENU,"OK",MENU_ACTION(&topmenu)},
	{MENU_ENTRY_NULL,0,0}
};

*/
static int LoadROM(const char *filename)
{
	int result=0;
	int opened;
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_RESET;
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_SDCARD; // Release reset but take control of the SD card

	if((opened=FileOpen(&file,filename)))
	{
		int filesize=file.size;
		unsigned int c=0;
		int bits;

		bits=0;
		c=filesize-1;
		while(c)
		{
			++bits;
			c>>=1;
		}
		bits-=9;

		result=1;

		while(filesize>0)
		{
			OSD_ProgressBar(c,bits);
			if(FileRead(&file,sector_buffer))
			{
				int i;
				int *p=(int *)&sector_buffer;
				for(i=0;i<512;i+=4)
				{
					unsigned int t=*p++;
					HW_HOST(REG_HOST_BOOTDATA)=t;
				}
			}
			else
			{
				result=0;
				filesize=512;
			}
			FileNextSector(&file);
			filesize-=512;
			++c;
		}
	}
	HW_HOST(REG_HOST_ROMSIZE) = file.size;
	HW_HOST(REG_HOST_ROMEXT) = ((char)filename[10])+((char)filename[9]<<8)+((char)filename[8]<<16); //Pasa 24 Bits las 3 letras de la Extension en el registro de 31 bits (la primera en los bits 23:16 la segunda  en 15:7 y la tercera en 7:0
	SwichRomSignal(0);
	//Reset(0);
	
	//if(result)
	//	Menu_Set(topmenu);
	//else
	//	Menu_Set(loadfailed);
	return(result);
}


int main(int argc,char **argv)
{
	int i;
	int dipsw=0;

	// Put the host core in reset while we initialise...
//	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_RESET;

	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_SDCARD;

	//PS2Init();
	EnableInterrupts();

	//OSD_Clear();
	//for(i=0;i<4;++i)
	//{
	//	PS2Wait();	// Wait for an interrupt - most likely VBlank, but could be PS/2 keyboard
	//	OSD_Show(1);	// Call this over a few frames to let the OSD figure out where to place the window.
	//}
//	MENU_SLIDER_VALUE(&rgbmenu[0])=8;
//	MENU_SLIDER_VALUE(&rgbmenu[1])=8;
//	MENU_SLIDER_VALUE(&rgbmenu[2])=8;

	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_SDCARD; // Release reset but take control of the SD card
	//OSD_Puts("Initializing SD card\n");

	if(!FindDrive())
		return(0);

//	OSD_Puts("Loading initial ROM...\n");

	LoadROM("DEFENDERROM");

	FileSelector_SetLoadFunction(LoadROM);
	
	//Menu_Set(topmenu);
	//Menu_Show();
/*
	while(1)
	{
		struct menu_entry *m;
		int visible;
		HandlePS2RawCodes();
		visible=Menu_Run();

		dipsw=MENU_CYCLE_VALUE(&topmenu[1]);	// Take the value of the TestPattern cycle menu entry.
		if(MENU_TOGGLE_VALUES&1)
			dipsw|=4;	// Add in the scanlines bit.
		if(MENU_TOGGLE_VALUES&2)
			dipsw|=2;	// Add in the PAL bit
		if(MENU_TOGGLE_VALUES&4)
			dipsw|=1;	// Add in the Color bit
		if(MENU_TOGGLE_VALUES&8)
			dipsw|=8;	// Add in the Diff A bit
		if(MENU_TOGGLE_VALUES&16)
			dipsw|=16;	// Add in the Diff B bit
		HW_HOST(REG_HOST_SW)=dipsw;	// Send the new values to the hardware.
//		HW_HOST(REG_HOST_SCALERED)=MENU_SLIDER_VALUE(&rgbmenu[0]);
//		HW_HOST(REG_HOST_SCALEGREEN)=MENU_SLIDER_VALUE(&rgbmenu[1]);
//		HW_HOST(REG_HOST_SCALEBLUE)=MENU_SLIDER_VALUE(&rgbmenu[2]);

		// If the menu's visible, prevent keystrokes reaching the host core.
		HW_HOST(REG_HOST_CONTROL)=(visible ?
									HOST_CONTROL_DIVERT_KEYBOARD|HOST_CONTROL_DIVERT_SDCARD :
									HOST_CONTROL_DIVERT_SDCARD); // Maintain control of the SD card so the file selector can work.
																 // If the host needs SD card access then we would release the SD
																 // card here, and not attempt to load any further files.
	}
	*/
	return(0);
}
