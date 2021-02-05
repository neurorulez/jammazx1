copy /B robotron.sba+robotron.sbb+robotron.sbc+robotron.sb1+robotron.sb2+robotron.sb3+robotron.sb4+robotron.sb5+robotron.sb6+robotron.sb7+robotron.sb8+robotron.sb9 robotron_prog.bin

make_vhdl_prom robotron_prog.bin robotron_prog.vhd
make_vhdl_prom decoder.4 robotron_decoder_4.vhd
make_vhdl_prom decoder.6 robotron_decoder_6.vhd
make_vhdl_prom robotron.snd robotron_sound.vhd
pause 0