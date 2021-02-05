set_property SRC_FILE_INFO {cfile:f:/repos/a35/NUEVO/mpatrol/A35/A35.srcs/sources_1/ip/relojes/relojes.xdc rfile:../../../A35.srcs/sources_1/ip/relojes/relojes.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports inclk0]] 0.2
