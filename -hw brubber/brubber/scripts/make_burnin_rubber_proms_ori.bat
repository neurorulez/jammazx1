
copy /B brubber.12c + brubber.12d burnin_rubber_prog.bin

make_vhdl_prom burnin_rubber_prog.bin burnin_rubber_prog.vhd
make_vhdl_prom bnj4e.bin fg_sp_graphx_1.vhd
make_vhdl_prom bnj4f.bin fg_sp_graphx_2.vhd
make_vhdl_prom bnj4h.bin fg_sp_graphx_3.vhd
make_vhdl_prom bnj10e.bin bg_graphx_1.vhd
make_vhdl_prom bnj10f.bin bg_graphx_2.vhd
make_vhdl_prom bnj6c.bin burnin_rubber_sound_prog.vhd
