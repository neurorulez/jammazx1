copy /B  mpa-1.3m+mpa-2.3l+mpa-3.3k+mpa-4.3j prog.bin

make_vhdl_prom prog.bin prog_rom.vhd
make_vhdl_prom mpe-5.3e char1_rom.vhd
make_vhdl_prom mpe-4.3f char2_rom.vhd
make_vhdl_prom mpb-2.3m sprite1_rom.vhd
make_vhdl_prom mpb-1.3n sprite2_rom.vhd
make_vhdl_prom mpe-3.3h bg1_rom.vhd
make_vhdl_prom mpe-2.3k bg2_rom.vhd
make_vhdl_prom mpe-1.3l bg3_rom.vhd
pause 0



