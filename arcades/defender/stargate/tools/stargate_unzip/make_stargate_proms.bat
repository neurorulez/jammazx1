copy /B 10+11+12+01+02+03+04+05+06+07+08+09 stargate_prog.bin
copy /B sg.snd + sg.snd stargate_snd.bin
make_vhdl_prom stargate_prog.bin stargate_prog.vhd
make_vhdl_prom decoder.4 stargate_decoder_4.vhd
make_vhdl_prom decoder.5 stargate_decoder_6.vhd
make_vhdl_prom stargate_snd.bin stargate_sound.vhd
make_vhdl_prom cmos.nvram stargate_cmos_ram.vhd
pause 0