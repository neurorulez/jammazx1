make_vhdl_prom pleiads_unzip\ic39.bin   prom_ic39.vhd
make_vhdl_prom pleiads_unzip\ic40.bin   prom_ic40.vhd
make_vhdl_prom pleiads_unzip\ic23.bin   prom_ic23.vhd
make_vhdl_prom pleiads_unzip\ic24.bin   prom_ic24.vhd
make_vhdl_prom pleiads_unzip\7611-5.26  prom_palette_ic40.vhd
make_vhdl_prom pleiads_unzip\7611-5.33  prom_palette_ic41.vhd

copy /B pleiads_unzip\ic47.r1 + pleiads_unzip\ic48.r2 + pleiads_unzip\ic47.bin + pleiads_unzip\ic48.bin + pleiads_unzip\ic51.r5 + pleiads_unzip\ic50.bin + pleiads_unzip\ic53.r7 + pleiads_unzip\ic52.bin pleiads_prog.bin
make_vhdl_prom pleiads_prog.bin pleiads_prog.vhd
pause 0

REM ifiles=cp1.45  +cp2.46  + cp3.47   + cp4.48   + cp5.49  + cp6.50   + cp7.51  + cp8.52   
REM ifiles=ic47.r1 +ic48.r2 + ic47.bin + ic48.bin + ic51.r5 + ic50.bin + ic53.r7 + ic52.bin 

REM + cp11.23  + cp12.24  + cp9.39   + cp10.40  + ic40.prm  + ic41.prm
REM + ic23.bin + ic24.bin + ic39.bin + ic40.bin + 7611-5.33 + 7611-5.26