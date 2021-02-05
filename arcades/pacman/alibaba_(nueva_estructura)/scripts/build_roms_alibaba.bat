@echo off

set rom_path_src=..\roms\alibaba
set rom_path=..\build
set romgen_path=..\romgen_source

REM concatenate consecutive ROM regions
copy /b/y %rom_path_src%\5e + %rom_path_src%\5h + %rom_path_src%\5f + %rom_path_src%\5k %rom_path%\gfx1.bin 
copy /b/y %rom_path_src%\6e + %rom_path_src%\6f + %rom_path_src%\6h + %rom_path_src%\6k %rom_path%\main.bin 
copy /b/y %rom_path_src%\6l + %rom_path_src%\6l + %rom_path_src%\6m + %rom_path_src%\6m + %rom_path_src%\6m + %rom_path_src%\6m %rom_path%\main1.bin 


REM generate RTL code for small PROMS
%romgen_path%\romgen %rom_path_src%\82s126.1m     PROM1_DST  9 l r e  > %rom_path%\prom1_dst.vhd
%romgen_path%\romgen %rom_path_src%\82s129.a4     PROM4_DST  8 c      > %rom_path%\prom4_dst.vhd
%romgen_path%\romgen %rom_path_src%\82s123.e7     PROM7_DST  4 c      > %rom_path%\prom7_dst.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\gfx1.bin          GFX1      13 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin          ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

REM this is ROM area not used but required
%romgen_path%\romgen %rom_path%\main1.bin         ROM_PGM_1 14 l r e > %rom_path%\rom1.vhd

echo done
pause
