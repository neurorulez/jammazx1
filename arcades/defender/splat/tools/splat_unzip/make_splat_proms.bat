copy /B splat.10+splat.11+splat.12+splat.01+splat.02+splat.03+splat.04+splat.05+splat.06+splat.07+splat.08+splat.09 splat_prog.bin

make_vhdl_prom splat_prog.bin splat_prog.vhd
make_vhdl_prom decoder.4 splat_decoder_4.vhd
make_vhdl_prom decoder.6 splat_decoder_6.vhd
make_vhdl_prom splat.snd splat_sound.vhd
make_vhdl_prom cmos.nvram splat_cmos_ram.vhd
pause 0