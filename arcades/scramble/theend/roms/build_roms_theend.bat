@echo off

set rom_path_src=theend
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
copy /b %rom_path_src%\ic13_1t.bin + %rom_path_src%\ic14_2t.bin + %rom_path_src%\ic15_3t.bin + %rom_path_src%\ic16_4t.bin + %rom_path_src%\ic17_5t.bin + %rom_path_src%\ic18_6t.bin %rom_path%\rom.bin > NUL

REM generate RTL code for small PROMS
%romgen_path%\romgen %rom_path_src%\6331-1j.86       ROM_LUT        5 l r e > %rom_path%\ROM_LUT.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\rom.bin           ROM_PGM   14 l r e > %rom_path%\ROM_PGM.vhd

%romgen_path%\romgen %rom_path_src%\ic30_2c.bin            ROM_OBJ_0 11 l r e > %rom_path%\ROM_OBJ_0.vhd
%romgen_path%\romgen %rom_path_src%\ic31_1c.bin            ROM_OBJ_1 11 l r e > %rom_path%\ROM_OBJ_1.vhd

%romgen_path%\romgen %rom_path_src%\ic56_1.bin        ROM_SND_0 11 l r e > %rom_path%\ROM_SND_0.vhd
%romgen_path%\romgen %rom_path_src%\ic55_2.bin        ROM_SND_1 11 l r e > %rom_path%\ROM_SND_1.vhd
REM %romgen_path%\romgen %rom_path_src%\ot3.5e        ROM_SND_2 11 l r e > %rom_path%\ROM_SND_2.vhd

echo done
echo REMEMBER to set I_HWSEL_FROGGER := false in the VHDL code!
pause
