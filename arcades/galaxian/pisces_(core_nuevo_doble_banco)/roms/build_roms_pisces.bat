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

REM ROM_START( mooncrgx )
REM 	ROM_REGION( 0x8000, "maincpu", 0 )
REM 	ROM_LOAD( "1",            0x0000, 0x0800, CRC(84cf420b) SHA1(82c979467c51df699337d5878340d05bee606480) )
REM 	ROM_LOAD( "2",            0x0800, 0x0800, CRC(4c2a61a1) SHA1(a3759bd2c062f2843cd5b812529c798d5d12086c) )
REM 	ROM_LOAD( "3",            0x1000, 0x0800, CRC(1962523a) SHA1(56ea003c3ff37c2bc33383207fccde0ba0ed781a) )
REM 	ROM_LOAD( "4",            0x1800, 0x0800, CRC(75dca896) SHA1(017d04501d3d1305491ba843d92ebd74d47d2f9c) )
REM 	ROM_LOAD( "5",            0x2000, 0x0800, CRC(32483039) SHA1(23baf136d5b7fc02f999dcb31b8daf68b6ffafd1) )
REM 	ROM_LOAD( "6",            0x2800, 0x0800, CRC(43f2ab89) SHA1(f7f0802a12fd89d61f6f00044e077f34a9d3955f) )
REM 	ROM_LOAD( "7",            0x3000, 0x0800, CRC(1e9c168c) SHA1(891dc159dfc343322c3241980a0ef76dee510ca9) )
REM 	ROM_LOAD( "8",            0x3800, 0x0800, CRC(5e09da94) SHA1(677890912db12df6fa2cb515c198f8ac3f7187af) )
REM 	ROM_REGION( 0x2000, "gfx1", 0 )
REM 	ROM_LOAD( "1h_1_10.bin",  0x0000, 0x0800, CRC(528da705) SHA1(d726ee18b79774c982f88afb2a508eb5d5783193) )
REM 	ROM_LOAD( "12.chr",       0x0800, 0x0200, CRC(5a4b17ea) SHA1(8a879dc34fdecc8a121c4a87abb981212fb05945) )
REM 	ROM_CONTINUE(             0x0c00, 0x0200 )
REM 	ROM_CONTINUE(             0x0a00, 0x0200 )
REM 	ROM_CONTINUE(             0x0e00, 0x0200 )
REM 	ROM_LOAD( "9.chr",        0x1000, 0x0800, CRC(70df525c) SHA1(f771293494a2234bf80f206ecf1e88773322e503) )
REM 	ROM_LOAD( "11.chr",       0x1800, 0x0200, CRC(e0edccbd) SHA1(0839a4c9b6e863d12253ae8e1732e80e08702228) )
REM 	ROM_CONTINUE(             0x1c00, 0x0200 )
REM 	ROM_CONTINUE(             0x1a00, 0x0200 )
REM 	ROM_CONTINUE(             0x1e00, 0x0200 )
REM 	ROM_REGION( 0x0020, "proms", 0 )
REM 	ROM_LOAD( "l06_prom.bin", 0x0000, 0x0020, CRC(6a0c7d87) SHA1(140335d85c67c75b65689d4e76d29863c209cf32) )
REM ROM_END
set rom_path_src=pisces
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
copy /b/y %rom_path_src%\g09.bin + %rom_path_src%\g11.bin %rom_path_src%\1j.bin
copy /b/y %rom_path_src%\g10.bin + %rom_path_src%\g12.bin %rom_path_src%\1k.bin
copy /b/y %rom_path_src%\p1.bin + %rom_path_src%\p2.bin + %rom_path_src%\p3.bin + %rom_path_src%\p4.bin + %rom_path_src%\p5.bin + %rom_path_src%\p6.bin %rom_path%\main.bin

REM generate RTL code for small PROMS
REM %romgen_path%\romgen %rom_path_src%\6l.bpr    GALAXIAN_6L  5 c     > %rom_path%\galaxian_6l.vhd
%romgen_path%\romgen %rom_path_src%\colour.bin    GALAXIAN_6L  5 l r e     > %rom_path%\galaxian_6l.vhd

REM generate RAMB structures for larger ROMS
rem %romgen_path%\romgen %rom_path%\gfx1.bin        GFX1      12 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin        ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

%romgen_path%\romgen %rom_path_src%\1j.bin    GALAXIAN_1H 12 l r e > %rom_path%\galaxian_1h.vhd
%romgen_path%\romgen %rom_path_src%\1k.bin    GALAXIAN_1K 12 l r e > %rom_path%\galaxian_1k.vhd

REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
