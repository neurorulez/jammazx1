copy /B berzerk_rc31_1d.rom1.1d + berzerk_rc31_3d.rom2.3d + berzerk_rc31_5d.rom3.5d + berzerk_rc31_6d.rom4.6d + berzerk_rc31_5c.rom5.5c prog2.bin
copy /B berzerk_r_vo_1c.1c + berzerk_r_vo_2c.2c speech.bin


make_vhdl_prom berzerk_rc31_1c.rom0.1c berzerk_program1.vhd
make_vhdl_prom prog2.bin berzerk_program2.vhd
make_vhdl_prom speech.bin berzerk_speech.vhd

del prog2.bin speech.bin
pause 0



