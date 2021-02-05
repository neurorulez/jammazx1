@echo off
rem
rem Donkey Kong ROM builder
rem
rem SHA1 checksums of the ROMs required:
rem f9c872da2fe8e800574ae3bf483fb3ccacc92eb3  c-2j.bpr
rem b50ec9e1837c00c20fb2a4369ec7dd0358321127  c-2k.bpr
rem 3fe3599f6fa7c496f782053ddf7bacb453d197c4  c_5at_g.bin
rem c7966261f3a1d3296927e0b6ee1c58039fc53c1f  c_5bt_g.bin
rem acb11a8fbdbb3ab46068385fe465f681e3c824bd  c_5ct_g.bin
rem d76ebecfea1af098d843ee7e578e480cd658ac1a  c_5et_g.bin
rem 793dba9bf5a5fe76328acdfb90815c243d2a65f1  l_4m_b.bin
rem 92e5d379f4838ac1fa44d448ce7d142dae42102f  l_4n_b.bin
rem ecf95db5a20098804fc8bd59232c66e2e0ed3db4  l_4r_b.bin
rem 3bc482a38bf579033f50082748ee95205b0f673d  l_4s_b.bin
rem 144d24464c1f9f01894eb12f846952290e6e32ef  s_3i_b.bin
rem 6c82b57637c0212a580591397e6a5a1718f19fd2  s_3j_b.bin
rem c2bdccbf2654b64ea55cd589fd21323a9178a660  v-5e.bpr
rem 976eb1e18c74018193a35aa86cff482ebfc5cc4e  v_3pt.bin
rem a57ff5a231c45252a63b354137c920a1379b70a3  v_5h_b.bin

SET ROMS=..\roms\dkong
echo ---------- build PROM data ---------- 
copy /b %ROMS%\c_5et_g.bin + %ROMS%\c_5ct_g.bin + %ROMS%\c_5bt_g.bin + %ROMS%\c_5at_g.bin + %ROMS%\c_5at_g.bin + %ROMS%\c_5at_g.bin + %ROMS%\v_3pt.bin + %ROMS%\v_3pt.bin + %ROMS%\v_5h_b.bin + %ROMS%\v_5h_b.bin + %ROMS%\c_5at_g.bin + %ROMS%\c_5at_g.bin + %ROMS%\l_4m_b.bin + %ROMS%\l_4m_b.bin + %ROMS%\l_4n_b.bin + %ROMS%\l_4n_b.bin + %ROMS%\l_4r_b.bin + %ROMS%\l_4r_b.bin + %ROMS%\l_4s_b.bin + %ROMS%\l_4s_b.bin + %ROMS%\s_3i_b.bin + %ROMS%\s_3j_b.bin + %ROMS%\c-2k.bpr + %ROMS%\c-2j.bpr + %ROMS%\v-5e.bpr + 0xd00.bin + dk_wave.bin ..\build\dkong_rom.bin

rem ROM.vhd only used for simulation
genrom.py ..\build\dkong_rom.bin ..\build\ROM.vhd
