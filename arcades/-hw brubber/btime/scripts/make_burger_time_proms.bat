@echo off

set rom_path_src=..\roms\btime
set rom_path=..\build
set bin_path=..\scripts\bin

copy /B/y %rom_path_src%\aa04.9b + %rom_path_src%\aa06.13b + %rom_path_src%\aa05.10b + %rom_path_src%\aa07.15b %rom_path_src%\burger_time_prog.bin
copy /B/y %rom_path_src%\aa12.7k + %rom_path_src%\ab13.9k %rom_path_src%\fg_sp_graphx_1.bin
copy /B/y %rom_path_src%\ab10.10k + %rom_path_src%\ab11.12k %rom_path_src%\fg_sp_graphx_2.bin
copy /B/y %rom_path_src%\aa8.13k + %rom_path_src%\ab9.15k %rom_path_src%\fg_sp_graphx_3.bin

cd %rom_path%
%bin_path%\make_vhdl_prom %rom_path_src%\burger_time_prog.bin burger_time_prog.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\ab14.12h burger_time_sound_prog.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\fg_sp_graphx_1.bin fg_sp_graphx_1.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\fg_sp_graphx_2.bin fg_sp_graphx_2.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\fg_sp_graphx_3.bin fg_sp_graphx_3.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\ab00.1b bg_graphx_1.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\ab01.3b bg_graphx_2.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\ab02.4b bg_graphx_3.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\ab03.6b bg_map.vhd


del %rom_path_src%\burger_time_prog.bin
del %rom_path_src%\fg_sp_graphx_1.bin
del %rom_path_src%\fg_sp_graphx_2.bin
del %rom_path_src%\fg_sp_graphx_3.bin

pause