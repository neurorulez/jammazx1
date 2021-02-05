---------------------------------------------------------------------------------
-- Defender by Dar (darfpga@aol.fr) (10 October 2017)
-- http://darfpga.blogspot.fr
--
--  Terasic board MAX10 DE10 Lite
---------------------------------------------------------------------------------
-- gen_ram.vhd & io_ps2_keyboard
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- cpu09l - Version : 0128
-- Synthesizable 6809 instruction compatible VHDL CPU core
-- Copyright (C) 2003 - 2010 John Kent
---------------------------------------------------------------------------------
-- cpu68 - Version 9th Jan 2004 0.8
-- 6800/01 compatible CPU core 
-- GNU public license - December 2002 : John E. Kent
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
--  MAX10 DE10 Lite Top version 0.0 : (18/10/2017)
--
--  Keyboard PS/2 available at gpio pins 
--  Beware voltage translation for PS2 keyboard connection : do it at your own risk
--  Don't do this by yourself if you have no electronic skill, you may damage the board
--
--  Sound PWM output available at gpio pins     
--
--  USB keyboard or joystick available (with arduino shield)
--  See more explanation in file defender_de10_lite.vhd
--
--  No external SRAM required, Use internal RAM
--
---------------------------------------------------------------------------------
--
--  Video 15KHz is OK, 
--
--  This is not VGA, you have to use a TV set with SCART plug
--
--    SCART(TV) pin  - signal -  VGA(DE10) pin
--               15  -  red   -  1          
--               11  - green  -  2
--                7  -  blue  -  3  
--           5,9,13  -  gnd   -  5,6,7
--   (comp. sync)20  - csync  -  13 (HS)   
--  (fast commut)16  - commut -  14 (VS)
--            17,18  -  gnd   -  8,10 
--
---------------------------------------------------------------------------------
--
-- Defender VHDL VERSION
--
-- Version 0.0 -- 15/10/2017 -- 
--	initial version 
---------------------------------------------------------------------------------
--  Features :
--   TV 15KHz mode only (atm)
--   Cocktail mode : ok 
--   Sound : ok
--
--  Use with MAME roms from defender.zip
--
--  Use 'make_defender_proms.bat' to build vhd file and bin from binaries
--      (see below)
--
--  Defender Hardware caracteristics :
--
--    1x6809 CPU accessing program rom and shared ram/devices
--      3x16Ko video and working ram
--      26Ko program roms
--      1 pia for player I/O
--      1 pia service switches, irq and sound selection to sound board
--
--    384 pixels x 260 line video scan, 16 colors per pixel
--    Ram palette 16 colors among 256 colors (3 red bits,3 green bits, 2 blue bits)
--
--    2 decoder proms for video scan and cocktail/upright flip
--
--    No sprites, no char tiles 
--
--    128x4 cmos ram (see defender_cmos_ram.vhd for initial values)
--    Not save when power off (see also defender_cmos_ram.vhd)
--
--    1x6808/02
--      128x8 working ram
--      4k program rom 
--      1 pia for sound selection cmd input and audio samples output
--
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--
-- Main features :
--  PS2 keyboard input @gpio pins 35/34 (beware voltage translation/protection) 
--  Audio pwm output   @gpio pins 1/3 (beware voltage translation/protection) 
--
-- Uses 1 pll for 12MHz and 3.58MHz generation from 50MHz
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
--   RIGHT arrow : Thrust
--   LEFT  arrow : Reverse ship direction
--   UP    arrow : Move up 
--   DOWN  arrow : Move down
--   CTRL        : Smart bomb
--   W(Z)        : Hyperspace
--
-- Keyboard Service inputs French(english) :
--
--   A(Q) : advance
--   U(U) : auto/up (!manual/down)
--   H(H) : high score reset
--
--   To enter service mode press 'advance' key while in game over screen
--   Enter service mode to tune game parameters (difficulty ...)
--   Tuning are lost at power OFF, for permanent tuning edit/set parameters
--     within defender_cmos_ram.vhd and recompile.
--
-- Other details : see defender.vhd
---------------------------------------------------------------------------------
-- Use defender_de10_lite.sdc to compile (Timequest constraints)
---------------------------------------------------------------------------------

+----------------------------------------------------------------------------------+
; Fitter Summary                                                                   ;
+------------------------------------+---------------------------------------------+
; Fitter Status                      ; Successful - Wed Oct 18 17:53:47 2017       ;
; Quartus Prime Version              ; 16.1.0 Build 196 10/24/2016 SJ Lite Edition ;
; Revision Name                      ; defender_de10_lite                          ;
; Top-level Entity Name              ; defender_de10_lite                          ;
; Family                             ; MAX 10                                      ;
; Device                             ; 10M50DAF484C6GES                            ;
; Timing Models                      ; Preliminary                                 ;
; Total logic elements               ; 3,444 / 49,760 ( 7 % )                      ;
;     Total combinational functions  ; 3,379 / 49,760 ( 7 % )                      ;
;     Dedicated logic registers      ; 772 / 49,760 ( 2 % )                        ;
; Total registers                    ; 772                                         ;
; Total pins                         ; 85 / 360 ( 24 % )                           ;
; Total virtual pins                 ; 0                                           ;
; Total memory bits                  ; 632,960 / 1,677,312 ( 38 % )                ;
; Embedded Multiplier 9-bit elements ; 0 / 288 ( 0 % )                             ;
; Total PLLs                         ; 1 / 4 ( 25 % )                              ;
; UFM blocks                         ; 0 / 1 ( 0 % )                               ;
; ADC blocks                         ; 0 / 2 ( 0 % )                               ;
+------------------------------------+---------------------------------------------+

---------------
Timequest file
---------------
defender_de10_lite.sdc

---------------
VHDL files list 
---------------

rtl_dar/defender_de10_lite.vhd     Top level for de10 lite
rtl_dar/defender.vhd               Main logic (inc. cpu board, prom and i/o board)
rtl_dar/defender_sound_board.vhd   Sound board logic

rtl_jkent/cpu09l_128.vhd           cpu 6809 Copyright (C) 2003 - 2010 John Kent
rtl_jkent/cpu68.vhd                cpu 6800 GNU public license - December 2002 : John E. Kent
rtl_pace/pia6821.vhd               pia 6821 GNU public license - May 2004 : John E. Kent 


rtl_dar/defender_prog.vhd          ROM : 6809 main program (inc. switched bank)
rtl_dar/defender_decoder_2.vhd     ROM : Cpu address decoder for pixel map & working ram
rtl_dar/defender_decoder_3.vhd     ROM : Video scan address decoder for pixel map ram 
rtl_dar/defender_sound.vhd         ROM : 6800 sound program PROMs

rtl_dar/defender_cmos_ram.vhd      Generic RAM (Peter Wendrich + DAR Modification)

rtl_dar/io_ps2_keyboard.vhd        Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
rtl_dar/kbd_joystick.vhd           Keyboard key to player/coin input

rtl_dar/decodeur_7_seg.vhd         7 segments decoder (for debug cpu adr display)
rtl_dar/gen_ram.vhd                Generic RAM (Peter Wendrich + DAR Modification) 
de10_lite/max10_pll_12M_3p58M.vhd  PLL 12MHz and 3.58MHz from 50MHz alt. mf (Max10)

----------------------
Quartus project files
----------------------
de10_lite/defender_de10_lite.qsf         de10_lite settings (files,pins...) 
de10_lite/defender_de10_lite.qpf         de10_lite project
de10_lite/defender_de10_lite.sdc         Timequest timing constraints

-----------------------------
Required ROMs (Not included)
-----------------------------
You need the following 14 ROMs binary files from defender.zip 
(MAME defender)

defend.1, defend.2, defend.3, defend.4, defend.6, defend.7 
defend.8, defend.9, defend.10, defend.11, defend.12

decoder.2, decoder.3
defend.snd

------
Tools 
------
You need to build vhdl files from the binary file :
 - Unzip the roms file in the tools/defender_unzip directory  (or win32 or linux)
 - Double click (execute) the script tools/defender_unzip/make_defender_proms.bat to get the following files

The following 14 files will be converted to vhld (rom) files.

defend.1 + defend.4 + 
defend.2 + defend.3 +
defend.9 + defend.12 +
defend.8 + defend.11 +
defend.7 + defend.10 +
defend.6   => defender_prog.vhd

decoder.2  => defender_decoder_2.vhd
decoder.3  => defender_decoder_3.vhd
defend.snd => defender_sound.vhd


*DO NOT REDISTRIBUTE ANY OF THESE FILES*

VHDL files are needed to compile and include roms into the project 

The script make_defender_proms.bat uses make_vhdl_prom executable delivered both in linux and windows version. The script itself is delivered only in windows version (.bat) but should be easily ported to linux.

Source code of make_vhdl_prom.c and duplicate_byte.c is also delivered.

---------------------------------
Compiling for de2
---------------------------------
You can build the project with ROM image embeded in the sof file. DO NOT REDISTRIBUTE THESE FILES.
3 steps

 - put the VHDL ROM files (.vhd) into the project directory
 - build defender_de10_lite
 - then program defender_de10_lite.sof

------------------------
End of file
------------------------
