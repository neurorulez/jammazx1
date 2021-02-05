@ECHO OFF
REM SHA1 checksum                            Filename
REM c4ea41cba4ac2d93fedec3c117a4470fee2a910f dorodon.0
REM 4154bfe50b7f75444d3f0c9be6bd2475fdba1938 dorodon.1
REM 6971ecdc968810c19f8601efc3d389450156bb22 dorodon.2
REM ff730152804d75ddb9fb19e8ec33cc764d8a50e8 dorodon.3
REM b9d46862f288c49bb8b660da87b63bd4ecb36379 dorodon.4
REM 55ac9566e805d103b6916f51c764e2601cc1f715 dorodon.5
REM d8a55e42b8c5d957c2e6a3181d7ac10c6a448f46 dorodon.6
REM 392d22731b3e4bc663d6e4385f6069ee2b4ee029 dorodon.bp0
REM f924494eed357a15ffc11331c163af24585d4ab9 dorodon.bp1
REM 7cf59b7a37c156640d6ea91554d1c4276c1780e0 dorodon.bp2
REM 640720aa5c1119080c6da928f6d1b0e76b989742 dorodon.bp3
REM 1202f83bfa50afa5a5d24401efa8bf058e7e30b5 dorodon.bp4



set rom_path_src=..\roms\dorodon
set rom_path=..\build
set romgen_path=..\romgen_source

mkdir %rom_path%





copy ..\roms\dorodon_prom_decrypt.vhd %rom_path%\prom_decrypt.vhd

%romgen_path%\romgen %rom_path_src%\dorodon.bp1 prom_10_1     5 a r > %rom_path%\prom_10_1.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.bp0 prom_10_2     5 a r > %rom_path%\prom_10_2.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.bp2 prom_10_3     5 a r > %rom_path%\prom_10_3.vhd

%romgen_path%\romgen %rom_path_src%\dorodon.0   rom_cpu1     13 l r > %rom_path%\rom_cpu1.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.1   rom_cpu2     13 l r > %rom_path%\rom_cpu2.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.2   rom_cpu3     13 l r > %rom_path%\rom_cpu3.vhd

%romgen_path%\romgen %rom_path_src%\dorodon.4   rom_sprite_l 12 l r > %rom_path%\rom_sprite_l.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.3   rom_sprite_u 12 l r > %rom_path%\rom_sprite_u.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.5   rom_char_l   12 l r > %rom_path%\rom_char_l.vhd
%romgen_path%\romgen %rom_path_src%\dorodon.6   rom_char_u   12 l r > %rom_path%\rom_char_u.vhd
