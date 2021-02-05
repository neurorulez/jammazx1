@echo off

REM SHA1 sums of files required
REM 5422df979e82bcc73df49f50515fe76c126c037b *2d
REM a8ee9ddfadf5e9accedfaf81da757a88a2e55a0a *2e
REM 3eae2b3e4596505a8afb5c5cfb108e823c2c4319 *2f
REM 170f9e92f0a3bee04407be27210b4fa825367688 *2h
REM e426ef6a7444a39a34d59799973b07d11b89f372 *2j
REM 174df3f281068c767344f751daace646360e26d6 *2l
REM a2f3380982d93a022f46756f974fd16c4cd617de *2m
REM f3a9c4d1d91836476fcad87ea0d243dde7171e0a *2p
REM d64134089bebd995b3a1a089411e180c8c29f32d *5f
REM 81b44eb1ce43cebde87f0a41ade2e7eb291af78d *5h
REM a25083c3e36d28afdefe4af6e6d4f3155e303625 *c01s.6e
REM 8ed78487d76fd0a917ab7b258937a46e2cd9800c *ot1.5c
REM 8558b4eff5d7e63029b325edef9914feda5834c3 *ot2.5d
REM 1f976d8595706730e29f93027e7ab4620075c078 *ot3.5e

REM ROM_START( scramble )
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM	ROM_LOAD( "s1.2d",        0x0000, 0x0800, CRC(ea35ccaa) SHA1(1dcb375987fe21e0483c27d485c405de53848d61) )
REM	ROM_LOAD( "s2.2e",        0x0800, 0x0800, CRC(e7bba1b3) SHA1(240877576045fddcc9ff01d97dc78139454ac4f1) )
REM	ROM_LOAD( "s3.2f",        0x1000, 0x0800, CRC(12d7fc3e) SHA1(a84d191c7be8700f630a83ddad798be9e83b5d55) )
REM	ROM_LOAD( "s4.2h",        0x1800, 0x0800, CRC(b59360eb) SHA1(5d155808c19dcf2e14aa8e29c0ee41a6d3d3c43a) )
REM	ROM_LOAD( "s5.2j",        0x2000, 0x0800, CRC(4919a91c) SHA1(9cb5861c61e4783e5fbaa3869d51195f127b1129) )
REM	ROM_LOAD( "s6.2l",        0x2800, 0x0800, CRC(26a4547b) SHA1(67c0fa81729370631647b5d78bb5a61433facd7f) )
REM	ROM_LOAD( "s7.2m",        0x3000, 0x0800, CRC(0bb49470) SHA1(05a6fe3010c2136284ca76352dac147797c79778) )
REM	ROM_LOAD( "s8.2p",        0x3800, 0x0800, CRC(6a5740e5) SHA1(e3b09141cee26857d626412e9d1a0e759469b97a) )
REM
REM	ROM_REGION( 0x10000, "audiocpu", 0 )
REM	ROM_LOAD( "ot1.5c",       0x0000, 0x0800, CRC(bcd297f0) SHA1(8ed78487d76fd0a917ab7b258937a46e2cd9800c) )
REM	ROM_LOAD( "ot2.5d",       0x0800, 0x0800, CRC(de7912da) SHA1(8558b4eff5d7e63029b325edef9914feda5834c3) )
REM	ROM_LOAD( "ot3.5e",       0x1000, 0x0800, CRC(ba2fa933) SHA1(1f976d8595706730e29f93027e7ab4620075c078) )
REM
REM	ROM_REGION( 0x1000, "gfx1", 0 )
REM	ROM_LOAD( "c2.5f",        0x0000, 0x0800, CRC(4708845b) SHA1(a8b1ad19a95a9d35050a2ab7194cc96fc5afcdc9) )
REM	ROM_LOAD( "c1.5h",        0x0800, 0x0800, CRC(11fd2887) SHA1(69844e48bb4d372cac7ae83c953df573c7ecbb7f) )
REM
REM	ROM_REGION( 0x0020, "proms", 0 )
REM	ROM_LOAD( "c01s.6e",      0x0000, 0x0020, CRC(4e3caeab) SHA1(a25083c3e36d28afdefe4af6e6d4f3155e303625) )
REM ROM_END

REM	ROM_START( amidars )
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM	ROM_LOAD( "am2d",         0x0000, 0x0800, CRC(24b79547) SHA1(eca735c6a35561a9a6ba8a20dca1e1c78ed073fc) )
REM	ROM_LOAD( "am2e",         0x0800, 0x0800, CRC(4c64161e) SHA1(5b2e49ff915295617671b13f15b566046a5dbc15) )
REM	ROM_LOAD( "am2f",         0x1000, 0x0800, CRC(b3987a72) SHA1(1d72e9ae3005029628c6f9beb6ca65afcb1f7893) )
REM	ROM_LOAD( "am2h",         0x1800, 0x0800, CRC(29873461) SHA1(7d0ee9a82f02163b4cc6a7097e88ae34e96ebf58) )
REM	ROM_LOAD( "am2j",         0x2000, 0x0800, CRC(0fdd54d8) SHA1(c32fdc8e292d91159e6c80c7033abea6404a4f2c) )
REM	ROM_LOAD( "am2l",         0x2800, 0x0800, CRC(5382f7ed) SHA1(425ec2c2caf404fc8ab13ee38d6567413022e1a1) )
REM	ROM_LOAD( "am2m",         0x3000, 0x0800, CRC(1d7109e9) SHA1(e0d24475547bbe5a94b45be6abefb84ad84d2534) )
REM	ROM_LOAD( "am2p",         0x3800, 0x0800, CRC(c9163ac6) SHA1(46d757180426b71c827d14a35824a248f2c787b6) )
REM	
REM	ROM_REGION( 0x10000, "audiocpu", 0 )
REM	ROM_LOAD( "amidarus.5c",  0x0000, 0x1000, CRC(8ca7b750) SHA1(4f4c2915503b85abe141d717fd254ee10c9da99e) )
REM	ROM_LOAD( "amidarus.5d",  0x1000, 0x1000, CRC(9b5bdc0a) SHA1(84d953618c8bf510d23b42232a856ac55f1baff5) )
REM	
REM	ROM_REGION( 0x1000, "gfx1", 0 )
REM	ROM_LOAD( "2716.a6",      0x0000, 0x0800, CRC(2082ad0a) SHA1(c6014d9575e92adf09b0961c2158a779ebe940c4) )   /* Same graphics ROMs as Amigo */
REM	ROM_LOAD( "2716.a5",      0x0800, 0x0800, CRC(3029f94f) SHA1(3b432b42e79f8b0a7d65e197f373a04e3c92ff20) )
REM
REM	ROM_REGION( 0x0020, "proms", 0 )
REM	ROM_LOAD( "amidar.clr",   0x0000, 0x0020, CRC(f940dcc3) SHA1(1015e56f37c244a850a8f4bf0e36668f047fd46d) )
REM ROM_END

REM ROM_START( amidaru )
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM	ROM_LOAD( "amidarus.2c",  0x0000, 0x1000, CRC(951e0792) SHA1(3a68b829c9ffb465bd6582c9ea566e0e947c6c19) )
REM	ROM_LOAD( "amidarus.2e",  0x1000, 0x1000, CRC(a1a3a136) SHA1(330ec857fdf4c1b28e2560a5f63a2432f87f9b2f) )
REM	ROM_LOAD( "amidarus.2f",  0x2000, 0x1000, CRC(a5121bf5) SHA1(fe15b91724758ede43dd332327919f164772c592) )
REM	ROM_LOAD( "amidarus.2h",  0x3000, 0x1000, CRC(051d1c7f) SHA1(3cfa0f728a5c27da0a3fe2579ad226129ccde232) )
REM	ROM_LOAD( "amidarus.2j",  0x4000, 0x1000, CRC(351f00d5) SHA1(6659357f40f888b21be00826246200fd3a8a88ce) )
REM
REM	ROM_REGION( 0x10000, "audiocpu", 0 )
REM	ROM_LOAD( "amidarus.5c",  0x0000, 0x1000, CRC(8ca7b750) SHA1(4f4c2915503b85abe141d717fd254ee10c9da99e) )
REM	ROM_LOAD( "amidarus.5d",  0x1000, 0x1000, CRC(9b5bdc0a) SHA1(84d953618c8bf510d23b42232a856ac55f1baff5) )
REM
REM	ROM_REGION( 0x1000, "gfx1", 0 )
REM	ROM_LOAD( "amidarus.5f",  0x0000, 0x0800, CRC(2cfe5ede) SHA1(0d86a78008ac8653c17fff5be5ebdf1f0a9d31eb) )
REM	ROM_LOAD( "amidarus.5h",  0x0800, 0x0800, CRC(57c4fd0d) SHA1(8764deec9fbff4220d61df621b12fc36c3702601) )
REM
REM	ROM_REGION( 0x0020, "proms", 0 )
REM	ROM_LOAD( "amidar.clr",   0x0000, 0x0020, CRC(f940dcc3) SHA1(1015e56f37c244a850a8f4bf0e36668f047fd46d) )
REM ROM_END

REM ROM_START( amidar )
REM	ROM_REGION( 0x10000, "maincpu", 0 )
REM	ROM_LOAD( "1.2c",  0x0000, 0x1000, CRC(621b74de) SHA1(f064eccfb7da18119ed3088a5f939085eb446c90) )
REM	ROM_LOAD( "2.2e",  0x1000, 0x1000, CRC(38538b98) SHA1(12b2a0c09926d006781bee5d450bc0c391cc1fb5) )
REM	ROM_LOAD( "3.2f",  0x2000, 0x1000, CRC(099ecb24) SHA1(e83f049b25aba481e09606db3158726145ebd656) )
REM	ROM_LOAD( "4.2h",  0x3000, 0x1000, CRC(ba149a93) SHA1(9ef1d27f0780612be0ea2be94c3a2c781a4924c8) )
REM	ROM_LOAD( "5.2j",  0x4000, 0x1000, CRC(eecc1abf) SHA1(1530b374d15e0d05c8eb988cc1cbab48b0be211c) )
REM
REM	ROM_REGION( 0x10000, "audiocpu", 0 )
REM	ROM_LOAD( "s1.5c",  0x0000, 0x1000, CRC(8ca7b750) SHA1(4f4c2915503b85abe141d717fd254ee10c9da99e) )
REM	ROM_LOAD( "s2.5d",  0x1000, 0x1000, CRC(9b5bdc0a) SHA1(84d953618c8bf510d23b42232a856ac55f1baff5) )
REM
REM	ROM_REGION( 0x1000, "gfx1", 0 )
REM	ROM_LOAD( "c2.5f",  0x0000, 0x0800, CRC(2cfe5ede) SHA1(0d86a78008ac8653c17fff5be5ebdf1f0a9d31eb) )
REM	ROM_LOAD( "c2.5d",  0x0800, 0x0800, CRC(57c4fd0d) SHA1(8764deec9fbff4220d61df621b12fc36c3702601) )
REM
REM	ROM_REGION( 0x0020, "proms", 0 )
REM	ROM_LOAD( "amidar.clr",   0x0000, 0x0020, CRC(f940dcc3) SHA1(1015e56f37c244a850a8f4bf0e36668f047fd46d) )
REM ROM_END


set rom_path_src=amidaru
set rom_path=..\source\roms
set romgen_path=romgen

REM concatenate consecutive ROM regions
copy /b %rom_path_src%\amidarus.2c + %rom_path_src%\amidarus.2e + %rom_path_src%\amidarus.2f + %rom_path_src%\amidarus.2h + %rom_path_src%\amidarus.2j %rom_path%\rom.bin > NUL

REM generate RTL code for small PROMS
%romgen_path%\romgen %rom_path_src%\amidar.clr       ROM_LUT        5 l r e > %rom_path%\ROM_LUT.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\rom.bin           ROM_PGM   14 l r e > %rom_path%\ROM_PGM.vhd

%romgen_path%\romgen %rom_path_src%\amidarus.5f            ROM_OBJ_0 11 l r e > %rom_path%\ROM_OBJ_0.vhd
%romgen_path%\romgen %rom_path_src%\amidarus.5d            ROM_OBJ_1 11 l r e > %rom_path%\ROM_OBJ_1.vhd

%romgen_path%\romgen %rom_path_src%\s1-0-800.5c        ROM_SND_0 11 l r e > %rom_path%\ROM_SND_0.vhd
%romgen_path%\romgen %rom_path_src%\s1-800-1000.5c     ROM_SND_1 11 l r e > %rom_path%\ROM_SND_1.vhd
%romgen_path%\romgen %rom_path_src%\s2.5d              ROM_SND_2 11 l r e > %rom_path%\ROM_SND_2.vhd

echo done
echo REMEMBER to set I_HWSEL_FROGGER := false in the VHDL code!
pause
