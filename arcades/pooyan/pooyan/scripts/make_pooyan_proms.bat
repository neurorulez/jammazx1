@echo off

set rom_path_src=..\roms\pooyan
set rom_path=..\build
set bin_path=..\scripts\bin

copy /B/y %rom_path_src%\1.4a + %rom_path_src%\2.5a + %rom_path_src%\3.6a + %rom_path_src%\4.7a %rom_path_src%\pooyan_prog.bin
copy /B/y %rom_path_src%\xx.7a + %rom_path_src%\xx.8a %rom_path_src%\pooyan_sound.bin

cd %rom_path%
%bin_path%\make_vhdl_prom %rom_path_src%\pooyan_prog.bin pooyan_prog.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\6.9a pooyan_sprite_grphx1.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\5.8a pooyan_sprite_grphx2.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\8.10g pooyan_char_grphx1.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\7.9g  pooyan_char_grphx2.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\pooyan_sound.bin pooyan_sound_prog.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\pooyan.pr1  pooyan_palette.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\pooyan.pr3  pooyan_char_color_lut.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\pooyan.pr2  pooyan_sprite_color_lut.vhd

del %rom_path_src%\pooyan_prog.bin
del %rom_path_src%\pooyan_sound.bin

pause