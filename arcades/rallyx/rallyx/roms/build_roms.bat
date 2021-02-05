@echo off
copy bangpcm.rom bin\bangpcm.rom
copy mame\8e bin\chrrom.rom
copy mame\im5623.8m bin\dotrom.rom
copy mame\im5623.3p bin\wrom.rom
copy mame\im5623.8p bin\colorlt.rom
copy mame\m3-7603.11n bin\palette.rom

copy /B mame\1b + mame\rallyxn.1e + mame\rallyxn.1h + mame\rallyxn.1k bin\cpurom.rom

romgen bin\cpurom.rom   cpurom  14 l r  > vhd\cpurom.vhd
romgen bin\bangpcm.rom  bangpcm 14 l r  > vhd\bangpcm.vhd
romgen bin\chrrom.rom   chrrom  12 l r  > vhd\chrrom.vhd
romgen bin\dotrom.rom   dotrom   8 l r  > vhd\dotrom.vhd
romgen bin\wrom.rom       wrom   8 l r  > vhd\wrom.vhd
romgen bin\colorlt.rom colorlt   8 l r  > vhd\colorlt.vhd
romgen bin\palette.rom palette   5 l r  > vhd\palette.vhd

REM (0x0000)"prg1_0","prg2_0","prg1_1","prg2_1","prg3_0","prg4_0","prg3_1","prg4_1",[cpurom]
REM (0x4000)"../bang_snd.bin",=[bangpcm]
REM (0x8000)"nrx_chg1.8e",(0x8800)"nrx_chg2.8d",=[chrrom]
REM (0x9000)"rx1-6.8m",[dotrom]
REM (0x9100)"rx1-5.3p"=[wrom],
REM (0x9200)"nrx1-7.8p"=[colorlt]
REM (0x9300)"nrx1-1.11n"=[palette](0x9320)

echo done
pause 0