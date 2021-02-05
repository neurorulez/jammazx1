create_clock -name clk1_50 -period 20 [get_ports {max10_clk1_50}]

create_generated_clock -name clock_6 -source [get_nets {clocks|altpll_component|auto_generated|wire_pll1_clk[0]}] -divide_by 2 [get_nets {defender|clock_6}]
create_generated_clock -name cpu_clock -source [get_nets {defender|clock_6}] -divide_by 2 [get_nets {defender|cpu_clock}]
create_generated_clock -name clock_div0 -source [get_nets {clocks|altpll_component|auto_generated|wire_pll1_clk[1]}] -divide_by 2 [get_nets {defender|defender_sound_board|clock_div[0]}]
create_generated_clock -name clock_div1 -source [get_nets {clocks|altpll_component|auto_generated|wire_pll1_clk[1]}] -divide_by 4 [get_nets {defender|defender_sound_board|clock_div[1]}]

derive_pll_clocks -create_base_clocks

derive_clock_uncertainty

set_clock_groups -asynchronous \
-group { \
clocks|altpll_component|auto_generated|pll1|clk[0] \
clock_6 \
cpu_clock \
} \
-group { \
clocks|altpll_component|auto_generated|pll1|clk[1] } \
clock_div0 \
clock_div1 \
-group { \
clk1_50 \
}