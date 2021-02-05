copy /B 1d-1 + 3d-2 + 5d-3 + 6d-4 prog1.bin
copy /B e169-1cvo.1c + e169-2cvo.2c speech.bin


make_vhdl_prom 1c-0 berzerk_program2.vhd
make_vhdl_prom prog1.bin berzerk_program1.vhd
make_vhdl_prom speech.bin berzerk_speech_rom.vhd

del prog2.bin speech.bin
pause 0



