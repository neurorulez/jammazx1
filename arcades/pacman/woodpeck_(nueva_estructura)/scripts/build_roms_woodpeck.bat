@echo off

set rom_path_src=..\roms\woodpeck
set rom_path=..\build
set romgen_path=..\romgen_source

REM concatenate consecutive ROM regions
copy /b/y %rom_path_src%\a.5e + %rom_path_src%\c.5h + %rom_path_src%\b.5f + %rom_path_src%\d.5j %rom_path%\gfx1.bin 
copy /b/y %rom_path_src%\f.bin + %rom_path_src%\f.bin + %rom_path_src%\f.bin + %rom_path_src%\f.bin %rom_path%\main.bin 
copy /b/y %rom_path_src%\i.bin + %rom_path_src%\e.bin + %rom_path_src%\g.bin + %rom_path_src%\h.bin %rom_path%\main2.bin 

REM generate RTL code for small PROMS
%romgen_path%\romgen %rom_path_src%\pr.1k         PROM1_DST  9 l r e     > %rom_path%\prom1_dst.vhd
%romgen_path%\romgen %rom_path_src%\pr.4a         PROM4_DST  8 c     > %rom_path%\prom4_dst.vhd
%romgen_path%\romgen %rom_path_src%\pr.8h         PROM7_DST  4 c    > %rom_path%\prom7_dst.vhd
REM %romgen_path%\romgen %rom_path_src%\82s126.1m     PROM1_DST  9 c     > %rom_path%\prom1_dst.vhd
REM %romgen_path%\romgen %rom_path_src%\82s126.4a     PROM4_DST  8 c     > %rom_path%\prom4_dst.vhd
REM %romgen_path%\romgen %rom_path_src%\82s123.7f     PROM7_DST  4 c     > %rom_path%\prom7_dst.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\gfx1.bin          GFX1      13 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin          ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

REM this is ROM area not used but required
%romgen_path%\romgen %rom_path%\main2.bin         ROM_PGM_1 14 l r e > %rom_path%\rom1.vhd

echo done
pause
