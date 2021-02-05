
set rom_path_src=kingball
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
REM copy /b/y %rom_path_src%\prg1.7f+ %rom_path_src%\prg2.7j + %rom_path_src%\prg3.7l %rom_path%\main.bin > NUL
copy /b/y %rom_path_src%\main_decript.bin %rom_path%\main.bin > NUL
REM Rom Decrypted by Geoshock

REM generate RTL code for small PROMS
REM %romgen_path%\romgen %rom_path_src%\6l.bpr    GALAXIAN_6L  5 c     > %rom_path%\galaxian_6l.vhd
%romgen_path%\romgen %rom_path_src%\kb2-1    GALAXIAN_6L  5 l r e     > %rom_path%\galaxian_6l.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\main.bin        ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

%romgen_path%\romgen %rom_path_src%\chg1.1h    GALAXIAN_1H 11 l r e > %rom_path%\galaxian_1h.vhd
%romgen_path%\romgen %rom_path_src%\chg2.1k   GALAXIAN_1K 11 l r e > %rom_path%\galaxian_1k.vhd

REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
chg1.1h