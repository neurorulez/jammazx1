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


REM ROM_START( mooncrst )
REM 	ROM_REGION( 0x8000, "maincpu", 0 )
REM 	ROM_LOAD( "mc1",          0x0000, 0x0800, CRC(7d954a7a) SHA1(a93ee403cfd7887538ad12d33f6dd6c71bea2a32) )
REM 	ROM_LOAD( "mc2",          0x0800, 0x0800, CRC(44bb7cfa) SHA1(349c2e23a9fce73f95bb8168d369082fa129fe3d) )
REM 	ROM_LOAD( "mc3",          0x1000, 0x0800, CRC(9c412104) SHA1(1b40054ebb1ace965a8522119bb23f09797bc5f6) )
REM 	ROM_LOAD( "mc4",          0x1800, 0x0800, CRC(7e9b1ab5) SHA1(435f603c0c3e788a509dd144a7916a34e791ae44) )
REM 	ROM_LOAD( "mc5.7r",       0x2000, 0x0800, CRC(16c759af) SHA1(3b48050411f65f9d3fb41ff22901e22d82bf1cf6) )
REM 	ROM_LOAD( "mc6.8d",       0x2800, 0x0800, CRC(69bcafdb) SHA1(939c8c6ed1cd4660a3d99b8f17ed99cbd7e1352a) )
REM 	ROM_LOAD( "mc7.8e",       0x3000, 0x0800, CRC(b50dbc46) SHA1(4fa084fd1ba5f78e7703e684c57af15ca7a844e4) )
REM 	ROM_LOAD( "mc8",          0x3800, 0x0800, CRC(18ca312b) SHA1(39219059003b949e38305553fea2d33071062c64) )
REM 
REM 	ROM_REGION( 0x2000, "gfx1", 0 )
REM 	ROM_LOAD( "mcs_b",        0x0000, 0x0800, CRC(fb0f1f81) SHA1(38a6679a8b69bc1870a0e67e692131c42f9535c8) )
REM 	ROM_LOAD( "mcs_d",        0x0800, 0x0800, CRC(13932a15) SHA1(b8885c555c6ad7021be55c6925a0a0872c1b6abd) )
REM 	ROM_LOAD( "mcs_a",        0x1000, 0x0800, CRC(631ebb5a) SHA1(5bc9493afa76c55858b8c8849524cbc77dc838fc) )
REM 	ROM_LOAD( "mcs_c",        0x1800, 0x0800, CRC(24cfd145) SHA1(08c6599db170dd6ee364c44f70a0f5c0f881b6ef) )
REM 
REM 	ROM_REGION( 0x0020, "proms", 0 )
REM 	ROM_LOAD( "mmi6331.6l", 0x0000, 0x0020, CRC(6a0c7d87) SHA1(140335d85c67c75b65689d4e76d29863c209cf32) ) /* Compatible with 82s123 prom */
REM ROM_END
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


set rom_path_src=mooncrgx
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
REM copy /b/y %rom_path_src%\1h.bin + %rom_path_src%\1k.bin %rom_path%\gfx1.bin > NUL
copy /b/y %rom_path_src%\1 + %rom_path_src%\2 + %rom_path_src%\3 + %rom_path_src%\4 + %rom_path_src%\5 + %rom_path_src%\6 + %rom_path_src%\7 + %rom_path_src%\8 %rom_path%\main.bin > NUL
copy /b/y %rom_path_src%\1h_1_10.bin + %rom_path_src%\12.chr %rom_path_src%\1h.bin > NUL
copy /b/y %rom_path_src%\9.chr + %rom_path_src%\11.chr %rom_path_src%\1k.bin > NUL
copy galaxian_fire.vhd %rom_path%\galaxian_fire.vhd
copy galaxian_hit.vhd %rom_path%\galaxian_hit.vhd

REM generate RTL code for small PROMS
REM %romgen_path%\romgen %rom_path_src%\6l.bpr    GALAXIAN_6L  5 c     > %rom_path%\galaxian_6l.vhd
%romgen_path%\romgen %rom_path_src%\l06_prom.bin    GALAXIAN_6L  5 l r e     > %rom_path%\galaxian_6l.vhd

REM generate RAMB structures for larger ROMS
REM %romgen_path%\romgen %rom_path%\gfx1.bin        GFX1      12 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin        ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

%romgen_path%\romgen %rom_path_src%\1h.bin    GALAXIAN_1H 11 l r e > %rom_path%\galaxian_1h.vhd
%romgen_path%\romgen %rom_path_src%\1k.bin    GALAXIAN_1K 11 l r e > %rom_path%\galaxian_1k.vhd

REM %romgen_path%\romgen %rom_path_src%\mc_wav_2.bin GALAXIAN_WAV 18 l r e > %rom_path%\galaxian_wav.vhd

echo done
pause
