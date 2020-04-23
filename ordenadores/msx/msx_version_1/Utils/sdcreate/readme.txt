OCM-SDCREATE v2.5
=================
This tool allows you to easily create your SD-Card for 1chipMSX and Zemmix Neo machines.
Any target size lower or higher than 4GB are automatically managed by DiskPart of Windows.
No other external tool is needed to go!

Tested with Microsoft Windows 10.0.15063 64-bit.


WARNING: USE THIS TOOL AT YOUR OWN RISK AND PROCEED WITH EXTREME CAUTION!
-------------------------------------------------------------------------

1. Add the proper files inside their subfolders:

HELP/
            <-- SETSMART.HLP  (suggested)
OS/
            <-- COMMAND2.COM  (needed)
            <-- MSXDOS2 .SYS  (needed)
            <-- NEXTOR  .SYS  (suggested)
            <-- AUTOEXEC.BAT  (optional) (an example is included)
            <-- REBOOT  .BAT  (optional) (an example is included)
SDBIOS/
            <-- OCM-BIOS.DAT  (needed)
UTILS/
            <-- CPUSPEED.COM  (suggested)
            <-- EXTCLOCK.COM  (suggested)
            <-- GETRESET.COM  (suggested)
            <-- KEYBOARD.COM  (suggested)
            <-- PLDFLASH.COM  (suggested)
            <-- SETAUDIO.COM  (suggested)
            <-- SETSMART.COM  (suggested)
            <-- SLOTMODE.COM  (suggested)
            <-- VDPSPEED.COM  (suggested)
            <-- ...

2. Insert the SD-Card into the card reader.
3. Run the "sdcreate.cmd" script as Administrator.
4. Enter the target drive letter and a label name.
5. Press a key to finalize the process.

All done!

______________
KdL 2017.09.18
