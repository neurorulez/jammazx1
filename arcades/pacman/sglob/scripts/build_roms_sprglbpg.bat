@echo off

REM SHA1 sums of files required
REM														gfx1
REM c960cd5720bfa21db73e1000fe8be7d5baf2a3a1 *5e.cpu 	0x0000	0x1000
REM 194c8f816e5ff7614b3db4f355223667105738fa *5f.cpu	0x1000	0x1000
REM														maincpu
REM 467c9d70e07f403b6b9118aebe4e6d0abb40a5c1 *6e.cpu	0x0000	0x1000
REM 12fce48008c4f9387df0c84f3b0d7c5a1b35d898 *6f.cpu	0x1000	0x1000
REM 8c2458f98320c6887580c71632b544da0a582ba2 *6h.cpu	0x2000	0x1000
REM f91447ec1f06bf95106e6872d80dcb82e1d42ffb *6j.cpu	0x3000	0x1000
REM														proms
REM 4f2c3e7d6c38f0b9a90317f91feb3f86c9a0d0a5 *7f.cpu	0x0000	0x0020
REM 3a09b29374031aaa3722932aff974a467b3bb201 *4a.cpu 	0x0020	0x0100
REM														sound 
REM bbcec0570aeceb582ff8238a4bc8546a23430081 *82s126.1m	0x0000
REM 0c4d0bee858b97632411c440bea6948a74759746 *82s126.3m	0x0100 (timing . no usada)
rem														maincpu
REM ec0b123fd2e6de6681ca14f35fda249b2c2ec44f *wiza		0x8000	0x1000
REM 3ea384a1064302709d97fc16b347d3c012e90ac7 *wizb		0x9000	0x1000
REM ROM_START( sprglbpg )
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM	ROM_LOAD( "ic8.1",      0x0000, 0x1000, CRC(a2df2073) SHA1(14c55186053b080de06cc3691111ede8b2ead231) )
REM	ROM_LOAD( "ic7.2",      0x1000, 0x1000, CRC(3d2c22d9) SHA1(2f1d27e49850f904d1f2256bfcf00557ed88bb16) )
REM	ROM_LOAD( "ic15.3",      0x2000, 0x1000, CRC(a252047f) SHA1(9fadbb098b86ee98e1a81da938316b833fc26912) )
REM	ROM_LOAD( "ic14.4",      0x3000, 0x1000, CRC(7efa81f1) SHA1(583999280623f02dcc318a6c7af5ee6fc46144b8) )
REM
REM	ROM_REGION( 0x2000, "gfx1", 0 )
REM	ROM_LOAD( "ic92.5",  0x0000, 0x2000, CRC(e54f484d) SHA1(4feb9ec917c2467a5ac531283cb00fe308be7775) )
REM
REM	ROM_REGION( 0x0120, "proms", 0 )
REM	ROM_LOAD( "ic78.prm",      0x0000, 0x0020, CRC(1f617527) SHA1(448845cab63800a05fcb106897503d994377f78f) )
REM	ROM_LOAD( "ic88.prm",      0x0020, 0x0100, CRC(28faa769) SHA1(7588889f3102d4e0ca7918f536556209b2490ea1) )
REM
REM	ROM_REGION( 0x0200, "namco", 0 )    /* sound PROMs */
REM	ROM_LOAD( "ic51.prm",    0x0000, 0x0100, CRC(c29dea27) SHA1(563c9770028fe39188e62630711589d6ed242a66) )
REM	ROM_LOAD( "ic70.prm"  ,  0x0100, 0x0100, CRC(77245b66) SHA1(0c4d0bee858b97632411c440bea6948a74759746) ) /* timing - not used */
REM ROM_END

set rom_path_src=..\roms\sprglbpg
set rom_path=..\build
set romgen_path=..\romgen_source

REM concatenate consecutive ROM regions Solo para roms con mainpr > 8000
REM copy /b/y %rom_path_src%\wiza + %rom_path_src%\wizb %rom_path%\wiz.bin 
copy /b/y %rom_path_src%\ic92.5 %rom_path%\gfx1.bin 
copy /b/y %rom_path_src%\ic8.1 + %rom_path_src%\ic7.2 + %rom_path_src%\ic15.3 + %rom_path_src%\ic14.4 %rom_path%\main.bin 

REM generate RTL code for small PROMS
%romgen_path%\romgen %rom_path_src%\ic51.prm     PROM1_DST  9 l r e     > %rom_path%\prom1_dst.vhd
REM %romgen_path%\romgen %rom_path_src%\4a.cpu        PROM4_DST  8 l r e     > %rom_path%\prom4_dst.vhd
REM %romgen_path%\romgen %rom_path_src%\7f.cpu        PROM7_DST  4 l r e     > %rom_path%\prom7_dst.vhd
REM %romgen_path%\romgen %rom_path_src%\82s126.1m     PROM1_DST  9 c     > %rom_path%\prom1_dst.vhd
%romgen_path%\romgen %rom_path_src%\ic88.prm        PROM4_DST  8 c     > %rom_path%\prom4_dst.vhd
%romgen_path%\romgen %rom_path_src%\ic78.prm        PROM7_DST  4 c     > %rom_path%\prom7_dst.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\gfx1.bin          GFX1      13 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main.bin          ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd

REM this is ROM area is used and required
%romgen_path%\romgen %rom_path%\gfx1.bin           ROM_PGM_1 13 l r e > %rom_path%\rom1.vhd

echo done
pause
