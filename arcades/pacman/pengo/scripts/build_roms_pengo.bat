@echo off

REM SHA1 sums of files required

REM e542bcc28f292be9a0a29d949de726e0b55e654a ep1640.92
REM 0930de17a763a527057f60783a92662b09554426 ep1689c.8
REM 4c97529e61eeca5d94938b1dfbeac41bf8cbaf7d ep1690b.7
REM c8949fbdbfe5023ee17a789ef60205e834a76c81 ep1691b.15
REM 7079769d14dfe3873ffe29623ba0a93413706c6d ep1692b.14
REM c0508951c2ad8dc31481be8b3bfee2063e3fb0d7 ep1693b.21
REM 7b47aec61593efd758e2a031f72a854bb0ba8af1 ep1694b.20
REM bdec535e486b43a8f5550334beff423eeace10b2 ep1695.105
REM 207ed466546f40ca60a38031b83aef61446902e2 ep5118b.32
REM fec7236b3dee2ea6e39c68440a6d2d9e3f72675a ep5119c.31
REM 680eab0e1204c9b74adc11588461651b474021bb pr1633.78
REM 3fcd66610fcaee814953a115bf5e04788923181f pr1634.88
REM 563c9770028fe39188e62630711589d6ed242a66 pr1635.51
REM 0c4d0bee858b97632411c440bea6948a74759746 pr1636.70

set rom_path_src=..\roms\pengo
set rom_path=..\build
set romgen_path=..\..\_util_rom

REM concatenate consecutive ROM regions
copy /b/y %rom_path_src%\ep1640.92  + %rom_path_src%\ep1695.105 %rom_path%\gfx1.bin > NUL
copy /b/y %rom_path_src%\ep1689c.8  + %rom_path_src%\ep1690b.7  + %rom_path_src%\ep1691b.15 + %rom_path_src%\ep1692b.14 %rom_path%\main1.bin > NUL
copy /b/y %rom_path_src%\ep1693b.21 + %rom_path_src%\ep1694b.20 + %rom_path_src%\ep5118b.32 + %rom_path_src%\ep5119c.31 %rom_path%\main2.bin > NUL

REM generate RTL code for small PROMS
%romgen_path%\romgen %rom_path_src%\pr1635.51     PROM1_DST  9 c     > %rom_path%\prom1_dst.vhd
%romgen_path%\romgen %rom_path_src%\pr1634.88     PROM4_DST 10 c     > %rom_path%\prom4_dst.vhd
%romgen_path%\romgen %rom_path_src%\pr1633.78     PROM7_DST  5 c     > %rom_path%\prom7_dst.vhd

REM generate RAMB structures for larger ROMS
%romgen_path%\romgen %rom_path%\gfx1.bin          GFX1      14 l r e > %rom_path%\gfx1.vhd
%romgen_path%\romgen %rom_path%\main1.bin         ROM_PGM_0 14 l r e > %rom_path%\rom0.vhd
%romgen_path%\romgen %rom_path%\main2.bin         ROM_PGM_1 14 l r e > %rom_path%\rom1.vhd

echo done
pause
