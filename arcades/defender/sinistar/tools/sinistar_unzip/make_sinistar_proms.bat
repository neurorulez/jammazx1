copy /B sinistar.10+sinistar.10+sinistar.11+sinistar.01+sinistar.02+sinistar.03+sinistar.04+sinistar.05+sinistar.06+sinistar.07+sinistar.08+sinistar.09 sinistar_prog.bin

make_vhdl_prom sinistar_prog.bin sinistar_prog.vhd
make_vhdl_prom decoder.4 sinistar_decoder_4.vhd
make_vhdl_prom decoder.6 sinistar_decoder_6.vhd
make_vhdl_prom sinistar.snd sinistar_sound.vhd
make_vhdl_prom cmos.nvram sinistar_cmos_ram.vhd
pause 0