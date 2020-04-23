---------------------------------------------------------------------------------
-- DE10_lite Top level for computer_space by Dar (darfpga@aol.fr) (29/10/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--
-- Main features :
--  PS2 keyboard input @gpio pins 35/34 (beware voltage translation/protection) 
--  Audio pwm output   @gpio pins 1/3 (beware voltage translation/protection) 
--
-- Uses 1 pll for 5.84MHz generation from 50MHz and 50MHz
--
-- Board key :
--   0 : reset game
--
-- Keyboard players inputs :
--
--   F1 : -
--   F2 : Start
--   F3 : -
--
--   SPACE       : fire  
--   RIGHT arrow : rotate right
--   LEFT  arrow : rotate left
--   UP    arrow : thrust
--   DOWN  arrow : - 
--
-- Other details : see computer_space_top.vhdl
-- For USB inputs and SGT5000 audio output see my other project: xevious_de10_lite
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
-- v1.1 by DarFPGA - 22/11/2017
--
--  Found changes between original web release (v1.0) and MiST/MiSTer release. 
--  Modification are around syncs signal and seems not to change game
--  behaviour. Start working from MiST/MiSTer release.
--
--
--  * Add simulation of sound to replace sample sound with the goal to
--    reduce used memory. (v1.0 sound sample remains included and can be 
--    reactivated at compilation)
--
--  Turn and both missiles sounds are produced exactly in the same way as in
--  the original design (based on schematics analysis) : gated frequency from
--  saucer and missile counters on motion board. So, unlike sound sample 
--  these sounds depend on objects motion and thus should sound more like 
--  the original design.
--   
--  Ambiance, thurst and explosion sounds simulation is based on the shape
--  and spectrum of samples found in 8_11.hex sample files. From schematics
--  one gets that these sounds come from a single noise generator. For vhdl
--  simulation I also creates these sounds from a single noise source and 
--  then apply filtering to adapt spectrum response for each voice.
--
--  * Add different signal levels for video. Now output separate bits for
--    stars/objects/scores/video_inversion. Final video level has to be
--    adapted at upper level depending on final hardware.
--
--  * Fixed what appears to me as a v1.0 bug : rocket always moving on the left.
--    It was impossible to move on the right and even impossible to stop 
--    rocket moving. 
--
--  Original video found on the internet seems to confirm that rocket may
--  not move. I modify scan_counter.vhdl to respect motion board schematics.
--  Amazingly v1.0 motion board explanations were very accurate and correct but
--  scan counter implementation was wrong (last line was 255 pixels but should be
--  254).
--
--  * Another things (not fixed). Very often rocket missile start a few pixels 
--    appart rocket center. This sounds to be wrong from motion board explanations
--    but I cannot find schematics mis-implementation. So I don't try to 'fix'
--    that as it may correspond to real hardware.
--    
--------------------------------------------------------------------------------
+----------------------------------------------------------------------------------+
; Fitter Summary                                                                   ;
+------------------------------------+---------------------------------------------+
; Fitter Status                      ; Successful - Wed Nov 22 16:29:18 2017       ;
; Quartus Prime Version              ; 16.1.0 Build 196 10/24/2016 SJ Lite Edition ;
; Revision Name                      ; computer_space_de10_lite                    ;
; Top-level Entity Name              ; computer_space_de10_lite                    ;
; Family                             ; MAX 10                                      ;
; Device                             ; 10M50DAF484C6GES                            ;
; Timing Models                      ; Preliminary                                 ;
; Total logic elements               ; 2,471 / 49,760 ( 5 % )                      ;
;     Total combinational functions  ; 2,351 / 49,760 ( 5 % )                      ;
;     Dedicated logic registers      ; 955 / 49,760 ( 2 % )                        ;
; Total registers                    ; 955                                         ;
; Total pins                         ; 105 / 360 ( 29 % )                          ;
; Total virtual pins                 ; 0                                           ;
; Total memory bits                  ; 0 / 1,677,312 ( 0 % )                       ;
; Embedded Multiplier 9-bit elements ; 4 / 288 ( 1 % )                             ;
; Total PLLs                         ; 1 / 4 ( 25 % )                              ;
; UFM blocks                         ; 0 / 1 ( 0 % )                               ;
; ADC blocks                         ; 0 / 2 ( 0 % )                               ;
+------------------------------------+---------------------------------------------+
--------------------------------------------------------------------------------
