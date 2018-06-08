@echo off

set rom_path_src=..\roms\timeplt
set rom_path=..\build
set bin_path=..\scripts\bin

copy /B/y %rom_path_src%\tm1 + %rom_path_src%\tm2 + %rom_path_src%\tm3 %rom_path_src%\time_pilot_prog.bin
copy /B/y %rom_path_src%\tm4 + %rom_path_src%\tm5 %rom_path_src%\time_pilot_sprite_grphx.bin

cd %rom_path%
%bin_path%\make_vhdl_prom %rom_path_src%\time_pilot_prog.bin time_pilot_prog.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\time_pilot_sprite_grphx.bin time_pilot_sprite_grphx.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\tm6 time_pilot_char_grphx.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\tm7 time_pilot_sound_prog.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\timeplt.b4  time_pilot_palette_blue_green.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\timeplt.b5  time_pilot_palette_green_red.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\timeplt.e9  time_pilot_sprite_color_lut.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\timeplt.e12 time_pilot_char_color_lut.vhd


del %rom_path_src%\time_pilot_prog.bin
del %rom_path_src%\time_pilot_sprite_grphx.bin

pause