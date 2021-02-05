@ECHO OFF
REM SHA1 checksum                            Filename
REM 00e3bd5dd90769d670fc3c51edd1cd4b69e6132d sraid-s0.k6
REM 6cb8fd4826e499f9a4e63621d58bc4b596cc261e sraid-s4.h6
REM a261c8f3c7c4cd4587c003bbbe815d2c4e01ffbc sraid-s5.j6
REM 353c0d075d5e0a3bc25a65e2748f5eb5212a844d sraid-s6.l6
REM 1de71f251286088487da7285d6f8070147002af5 sraid-s7.m2
REM 2aa1a5f682d146a55a96e471bb78e5c60da02bf9 sraid-s8.n2
REM 0310554e3f2ec973c2bb6e816d04e5c0c1e0a0b9 sraid-s9.f6
REM 3a902ce6858f38df88b60830bef4b1d45b09b2df sraid1.m4
REM 6f4f384d702fb8ee4bb2ef579638239d57e32ddd sraid2.n4
REM c67596e6bf00175ff0a241506cd2f88114d05933 sraid3.r4
REM 83762ced1df92ff594887e44d5b783826bbfb0c9 sraids11.l6
REM 3bc092da40beb129a4df3db2f55d22bbbcf7bad8 srpr10-1.a2
REM e21ee2939e96dffee101bd92c62ed975b6b64001 srpr10-2.l3
REM 7cf59b7a37c156640d6ea91554d1c4276c1780e0 srpr10-3.c1

set rom_path_src=..\roms\sraider
set rom_path=..\build
set romgen_path=..\romgen_source

mkdir %rom_path%





copy ..\roms\dummy_prom_decrypt.vhd   %rom_path%\prom_decrypt.vhd

%romgen_path%\romgen %rom_path_src%\srpr10-2.l3 prom_10_1     5 a r > %rom_path%\prom_10_1.vhd
%romgen_path%\romgen %rom_path_src%\srpr10-1.a2 prom_10_2     5 a r > %rom_path%\prom_10_2.vhd
%romgen_path%\romgen %rom_path_src%\srpr10-3.c1 prom_10_3     5 a r > %rom_path%\prom_10_3.vhd

%romgen_path%\romgen %rom_path_src%\sraid3.r4   rom_cpu1     13 l r > %rom_path%\rom_cpu1.vhd
%romgen_path%\romgen %rom_path_src%\sraid2.n4   rom_cpu2     13 l r > %rom_path%\rom_cpu2.vhd
%romgen_path%\romgen %rom_path_src%\sraid1.m4   rom_cpu3     13 l r > %rom_path%\rom_cpu3.vhd

%romgen_path%\romgen %rom_path_src%\sraid-s7.m2 rom_sprite_l 12 l r > %rom_path%\rom_sprite_l.vhd
%romgen_path%\romgen %rom_path_src%\sraid-s8.n2 rom_sprite_u 12 l r > %rom_path%\rom_sprite_u.vhd
%romgen_path%\romgen %rom_path_src%\sraid-s0.k6 rom_char_l   12 l r > %rom_path%\rom_char_l.vhd
%romgen_path%\romgen %rom_path_src%\sraids11.l6 rom_char_u   12 l r > %rom_path%\rom_char_u.vhd

REM This game has extra ROMs and doesn't currently work
REM gfx3
REM %romgen_path%\romgen %rom_path_src%\sraid-s9.f6 rom_xxx0 12 l r > %rom_path%\xxx0.vhd
REM sub
REM %romgen_path%\romgen %rom_path_src%\sraid-s4.h6 rom_xxx1 13 l r > %rom_path%\xxx1.vhd
REM %romgen_path%\romgen %rom_path_src%\sraid-s5.j6 rom_xxx2 13 l r > %rom_path%\xxx2.vhd
REM %romgen_path%\romgen %rom_path_src%\sraid-s6.l6 rom_xxx3 13 l r > %rom_path%\xxx3.vhd
ECHO *********************************************
ECHO *********************************************
ECHO ***                                       ***
ECHO ***   This hame not currently supported   ***
ECHO ***                                       ***
ECHO *********************************************
ECHO *********************************************
pause