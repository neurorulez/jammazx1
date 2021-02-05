
copy /B ..\roms\d05-07.bin + ..\roms\f05-08.bin + ..\roms\h05-09.bin + ..\roms\k05-10.bin + ..\roms\l05-11.bin + ..\roms\n05-12.bin prog.bin

copy /B gap_8192.bin + gap_8192.bin + gap_8192.bin + gap_8192.bin + gap_8192.bin gap_49152.bin

copy /B ..\roms\prom.v6 + ..\roms\prom.u6 ckong_palette.bin

copy /B ..\roms\n11-06.bin + ..\roms\l11-05.bin ckong_tile0.bin
copy /B ..\roms\k11-04.bin + ..\roms\h11-03.bin ckong_tile1.bin

copy /B ..\roms\c11-02.bin + ..\roms\a11-01.bin ckong_big_sprite_tiles.bin

copy /B ..\roms\cc13j.bin + ..\roms\cc12j.bin ckong_samples.bin

copy /B prog.bin + gap_49152.bin + ckong_tile0.bin + ckong_tile1.bin + ckong_big_sprite_tiles.bin ckong_sram_8bits.bin

duplicate_byte.exe ckong_sram_8bits.bin ckong_sram_16bits.bin

make_vhdl_prom prog.bin ckong_program.vhd
make_vhdl_prom ckong_tile0.bin ckong_tile_bit0.vhd
make_vhdl_prom ckong_tile1.bin ckong_tile_bit1.vhd
make_vhdl_prom ..\roms\c11-02.bin ckong_big_sprite_tile_bit0.vhd
make_vhdl_prom ..\roms\a11-01.bin ckong_big_sprite_tile_bit1.vhd
make_vhdl_prom ckong_palette.bin ckong_palette.vhd
make_vhdl_prom ..\roms\prom.t6 ckong_big_sprite_palette.vhd
make_vhdl_prom ckong_samples.bin ckong_samples.vhd

'del prog.bin gap_49152.bin ckong_palette.bin ckong_tile0.bin ckong_tile1.bin ckong_big_sprite_tiles.bin ckong_samples.bin




