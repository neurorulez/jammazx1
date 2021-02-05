@echo off
copy bangpcm.rom bin\bangpcm.rom
copy /B mame\nrx_chg1.8e + mame\nrx_chg2.8d bin\chrrom.rom
copy mame\rx1-6.8m bin\dotrom.rom
copy mame\rx1-5.3p bin\wrom.rom
copy mame\nrx1-7.8p bin\colorlt.rom
copy mame\nrx1-1.11n bin\palette.rom
fcut mame\nrx_prg1.1d 0 800   prg1_0
fcut mame\nrx_prg1.1d 800 800 prg1_1
fcut mame\nrx_prg2.1e 0 800   prg2_0
fcut mame\nrx_prg2.1e 800 800 prg2_1
fcut mame\nrx_prg3.1k 0 800   prg3_0
fcut mame\nrx_prg3.1k 800 800 prg3_1
fcut mame\nrx_prg4.1l 0 800   prg4_0
fcut mame\nrx_prg4.1l 800 800 prg4_1

copy /B prg1_0 + prg2_0 + prg1_1 + prg2_1 + prg3_0 + prg4_0 + prg3_1 + prg4_1 bin\cpurom.rom
del prg?_?

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