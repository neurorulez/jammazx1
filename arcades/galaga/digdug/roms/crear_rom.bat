REM COPY /B dd1a.1 + dd1a.2 + dd1a.3 + dd1a.4 + dd1.15 + dd1.14 + dd1.13 + dd1.12 + dd1a.5 + dd1a.6 + dd1.7 + dd1.10b + dd1.11 + dd1.9 + 136007.110 + 136007.111 + 136007.112 + 136007.113 a.digdug.rom

REM cpu0_rom     0x0000 - 4000h
COPY /B rom\dd1a.1 + rom\dd1a.2 + rom\dd1a.3 + rom\dd1a.4 bin\cpu0_rom

REM spchip_rom   0x4000 - 4000h
COPY /B rom\dd1.15 + rom\dd1.14 + rom\dd1.13 + rom\dd1.12 bin\spchip_rom

REM cpu1_rom     0x8000 - 2000h
COPY /B rom\dd1a.5 + rom\dd1a.6 bin\cpu1_rom

REM cpu2_rom     0xA000 - 1000h 
COPY /B rom\dd1.7 bin\cpu2_rom

REM bgscrn_rom   0xB000 - 1000h
COPY /B rom\dd1.10b bin\bgscrn_rom

REM bgchip_rom   0xC000 - 1000h
COPY /B rom\dd1.11 bin\bgchip_rom

REM fgchip_rom   0xD000 - 800h
COPY /B rom\dd1.9 bin\fgchip_rom  

REM wave_rom     0xD800 - 100h 
COPY /B rom\136007.110 bin\wave_rom 

REM spclut_rom   0xD900 - 100h
COPY /B rom\136007.111 bin\spclut_rom

REM bgclut_rom   0xDA00 - 100h
COPY /B rom\136007.112 bin\bgclut_rom

REM palette_rom  0xDB00 - 10h
COPY /B rom\136007.113 bin\palette_rom

make_vhdl_prom bin\cpu0_rom cpu0_rom.vhd
make_vhdl_prom bin\spchip_rom spchip_rom.vhd
make_vhdl_prom bin\cpu1_rom cpu1_rom.vhd
make_vhdl_prom bin\cpu2_rom cpu2_rom.vhd
make_vhdl_prom bin\bgscrn_rom bgscrn_rom.vhd
make_vhdl_prom bin\bgchip_rom bgchip_rom.vhd
make_vhdl_prom bin\fgchip_rom fgchip_rom.vhd
make_vhdl_prom bin\wave_rom wave_rom.vhd
make_vhdl_prom bin\spclut_rom spclut_rom.vhd
make_vhdl_prom bin\bgclut_rom bgclut_rom.vhd
make_vhdl_prom bin\palette_rom palette_rom.vhd
move *.vhd .\vhd
pause 0 
REM copy /B bin\cpu0_rom + bin\spchip_rom + bin\cpu1_rom + bin\cpu2_rom + bin\bgscrn_rom + bin\bgchip_rom + bin\fgchip_rom + bin\wave_rom + bin\spclut_rom + bin\bgclut_rom + bin\palette_rom mi.digdug.rom

REM cpu0_rom     0x0000 - 4000h
REM spchip_rom   0x4000 - 4000h
REM cpu1_rom     0x8000 - 2000h
REM cpu2_rom     0xA000 - 1000h 
REM bgscrn_rom   0xB000 - 1000h
REM bgchip_rom   0xC000 - 1000h
REM fgchip_rom   0xD000 - 800h
REM wave_rom     0xD800 - 100h 
REM spclut_rom   0xD900 - 100h
REM bgclut_rom   0xDA00 - 100h
REM palette_rom  0xDB00 - 10h



