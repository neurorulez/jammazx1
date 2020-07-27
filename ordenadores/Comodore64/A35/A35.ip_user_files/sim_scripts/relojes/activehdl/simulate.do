onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+relojes -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.relojes xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {relojes.udo}

run -all

endsim

quit -force
