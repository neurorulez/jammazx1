copy /B cc11 + cc10 + cc09 + cc08 + cc07 prog.bin

copy /B cclimber.pr1 + cclimber.pr2 cclimber_palette.bin

copy /B cc06 + cc05 cclimber_tile0.bin
copy /B cc04 + cc03 cclimber_tile1.bin

copy /B cc13 + cc12 cclimber_samples.bin

make_vhdl_prom prog.bin cclimber_program.vhd
make_vhdl_prom cclimber_tile0.bin cclimber_tile_bit0.vhd
make_vhdl_prom cclimber_tile1.bin cclimber_tile_bit1.vhd
make_vhdl_prom cc02 cclimber_big_sprite_tile_bit0.vhd
make_vhdl_prom cc01 cclimber_big_sprite_tile_bit1.vhd
make_vhdl_prom cclimber_palette.bin cclimber_palette.vhd
make_vhdl_prom cclimber.pr3 cclimber_big_sprite_palette.vhd
make_vhdl_prom cclimber_samples.bin cclimber_samples.vhd

del prog.bin cclimber_palette.bin cclimber_tile0.bin cclimber_tile1.bin cclimber_samples.bin




