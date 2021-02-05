@echo off

REM SHA1 sums of files required
REM 1D6CA0C99F9DF71E2990B610DEB9D7DA0125E2D8 *1e.bin
REM 537AEF03468F63C5B9E11DD61E253F7AE17D9743 *1f.bin
REM 16F48649B531BDEF8C2D1446C429B5F414524350 *1g.bin
REM FF6200AF4C9110D8181249CBCEF1A8A40FA40B7F *1h.bin

set rom_path_src=invadersm
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
copy/b %rom_path_src%\1h.bin + %rom_path_src%\1g.bin + %rom_path_src%\1f.bin + %rom_path_src%\1e.bin %rom_path%\invaders_rom.bin > NUL

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\invaders_rom.bin INVADERS_ROM 13 l r e > %rom_path%\invaders_rom.vhd

echo done
pause
