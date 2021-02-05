
copy /B cs03.bin + cs02.bin + cs01.bin + cs06.bin + cs04.bin + cs07.bin + cs05.bin + cs08.bin colony7_prog.bin

make_vhdl_prom colony7_prog.bin colony7_prog.vhd
make_vhdl_prom cs10.bin colony7_decoder_2.vhd
make_vhdl_prom decoder.3 colony7_decoder_3.vhd
make_vhdl_prom cs11.bin colony7_sound.vhd
pause 0