flips -a IC81.bps ic81-v.3f IC81.ROM
flips -a IC82.bps ic82-w.5f IC82.ROM

echo Parche aplicado. Pulsa para continuar
pause 0
make_vhdl_prom IC81.ROM eprom_1.vhd
make_vhdl_prom IC82.ROM eprom_2.vhd
make_vhdl_prom a75-03.ic64 eprom_3.vhd
make_vhdl_prom a75-04.ic63 eprom_4.vhd
make_vhdl_prom a75-05.ic62 eprom_5.vhd
make_vhdl_prom a75-07.ic24 color_prom_1.vhd
make_vhdl_prom a75-08.ic23 color_prom_2.vhd
make_vhdl_prom a75-09.ic22 color_prom_3.vhd
romgen a75-07.ic24 color_prom_1c 9 c > color_prom_1c.vhd
romgen a75-08.ic23 color_prom_2c 9 c > color_prom_2c.vhd
romgen a75-09.ic22 color_prom_3c 9 c > color_prom_3c.vhd

pause 0
REM set ifiles= ic81-v.3f+ic82-w.5f+a75-03.ic64+a75-04.ic63+a75-05.ic62+a75-07.ic24+a75-08.ic23+a75-09.ic22

REM IC16: eprom_2
REM IC17: eprom_1
REM IC22: color_prom_3
REM IC23: color_prom_2
REM IC24: color_prom_1
REM IC62: eprom_5
REM IC63: eprom_4
REM IC64: eprom_3
REM ROM_START( arkanoid ) // v1.0 World
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM	ROM_LOAD( "a75-01-1.ic17", 0x0000, 0x8000, CRC(5bcda3b0) SHA1(52cadd38b5f8e8856f007a9c602d6b508f30be65) )
REM	ROM_LOAD( "a75-11.ic16",   0x8000, 0x8000, CRC(eafd7191) SHA1(d2f8843b716718b1de209e97a874e8ce600f3f87) ) // v1.x, region byte is 0x33
		
REM ROM_START( arkatayt )
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM ROM_LOAD( "ic81-v.3f",   0x0000, 0x8000, CRC(154e2c6f) SHA1(dce3ae1ca83b5071ebec96f3ae18b96abe828ce5) )
REM	ROM_LOAD( "ic82-w.5f",   0x8000, 0x8000, CRC(4fa8cefa) SHA1(fb825834da9c8638e6a328784922b5dc23f16564) )
