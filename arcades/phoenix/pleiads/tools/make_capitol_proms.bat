make_vhdl_prom capitol_unzip\cp9.39    prom_ic39.vhd
make_vhdl_prom capitol_unzip\cp10.40   prom_ic40.vhd
make_vhdl_prom capitol_unzip\cp11.23   prom_ic23.vhd
make_vhdl_prom capitol_unzip\cp12.24   prom_ic24.vhd
make_vhdl_prom capitol_unzip\ic41.prm  prom_palette_ic40.vhd
make_vhdl_prom capitol_unzip\ic40.prm  prom_palette_ic41.vhd

copy /B capitol_unzip\cp1.45 + capitol_unzip\cp2.46 + capitol_unzip\cp3.47 + capitol_unzip\cp4.48 + capitol_unzip\cp5.49 + capitol_unzip\cp6.50 + capitol_unzip\cp7.51 + capitol_unzip\cp8.52 capitol_prog.bin
make_vhdl_prom capitol_prog.bin capitol_prog.vhd
pause 0