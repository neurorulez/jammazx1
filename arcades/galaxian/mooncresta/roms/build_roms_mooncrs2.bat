@echo off

REM SHA1 sums of files required
REM GFX
REM 4755609bd974976f04855d51e08ec0d62ab4bc07 *1h.bin        0x0000 - 0x0800 
REM a9795d8b7388f404f3b0e2c6ce15d713a4c5bafa *1k.bin        0x0800 - 0x0800
REM PROMS
REM f382ad5a34d282056c78a5ec00c30ec43772bae2 *6l.bpr        0x0000 - 0x0020
REM MAIN CPU
REM e65f74e35b1bfaccd407e168ea55678ae9b68edf *galmidw.u		0x0000 - 0x0800
REM 02fdcd95d8511e64c0d2b007b874112d53e41045 *galmidw.v     0x0800 - 0x0800
REM 0046b9ed697a34d088de1aead8bd7cbe526a2396 *galmidw.w     0x1000 - 0x0800
REM 18d8714e5ef52f63ba8888ecc5a25b17b3bf17d1 *galmidw.y     0x1800 - 0x0800
REM 8b44b0f74420871454e27894d0f004859f9e59a9 *7l            0x2000 - 0x0800

REM ROM_START( mooncrs2 )
REM 	ROM_REGION( 0x8000, "maincpu", 0 )
REM 	ROM_LOAD( "f8.bin",       0x0000, 0x0800, CRC(d36003e5) SHA1(562b27f1bccce6ae29de18b93fa51c508446cda9) )
REM 	ROM_LOAD( "bepr195",      0x0800, 0x0800, CRC(ee262ff2) SHA1(4e2202023ad53109ea58304071735d2425a617f3) )
REM 	ROM_LOAD( "f03.bin",      0x1000, 0x0800, CRC(29a2b0ab) SHA1(e9fc7161d0566e36307c45b7132e2262c0af4845) )
REM 	ROM_LOAD( "f04.bin",      0x1800, 0x0800, CRC(4c6a5a6d) SHA1(366516f63c9b5239e703e4dfb672659049ddbf44) )
REM 	ROM_LOAD( "e5",           0x2000, 0x0800, CRC(06d378a6) SHA1(99dbe9fc7f95f8fdce86eb5c32bd1ca1bea0ca3c) )
REM 	ROM_LOAD( "bepr199",      0x2800, 0x0800, CRC(6e84a927) SHA1(82e8e825d157c3c947a3a222bca059a735169c7d) )
REM 	ROM_LOAD( "e7",           0x3000, 0x0800, CRC(b45af1e8) SHA1(d7020774707234acdaef5c655f667d5ee9e54a13) )
REM 	ROM_LOAD( "m7.bin",       0x3800, 0x0800, CRC(957ee078) SHA1(472038dedfc01c995be889ea93d4df8bef2b874c) )
REM 
REM 	ROM_REGION( 0x2000, "gfx1", 0 )
REM 	ROM_LOAD( "1h_1_10.bin",  0x0000, 0x0800, CRC(528da705) SHA1(d726ee18b79774c982f88afb2a508eb5d5783193) )
REM 	ROM_LOAD( "12.chr",       0x0800, 0x0200, CRC(5a4b17ea) SHA1(8a879dc34fdecc8a121c4a87abb981212fb05945) )
REM 	ROM_CONTINUE(             0x0c00, 0x0200 )  /* this version of the gfx ROMs has two */
REM 	ROM_CONTINUE(             0x0a00, 0x0200 )  /* groups of 16 sprites swapped */
REM 	ROM_CONTINUE(             0x0e00, 0x0200 )
REM 	ROM_LOAD( "1k_1_11.bin",  0x1000, 0x0800, CRC(4e79ff6b) SHA1(f72386a3766a7fcc7b4b8cedfa58b8d57f911f6f) )
REM 	ROM_LOAD( "11.chr",       0x1800, 0x0200, CRC(e0edccbd) SHA1(0839a4c9b6e863d12253ae8e1732e80e08702228) )
REM 	ROM_CONTINUE(             0x1c00, 0x0200 )
REM 	ROM_CONTINUE(             0x1a00, 0x0200 )
REM 	ROM_CONTINUE(             0x1e00, 0x0200 )
REM 
REM 	ROM_REGION( 0x0020, "proms", 0 )
REM 	ROM_LOAD( "mmi6331.6l", 0x0000, 0x0020, CRC(6a0c7d87) SHA1(140335d85c67c75b65689d4e76d29863c209cf32) ) /* Compatible with 82s123 prom */
REM 

set rom_path_src=mooncrs2
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
REM copy /b/y %rom_path_src%\1h.bin + %rom_path_src%\1k.bin %rom_path%\gfx1.bin > NUL
copy /b/y %rom_path_src%\f8.bin + %rom_path_src%\bepr195 + %rom_path_src%\f03.bin+ %rom_path_src%\f04.bin + %rom_path_src%\e5 + %rom_path_src%\bepr199 + %rom_path_src%\e7 + %rom_path_src%\m7.bin %rom_path%\main.bin > NUL
copy /b/y %rom_path_src%\1h_1_10.bin + %rom_path_src%\12.chr %rom_path_src%\1h.bin > NUL
copy /b/y %rom_path_src%\1k_1_11.bin + %rom_path_src%\11.chr %rom_path_src%\1k.bin > NUL
copy galaxian_fire.vhd %rom_path%\galaxian_fire.vhd
copy galaxian_hit.vhd %rom_path%\galaxian_hit.vhd

REM generate RTL code for small PROMS
REM %romgen_path%\romgen %rom_path_src%\6l.bpr    GALAXIAN_6L  5 c     > %rom_path%\galaxian_6l.vhd
%romgen_path%\romgen %rom_path_src%\mmi6331.6l    GALAXIAN_6L  5 l r e     > %rom_path%\galaxian_6l.vhd

REM generate RAMB structures for larger ROMS
REM %romgen_path%\romgen %rom_path%\gfx1.bin        GFX1      12 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin        ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

%romgen_path%\romgen %rom_path_src%\1h.bin    GALAXIAN_1H 11 l r e > %rom_path%\galaxian_1h.vhd
%romgen_path%\romgen %rom_path_src%\1k.bin    GALAXIAN_1K 11 l r e > %rom_path%\galaxian_1k.vhd

REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
