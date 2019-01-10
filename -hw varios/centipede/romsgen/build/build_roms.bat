@echo off

romgen %rom_path%136001-407.d1 progrom_0 11 l r  > %rom_path%progrom_0.vhd
romgen %rom_path%136001-408.e1 progrom_1 11 l r  > %rom_path%progrom_1.vhd
romgen %rom_path%136001-409.fh1 progrom_2 11 l r  > %rom_path%progrom_2.vhd
romgen %rom_path%136001-410.j1 progrom_3 11 l r  > %rom_path%progrom_3.vhd


romgen %rom_path%136001-211.f7 gfxrom_0 11 l r  > %rom_path%gfxrom_0.vhd
romgen %rom_path%136001-212.hj7 gfxrom_1 11 l r  > %rom_path%gfxrom_1.vhd


romgen %rom_path%136001-213.p4 color_prom 8 c > %rom_path%color_prom.vhd


echo done
