@echo off

REM SHA1 sums of files required
REM 1D6CA0C99F9DF71E2990B610DEB9D7DA0125E2D8 *1e.bin
REM 537AEF03468F63C5B9E11DD61E253F7AE17D9743 *1f.bin
REM 16F48649B531BDEF8C2D1446C429B5F414524350 *1g.bin
REM FF6200AF4C9110D8181249CBCEF1A8A40FA40B7F *1h.bin

set rom_path_src=galxwarst
set rom_path=..\source\roms
set romgen_path=romgen

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path_src%\galxwars.0 INVADERS_ROM_H 10 l r e > %rom_path%\invaders_rom_h.vhd
%romgen_path%\romgen %rom_path_src%\galxwars.1 INVADERS_ROM_G 10 l r e > %rom_path%\invaders_rom_g.vhd
%romgen_path%\romgen %rom_path_src%\galxwars.2 INVADERS_ROM_F 10 l r e > %rom_path%\invaders_rom_f.vhd
%romgen_path%\romgen %rom_path_src%\galxwars.3 INVADERS_ROM_E 10 l r e > %rom_path%\invaders_rom_e.vhd
%romgen_path%\romgen %rom_path_src%\galxwars.4 INVADERS_ROM_D 10 l r e > %rom_path%\invaders_rom_d.vhd
%romgen_path%\romgen %rom_path_src%\galxwars.5 INVADERS_ROM_C 10 l r e > %rom_path%\invaders_rom_c.vhd

echo done
pause
