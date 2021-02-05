@ECHO OFF
REM SHA1 checksum                            Filenam
REM 85d13a9b78c47174cff7c869f52b30263bae575e 10-1.f4
REM 4d7fea6d9ab31e5f280b1dc198a325f00c3826ef 10-2.k1
REM 7cf59b7a37c156640d6ea91554d1c4276c1780e0 10-3.c4
REM 83a5b745e58844b6dd7d05dfe9dbb5959aaf5c40 l0.h7
REM ddc1f849cbcefb64b70a26c2a4c993f0516af814 l1.c4
REM 193c9f90b7550020c0923cb158dff7d5faa53bc6 l2.d4
REM 1960e9cd896b6a65197aefc3f10348103552b598 l3.e4
REM 2a4b9533e61e265bdd38c126add8c26d5bc048d5 l4.h4
REM 276275d56c725b9d90eeb44c317ceb06bac27ae7 l5.j4
REM c05de7de4bd05d5c2af6aa752e057a9286f3effc l6.k4
REM f8585a6fcf921e3e21f112dd2de474cb53cef290 l7.m7
REM 0bc812cf872f04eacedb50feed53f1aa8a1f24b9 l8.l7
REM 58cb82417396a3d96acfc864f091b1a5988f228d l9.f7


set rom_path_src=..\roms\ladybug
set rom_path=..\build
set romgen_path=..\romgen_source

mkdir %rom_path%

copy/b %rom_path_src%\l1.c4 + %rom_path_src%\l2.d4 %rom_path%\cpu1.bin
copy/b %rom_path_src%\l3.e4 + %rom_path_src%\l4.h4 %rom_path%\cpu2.bin
copy/b %rom_path_src%\l5.j4 + %rom_path_src%\l6.k4 %rom_path%\cpu3.bin

copy ..\roms\dummy_prom_decrypt.vhd %rom_path%\prom_decrypt.vhd

%romgen_path%\romgen %rom_path_src%\10-1.f4     prom_10_1     5 a r > %rom_path%\prom_10_1.vhd
%romgen_path%\romgen %rom_path_src%\10-2.k1     prom_10_2     5 a r > %rom_path%\prom_10_2.vhd
%romgen_path%\romgen %rom_path_src%\10-3.c4     prom_10_3     5 a r > %rom_path%\prom_10_3.vhd

%romgen_path%\romgen %rom_path%\cpu1.bin        rom_cpu1     13 l r > %rom_path%\rom_cpu1.vhd
%romgen_path%\romgen %rom_path%\cpu2.bin        rom_cpu2     13 l r > %rom_path%\rom_cpu2.vhd
%romgen_path%\romgen %rom_path%\cpu3.bin        rom_cpu3     13 l r > %rom_path%\rom_cpu3.vhd

%romgen_path%\romgen %rom_path_src%\l8.l7       rom_sprite_l 12 l r > %rom_path%\rom_sprite_l.vhd
%romgen_path%\romgen %rom_path_src%\l7.m7       rom_sprite_u 12 l r > %rom_path%\rom_sprite_u.vhd
%romgen_path%\romgen %rom_path_src%\l9.f7       rom_char_l   12 l r > %rom_path%\rom_char_l.vhd
%romgen_path%\romgen %rom_path_src%\l0.h7       rom_char_u   12 l r > %rom_path%\rom_char_u.vhd
