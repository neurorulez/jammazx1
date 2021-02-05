@echo off

set rom_path_src=tdpgal
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
rem opy /b/y %rom_path_src%\warofbug.1k + %rom_path_src%\warofbug.1j %rom_path%\gfx1.bin
copy /b/y %rom_path_src%\1.bin + %rom_path_src%\2.bin + %rom_path_src%\3.bin + %rom_path_src%\4.bin + %rom_path_src%\5.bin + %rom_path_src%\6.bin %rom_path%\main.bin

REM generate RTL code for small PROMS
REM %romgen_path%\romgen %rom_path_src%\6l.bpr    GALAXIAN_6L  5 c     > %rom_path%\galaxian_6l.vhd
%romgen_path%\romgen %rom_path_src%\bprom.bin    GALAXIAN_6L  5 l r e     > %rom_path%\galaxian_6l.vhd

REM generate RAMB structures for larger ROMS
rem %romgen_path%\romgen %rom_path%\gfx1.bin        GFX1      12 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin        ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

%romgen_path%\romgen %rom_path_src%\8.bin    GALAXIAN_1H 11 l r e > %rom_path%\galaxian_1h.vhd
%romgen_path%\romgen %rom_path_src%\7.bin    GALAXIAN_1K 11 l r e > %rom_path%\galaxian_1k.vhd

REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
