@echo off

set rom_path_src=sprint2
set rom_path=..\src\roms
set romgen_path=romgen

REM Data 4 Bits
%romgen_path%\romgen %rom_path_src%\6400-01.m2   sync_prom   8 l r > %rom_path%\sync_prom.vhd
%romgen_path%\romgen %rom_path_src%\6396-01.p4   char_LSB    9 l r > %rom_path%\char_LSB.vhd
%romgen_path%\romgen %rom_path_src%\6397-01.r4   char_MSB    9 l r > %rom_path%\char_MSB.vhd
%romgen_path%\romgen %rom_path_src%\6399-01.j6   j6_prom     9 l r > %rom_path%\j6_prom.vhd
%romgen_path%\romgen %rom_path_src%\6398-01.k6   k6_prom     9 l r > %rom_path%\k6_prom.vhd

REM Data 8 Bits
%romgen_path%\romgen %rom_path_src%\6290-01.b1   prog_rom1  11 l r > %rom_path%\prog_rom1.vhd
%romgen_path%\romgen %rom_path_src%\6291-01.c1   prog_rom2  11 l r > %rom_path%\prog_rom2.vhd
%romgen_path%\romgen %rom_path_src%\6404.d1      prog_rom3  11 l r > %rom_path%\prog_rom3.vhd
%romgen_path%\romgen %rom_path_src%\6405.e1      prog_rom4  11 l r > %rom_path%\prog_rom4.vhd
%romgen_path%\romgen %rom_path_src%\6401-01.e2   addec_prom  5 l r > %rom_path%\addec_prom.vhd

echo done
pause
