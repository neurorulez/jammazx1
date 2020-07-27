# file: simcmds.tcl

# create the simulation script
vcd dumpfile isim.vcd
vcd dumpvars -m /pll50_to_33_and_18_tb -l 0
wave add /
run 50000ns
quit

