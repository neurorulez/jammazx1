copy /B e9_b05.bin + f9_b06.bin + f9_b07.bin + k9_b08.bin + m9_b09s.bin + n9_b10.bin prog.bin
copy /B p3.bin + r3.bin bagman_palette.bin
copy /B e1_b02.bin + c1_b01.bin  bagman_tile0.bin
copy /B j1_b04.bin + f1_b03s.bin bagman_tile1.bin

make_vhdl_prom prog.bin bagman_program.vhd
make_vhdl_prom bagman_tile0.bin bagman_tile_bit0.vhd
make_vhdl_prom bagman_tile1.bin bagman_tile_bit1.vhd
make_vhdl_prom bagman_palette.bin bagman_palette.vhd
make_vhdl_prom r9_b11.bin bagman_speech1.vhd
make_vhdl_prom t9_b12.bin bagman_speech2.vhd

del prog.bin bagman_palette.bin bagman_tile0.bin bagman_tile1.bin




