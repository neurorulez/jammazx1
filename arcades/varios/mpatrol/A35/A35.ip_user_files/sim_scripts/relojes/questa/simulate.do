onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib relojes_opt

do {wave.do}

view wave
view structure
view signals

do {relojes.udo}

run -all

quit -force
