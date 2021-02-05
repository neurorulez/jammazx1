copy /B aa04.9b + aa06.13b + aa05.10b + aa07.15b burger_time_prog.bin
make_vhdl_prom burger_time_prog.bin burger_time_prog.vhd

make_vhdl_prom ab14.12h burger_time_sound_prog.vhd

copy /B aa12.7k  + ab13.9k  fg_sp_graphx_1.bin
make_vhdl_prom fg_sp_graphx_1.bin fg_sp_graphx_1.vhd

copy /B ab10.10k + ab11.12k fg_sp_graphx_2.bin
make_vhdl_prom fg_sp_graphx_2.bin fg_sp_graphx_2.vhd

copy /B aa8.13k  + ab9.15k  fg_sp_graphx_3.bin
make_vhdl_prom fg_sp_graphx_3.bin fg_sp_graphx_3.vhd

make_vhdl_prom ab00.1b bg_graphx_1.vhd
make_vhdl_prom ab01.3b bg_graphx_2.vhd
make_vhdl_prom ab02.4b bg_graphx_3.vhd
make_vhdl_prom ab03.6b bg_map.vhd

