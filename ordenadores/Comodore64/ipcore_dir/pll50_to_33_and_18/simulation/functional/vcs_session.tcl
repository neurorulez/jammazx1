gui_open_window Wave
gui_sg_create pll50_to_33_and_18_group
gui_list_add_group -id Wave.1 {pll50_to_33_and_18_group}
gui_sg_addsignal -group pll50_to_33_and_18_group {pll50_to_33_and_18_tb.test_phase}
gui_set_radix -radix {ascii} -signals {pll50_to_33_and_18_tb.test_phase}
gui_sg_addsignal -group pll50_to_33_and_18_group {{Input_clocks}} -divider
gui_sg_addsignal -group pll50_to_33_and_18_group {pll50_to_33_and_18_tb.CLK_IN1}
gui_sg_addsignal -group pll50_to_33_and_18_group {{Output_clocks}} -divider
gui_sg_addsignal -group pll50_to_33_and_18_group {pll50_to_33_and_18_tb.dut.clk}
gui_list_expand -id Wave.1 pll50_to_33_and_18_tb.dut.clk
gui_sg_addsignal -group pll50_to_33_and_18_group {{Counters}} -divider
gui_sg_addsignal -group pll50_to_33_and_18_group {pll50_to_33_and_18_tb.COUNT}
gui_sg_addsignal -group pll50_to_33_and_18_group {pll50_to_33_and_18_tb.dut.counter}
gui_list_expand -id Wave.1 pll50_to_33_and_18_tb.dut.counter
gui_zoom -window Wave.1 -full
