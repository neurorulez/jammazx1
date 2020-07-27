onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib DualPortRAM_Block_opt

do {wave.do}

view wave
view structure
view signals

do {DualPortRAM_Block.udo}

run -all

quit -force
