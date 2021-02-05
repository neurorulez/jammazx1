copy /B 3006-22.10b+3006-23.11b+3006-24.12b+3006-13.1b+3006-14.2b+3006-15.3b+3006-16.4b+3006-17.5b+3006-18.6b+3006-19.7b+3006-20.8b+3006-21.9b joust_prog.bin

make_vhdl_prom joust_prog.bin joust_prog.vhd
make_vhdl_prom decoder.4 joust_decoder_4.vhd
make_vhdl_prom decoder.6 joust_decoder_6.vhd
make_vhdl_prom joust.snd joust_sound.vhd
pause 0