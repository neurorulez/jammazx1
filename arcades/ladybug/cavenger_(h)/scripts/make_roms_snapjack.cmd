@ECHO OFF
REM SHA1 checksum                            Filename
REM 0a776aeca3947a6f29d527018f5182e758b50c5d 10-1.f4
REM e267726ba59e9a42ac89dd22eb1508ad21fd32ac 10-2.k1
REM 7cf59b7a37c156640d6ea91554d1c4276c1780e0 10-3.c4
REM 461662719bc7f1cf21c41759f4832a92b0fdb4f2 sj0.h7
REM 85e4ebbbe8e8d6c79a14387d7a6818abc9430037 sj1.c4
REM 0fd5204ea27e9bdd811e9ea21e9bbab84b916f4a sj2.d4
REM 763d588f0755a22c0f24269e6f38979fd516693f sj3.e4
REM 514bb124a1d75a622e2ca4c2175d819092d4638d sj4.h4
REM 47246095313ebba30f42d715a9fb5fc1abb68ea6 sj5.j4
REM 11e259161bab3a32a8b52f7baa4fec17be6d4302 sj6.k4
REM 5f390a672f3adf6392f8060bf7f0bcabc2eba139 sj7.m7
REM 1135c3188b41cb0ccb24079c613188209b624683 sj8.l7
REM 38409e2318dee3cc0678d4ee9e93d9b895883df6 sj9.f7


set rom_path_src=..\roms\snapjack
set rom_path=..\build
set romgen_path=..\romgen_source

mkdir %rom_path%

copy/b %rom_path_src%\sj1.c4  + %rom_path_src%\sj2.d4  %rom_path%\cpu1.bin
copy/b %rom_path_src%\sj3.e4  + %rom_path_src%\sj4.h4  %rom_path%\cpu2.bin
copy/b %rom_path_src%\sj5.j4  + %rom_path_src%\sj6.k4  %rom_path%\cpu3.bin

copy ..\roms\dummy_prom_decrypt.vhd %rom_path%\prom_decrypt.vhd

%romgen_path%\romgen %rom_path_src%\10-1.f4     prom_10_1     5 a r > %rom_path%\prom_10_1.vhd
%romgen_path%\romgen %rom_path_src%\10-2.k1     prom_10_2     5 a r > %rom_path%\prom_10_2.vhd
%romgen_path%\romgen %rom_path_src%\10-3.c4     prom_10_3     5 a r > %rom_path%\prom_10_3.vhd

%romgen_path%\romgen %rom_path%\cpu1.bin        rom_cpu1     13 l r > %rom_path%\rom_cpu1.vhd
%romgen_path%\romgen %rom_path%\cpu2.bin        rom_cpu2     13 l r > %rom_path%\rom_cpu2.vhd
%romgen_path%\romgen %rom_path%\cpu3.bin        rom_cpu3     13 l r > %rom_path%\rom_cpu3.vhd

%romgen_path%\romgen %rom_path_src%\sj8.l7      rom_sprite_l 12 l r > %rom_path%\rom_sprite_l.vhd
%romgen_path%\romgen %rom_path_src%\sj7.m7      rom_sprite_u 12 l r > %rom_path%\rom_sprite_u.vhd
%romgen_path%\romgen %rom_path_src%\sj9.f7      rom_char_l   12 l r > %rom_path%\rom_char_l.vhd
%romgen_path%\romgen %rom_path_src%\sj0.h7      rom_char_u   12 l r > %rom_path%\rom_char_u.vhd
