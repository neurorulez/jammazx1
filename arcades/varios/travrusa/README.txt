---------------------------------------------------------------------------------
-- DE10_lite Top level for Traverse USA by Dar (darfpga@aol.fr) (16/03/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Use traverse_usa_de10_lite.sdc to compile (Timequest constraints)
-- /!\
-- Don't forget to set device configuration mode with memory initialization 
--  (Assignments/Device/Pin options/Configuration mode)
---------------------------------------------------------------------------------
--
-- Main features :
--  PS2 keyboard input @gpio pins 35/34 (beware voltage translation/protection) 
--  Audio pwm output   @gpio pins 1/3 (beware voltage translation/protection) 
--
--  Video         : 15Khz only atm
--  Cocktail mode : OK
--  Sound         : OK
-- 
-- For hardware schematic see my other project : NES.
--
-- Uses 1 pll for 36MHz and 3.58MHz generation from 50MHz
--
--
-- Board key :
--   0 : reset game
--
-- Keyboard players inputs :
--
--   F3 : Add coin
--   F2 : Start 2 players
--   F1 : Start 1 player
--   SPACE       : Fire  
--   RIGHT arrow : turn right
--   LEFT  arrow : turn left
--   UP    arrow : speed up 
--   DOWN  arrow : speed down
--
-- Other details : see traverse_usa.vhd
-- For USB inputs and SGT5000 audio output see my other project: xevious_de10_lite
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
-- Traverse USA by Dar (darfpga@aol.fr) (16/03/2019)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- T80/T80se - Version : 0247
-----------------------------
-- Z80 compatible microprocessor core
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
---------------------------------------------------------------------------------
-- cpu68 - Version 9th Jan 2004 0.8
-- 6800/01 compatible CPU core 
-- GNU public license - December 2002 : John E. Kent
---------------------------------------------------------------------------------
-- YM2149 (AY-3-8910)
-- Copyright (c) MikeJ - Jan 2005
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------

--  Features :
--   Video        : TV 15KHz mode only (atm)
--   Coctail mode : OK
--   Sound        : OK

--  Use with MAME roms from travusa.zip
--
--  Use make_travusa_proms.bat to build vhd file from binaries
--  (CRC list included)

--  Traverse USA (irem M52) Hardware caracteristics :
--
--  VIDEO : 1xZ80@3MHz CPU accessing its program rom, working ram,
--    sprite data ram, I/O, sound board register and trigger.
--		  32Kx8bits program rom
--
--    One char tile map 64x32 with H scrolling (32x32 visible)
--      8Kx24bits graphics rom 3bits/pixel
--      8colors per tile / 16 color sets
--      rbg palette 128 colors 8bits : 2red 3green 3blue
--
--    72 sprites / line, 16x16 with flip H/V
--    (schematics seems too allow only 24 sprites / line with bank switch
--     at mid screen. This doesn't allow showing all needed sprite)
--
--      8Kx24bits graphics rom 3bits/pixel
--      8colors per sprite / 32 color sets among 16 colors;
--      rbg palette 16 colors 8bits : 2red 3green 3blue
--
--    Working ram : 4Kx8bits
--    Sprites data ram : 256x8bits
--    Sprites line buffer rams : 1 scan line delay flip/flop 2x256x4bits
--
--  SOUND : 1x6803@3.58MHz CPU accessing its program rom, working ram, 2x-AY3-8910, 1xMSM5205
--		  4Kx8bits program rom
--      128x8bits working ram
--
--      1xAY-3-8910
--		I/O to MSM5205 and command/trigger from video board.
--		3 sound channels
--
--      1xAY-3-8910
--		3 sound channels
--
---------------------------------------------------------------------------------
--  Schematics remarks :
--
--	Frame is 384 x 282 (H x V) which is too much lines for standard TV set (262.5 lines)
--	This create a display artefact near end of frame since already entering composite 
--	sync egalisation pulses. Line number cannot be reduced since CPU need enough fly back
--	time to update every sprites position. (Reducing line count will result in missing sprites)
--	May be this can be achieved by increasing CPU clock speed (web site and MAME report 4Mhz)
-- 	My  M52-A schematic clearly shows 18.432/6.
--
--	=> I give more CPU time to access sprite ram data by allowing CPU access as soon as video
--	scanner V is outside the sprite zone i.e. outside the scroling part of screen (which
--	depends on the flip screen state).
--		
--	Moreover M52-B schematic doesn't show to allow seeking more than 24 sprites data per
--	line from :
--		- C820 to C87F for half upper screen (vertical)
--		- C8A0 to C8FF for half lower screen (vertical)
--
--	But, at beginning of the game, during starting count downto, 5 cars are diplayed +
--	moto + count down numbers. At least some sprite cars data comes not only from 
--	C820-C87F but also from C920 to C97F. Which involves at least 2 sprite data regions 
--	for the same half part of the screen (see cars numbered 0 and 3).
--
--	=> I modify the sprite data address scanner to allow 3 regions to be scanned at each line
--	(C820-C87F, C8A0-C8FF and C920-C97F). My first design was with a 12MHz master clock to
--	allow 1 read and 1 write access to sprite line buffer ram at each pixel (6Mhz). This
--	permit only one sprite data region to be scanned at each line. The master clock was 
--	increased from 12Mhz to	36Mhz and desing modified to allow 3 sprite data regions to be
--	scanned at each line.
--
---------------------------------------------------------------------------------

+----------------------------------------------------------------------------------+
; Fitter Summary                                                                   ;
+------------------------------------+---------------------------------------------+
; Fitter Status                      ; Successful - Sat Mar 16 11:45:10 2019       ;
; Quartus Prime Version              ; 18.1.0 Build 625 09/12/2018 SJ Lite Edition ;
; Revision Name                      ; traverse_usa_de10_lite                      ;
; Top-level Entity Name              ; traverse_usa_de10_lite                      ;
; Family                             ; MAX 10                                      ;
; Device                             ; 10M50DAF484C6GES                            ;
; Timing Models                      ; Preliminary                                 ;
; Total logic elements               ; 5,181 / 49,760 ( 10 % )                     ;
;     Total combinational functions  ; 4,944 / 49,760 ( 10 % )                     ;
;     Dedicated logic registers      ; 1,390 / 49,760 ( 3 % )                      ;
; Total registers                    ; 1390                                        ;
; Total pins                         ; 105 / 360 ( 29 % )                          ;
; Total virtual pins                 ; 0                                           ;
; Total memory bits                  ; 766,976 / 1,677,312 ( 46 % )                ;
; Embedded Multiplier 9-bit elements ; 0 / 288 ( 0 % )                             ;
; Total PLLs                         ; 1 / 4 ( 25 % )                              ;
; UFM blocks                         ; 0 / 1 ( 0 % )                               ;
; ADC blocks                         ; 0 / 2 ( 0 % )                               ;
+------------------------------------+---------------------------------------------+

---------------
VHDL File list 
---------------

max10_pll_36p86M_3p58M.vhd         Pll 36.86MHz and 3.58MHz from 50MHz altera mf

rtl_dar/traverse_usa_de10_lite.vhd  Top level for de10_lite board
rtl_dar/traverse_usa.vhd            Main video board logic
rtl_dar/moon_patrol_sound_board.vhd Main sound board logic

rtl_mikej/YM2149_linmix.vhd        Copyright (c) MikeJ - Jan 2005
rtl6_jkent/cpu68.vhd               GNU public license - December 2002 : John E. Kent

rtl_T80/T80se.vhdT80               Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
rtl_T80/T80_Reg.vhd
rtl_T80/T80_Pack.vhd
rtl_T80/T80_MCode.vhd
rtl_T80/T80_ALU.vhd
rtl_T80/T80.vhd

rtl_dar/kbd_joystick.vhd           Keyboard key to player/coin input
rtl_dar/io_ps2_keyboard.vhd        Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
rtl_dar/gen_ram.vhd                Generic RAM (Peter Wendrich + DAR Modification)
rtl_dar/decodeur_7_seg.vhd         7 segments display decoder

rtl_dar/proms/travusa_cpu.vhd          PROMS
rtl_dar/proms/travusa_sound.vhd
rtl_dar/proms/travusa_spr_rgb_lut.vhd
rtl_dar/proms/travusa_spr_palette.vhd
rtl_dar/proms/travusa_chr_palette.vhd
rtl_dar/proms/travusa_spr_bit3.vhd
rtl_dar/proms/travusa_spr_bit2.vhd
rtl_dar/proms/travusa_spr_bit1.vhd
rtl_dar/proms/travusa_chr_bit3.vhd
rtl_dar/proms/travusa_chr_bit2.vhd
rtl_dar/proms/travusa_chr_bit1.vhd

----------------------
Quartus project files
----------------------
de10_lite/traverse_usa_de10_lite.sdc   Timequest constraints file
de10_lite/traverse_usa_de10_lite.qsf   de10_lite settings (files,pins...) 
de10_lite/traverse_usa_de10_lite.qpf   de10_lite project

-----------------------------
Required ROMs (Not included)
-----------------------------
You need the following 14 ROMs binary files from travusa.zip (MAME)

zr1-0.m3     CRC(be066c0a) 
zr1-5.l3     CRC(145d6b34) 
zr1-6a.k3    CRC(e1b51383) 
zr1-7.j3     CRC(85cd1a51)
mr10.1a      CRC(a02ad8a0)
zippyrac.001 CRC(aa8994dd)
mr8.3c       CRC(3a046dd1)
mr9.3a       CRC(1cc3d3f4)
zr1-8.n3     CRC(3e2c7a6b)
zr1-9.l3     CRC(13be6a14)
zr1-10.k3    CRC(6fcc9fdb)
mmi6349.ij   CRC(c9724350)
tbp18s.2     CRC(a1130007)
tbp24s10.3   CRC(76062638)

------
Tools 
------
You need to build vhdl files from the binary file :
 - Unzip the roms file in the tools/travusa_unzip directory
 - Double click (execute) the script tools/make_travusa_proms.bat to get the following files

travusa_cpu.vhd
travusa_sound.vhd
travusa_spr_rgb_lut.vhd
travusa_spr_palette.vhd
travusa_chr_palette.vhd
travusa_spr_bit3.vhd
travusa_spr_bit2.vhd
travusa_spr_bit1.vhd
travusa_chr_bit3.vhd
travusa_chr_bit2.vhd
travusa_chr_bit1.vhd

*DO NOT REDISTRIBUTE THESE FILES*

VHDL files are needed to compile and include roms into the project 

The script make_travusa_proms.bat uses make_vhdl_prom executables delivered both in linux and windows version. The script itself is delivered only in windows version (.bat) but should be easily ported to linux.

Source code of make_vhdl_prom.c is also delivered.

---------------------------------
Compiling for de10_lite
---------------------------------
You can build the project with ROM image embeded in the sof file.
*DO NOT REDISTRIBUTE THESE FILES*

3 steps

 - put the VHDL ROM files (.vhd) into the rtl_dar/proms directory
 - build travusa_de10_lite
 - program travusa_de10_lite.sof

------------------------
------------------------
End of file
------------------------
