@echo off

set rom_path_src=ultratnk
set rom_path=..\src\roms
set romgen_path=romgen

REM Data 4 Bits
%romgen_path%\romgen %rom_path_src%\30024-01.p8   sync_prom   9 l r > %rom_path%\sync_prom.vhd
%romgen_path%\romgen %rom_path_src%\30172-01.j6   char_LSB    9 l r > %rom_path%\char_LSB.vhd 
%romgen_path%\romgen %rom_path_src%\30173-01.h6   char_MSB    9 l r > %rom_path%\char_MSB.vhd
%romgen_path%\romgen %rom_path_src%\30177-01.k6   k6_prom    10 l r > %rom_path%\k6_prom.vhd
%romgen_path%\romgen %rom_path_src%\30176-01.l6   l6_prom    10 l r > %rom_path%\l6_prom.vhd
%romgen_path%\romgen %rom_path_src%\30175-01.m6   m6_prom    10 l r > %rom_path%\m6_prom.vhd
%romgen_path%\romgen %rom_path_src%\30174-01.n6   n6_prom    10 l r > %rom_path%\n6_prom.vhd
%romgen_path%\romgen %rom_path_src%\030181.k1     prog_rom3h 11 l r > %rom_path%\prog_rom3h.vhd
%romgen_path%\romgen %rom_path_src%\030180.n1     prog_rom3l 11 l r > %rom_path%\prog_rom3l.vhd
%romgen_path%\romgen %rom_path_src%\030183.l1     prog_rom4h 11 l r > %rom_path%\prog_rom4h.vhd
%romgen_path%\romgen %rom_path_src%\030182.m1     prog_rom4l 11 l r > %rom_path%\prog_rom4l.vhd

REM Data 8 Bits
%romgen_path%\romgen %rom_path_src%\30218-01.j10  j10_prom    5 l r > %rom_path%\j10_prom.vhd
echo done
pause
