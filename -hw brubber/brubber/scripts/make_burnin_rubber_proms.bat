@echo off

set rom_path_src=..\roms\brubber
set rom_path=..\build
set bin_path=..\scripts\bin

copy /B/y %rom_path_src%\brubber.12c + %rom_path_src%\brubber.12d %rom_path_src%\burnin_rubber_prog.bin

cd %rom_path%
%bin_path%\make_vhdl_prom %rom_path_src%\burnin_rubber_prog.bin burnin_rubber_prog.vhd

%bin_path%\make_vhdl_prom %rom_path_src%\bnj4e.bin fg_sp_graphx_1.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\bnj4f.bin fg_sp_graphx_2.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\bnj4h.bin fg_sp_graphx_3.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\bnj10e.bin bg_graphx_1.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\bnj10f.bin bg_graphx_2.vhd
%bin_path%\make_vhdl_prom %rom_path_src%\bnj6c.bin burnin_rubber_sound_prog.vhd


del %rom_path_src%\burnin_rubber_prog.bin

pause