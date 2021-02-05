
copy /B d05-07.bin + f05-08.bin + h05-09.bin + k05-10.bin + l05-11.bin + n05-12.bin prog.bin
copy /B prom.v6 + prom.u6 ckong_palette.bin
copy /B n11-06.bin + l11-05.bin ckong_tile0.bin
copy /B k11-04.bin + h11-03.bin ckong_tile1.bin
copy /B cc13j.bin + cc12j.bin ckong_samples.bin

make_vhdl_prom prog.bin ckong_program.vhd
make_vhdl_prom ckong_tile0.bin ckong_tile_bit0.vhd
make_vhdl_prom ckong_tile1.bin ckong_tile_bit1.vhd
make_vhdl_prom c11-02.bin ckong_big_sprite_tile_bit0.vhd
make_vhdl_prom a11-01.bin ckong_big_sprite_tile_bit1.vhd
make_vhdl_prom ckong_palette.bin ckong_palette.vhd
make_vhdl_prom prom.t6 ckong_big_sprite_palette.vhd
make_vhdl_prom ckong_samples.bin ckong_samples.vhd

del prog.bin ckong_palette.bin ckong_tile0.bin ckong_tile1.bin ckong_samples.bin
pause



