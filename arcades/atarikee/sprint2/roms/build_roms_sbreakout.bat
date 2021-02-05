@echo off

set rom_path_src=sbrkout
set rom_path=..\src\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions

%romgen_path%\romgen %rom_path_src%\006400.m2   sync_prom   8 l r > %rom_path%\m2-sync_prom.vhd
%romgen_path%\romgen %rom_path_src%\033280.p4    char_LSB    9 l r > %rom_path%\p4-char_LSB.vhd
%romgen_path%\romgen %rom_path_src%\033281.r4    char_MSB    9 l r > %rom_path%\r4-char_MSB.vhd

%romgen_path%\romgen %rom_path_src%\033453.c1    prog_rom2  11 l r > %rom_path%\c1-prog_rom2.vhd
%romgen_path%\romgen %rom_path_src%\033454.d1    prog_rom3  11 l r > %rom_path%\d1-prog_rom3.vhd
%romgen_path%\romgen %rom_path_src%\033455.e1    prog_rom4  11 l r > %rom_path%\e1-prog_rom4.vhd
%romgen_path%\romgen %rom_path_src%\006401.e2    addec_prom  5 l r > %rom_path%\e2-addec_prom.vhd


REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
