copy /B roms\xvi_1.3p + roms\xvi_2.3m + roms\xvi_3.2m + roms\xvi_4.2l xevious_cpu1.bin
make_vhdl_prom xevious_cpu1.bin xevious_cpu1.vhd

copy /B roms\xvi_5.3f + roms\xvi_6.3j xevious_cpu2.bin
make_vhdl_prom xevious_cpu2.bin xevious_cpu2.vhd

make_vhdl_prom roms\xvi_7.2c xevious_cpu3.vhd

copy /B xevious_cpu1.bin + xevious_cpu2.bin + roms\xvi_7.2c +  roms\xvi_12.3b + roms\xvi_13.3c + roms\xvi_14.3d + roms\xvi_15.4m + roms\xvi_17.4p + roms\xvi_16.4n + roms\xvi_18.4r xevious_cpu_gfx_8bits.bin 

duplicate_byte xevious_cpu_gfx_8bits.bin xevious_cpu_gfx_16bits.bin 

make_vhdl_prom roms\xvi_9.2a        terrain_2a.vhd
make_vhdl_prom roms\xvi_10.2b       terrain_2b.vhd
make_vhdl_prom roms\xvi_11.2c       terrain_2c.vhd

make_vhdl_prom roms\xvi_8bpr.6a     red.vhd
make_vhdl_prom roms\xvi_9bpr.6d     green.vhd
make_vhdl_prom roms\xvi10bpr.6e     blue.vhd

make_vhdl_prom roms\xvi_7bpr.4h     bg_palette_lsb.vhd
make_vhdl_prom roms\xvi_6bpr.4f     bg_palette_msb.vhd

make_vhdl_prom roms\xvi_4bpr.3l     sp_palette_lsb.vhd
make_vhdl_prom roms\xvi_5bpr.3m     sp_palette_msb.vhd

make_vhdl_prom roms\xvi_1bpr.5n     sound_seq.vhd
make_vhdl_prom roms\xvi_2bpr.7n     sound_samples.vhd


make_vhdl_prom roms\50xx.bin cs50xx_prog.vhd
make_vhdl_prom roms\51xx.bin cs51xx_prog.vhd
make_vhdl_prom roms\54xx.bin cs54xx_prog.vhd

make_vhdl_prom xevious_cpu_gfx_8bits.bin xevious_cpu_gfx_8bits.vhd

pause 0