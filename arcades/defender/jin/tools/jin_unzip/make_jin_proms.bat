copy /B ic03-3.bin+ic02-2.bin+ic01-1.bin+ic04-4.bin+ic05-5.bin+ic06-6.bin+ic07-7d.bin mayday_prog.bin

make_vhdl_prom mayday_prog.bin mayday_prog.vhd
make_vhdl_prom decoder.2 mayday_decoder_2.vhd
make_vhdl_prom decoder.3 mayday_decoder_3.vhd
make_vhdl_prom ic28-8.bin mayday_sound.vhd
pause 0