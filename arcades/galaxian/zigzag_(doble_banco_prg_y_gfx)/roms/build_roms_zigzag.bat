@echo off

set rom_path_src=zigzagb
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
copy /b/y %rom_path_src%\zz_d1.7l + %rom_path_src%\zz_d2.7k + %rom_path_src%\zz_d4.7f + %rom_path_src%\zz_d3.7h %rom_path%\main.bin

REM generate RTL code for small PROMS
REM %romgen_path%\romgen %rom_path_src%\6l.bpr    GALAXIAN_6L  5 c     > %rom_path%\galaxian_6l.vhd
%romgen_path%\romgen %rom_path_src%\zzbpr_e9.bin    GALAXIAN_6L  5 l r e     > %rom_path%\galaxian_6l.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\gfx1.bin        GFX1      12 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin        ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

%romgen_path%\romgen %rom_path_src%\zz_6.1h    GALAXIAN_1H 12 l r e > %rom_path%\galaxian_1h.vhd
%romgen_path%\romgen %rom_path_src%\zz_5.1k    GALAXIAN_1K 12 l r e > %rom_path%\galaxian_1k.vhd

%romgen_path%\romgen %rom_path_src%\h_hex.rom    GALAXIAN_1H_B 12 l r e > %rom_path%\galaxian_1h_b.vhd
%romgen_path%\romgen %rom_path_src%\k_hex.rom    GALAXIAN_1K_B 12 l r e > %rom_path%\galaxian_1k_b.vhd

REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
