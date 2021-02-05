copy /B bubbles.10b+bubbles.11b+bubbles.12b+bubbles.1b+bubbles.2b+bubbles.3b+bubbles.4b+bubbles.5b+bubbles.6b+bubbles.7b+bubbles.8b+bubbles.9b bubbles_prog.bin

make_vhdl_prom bubbles_prog.bin bubbles_prog.vhd
make_vhdl_prom decoder.4 bubbles_decoder_4.vhd
make_vhdl_prom decoder.6 bubbles_decoder_6.vhd
make_vhdl_prom bubbles.snd bubbles_sound.vhd
pause 0