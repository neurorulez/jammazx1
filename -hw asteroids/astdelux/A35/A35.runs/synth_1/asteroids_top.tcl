# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tftg256-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/repos/a35/NUEVO/astdelux/A35/A35.cache/wt [current_project]
set_property parent.project_path F:/repos/a35/NUEVO/astdelux/A35/A35.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths f:/repos/a35/NUEVO/astdelux/ip_repo [current_project]
update_ip_catalog
set_property ip_output_repo f:/repos/a35/NUEVO/astdelux/A35/A35.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  F:/repos/a35/NUEVO/astdelux/src/multiboot_artix7.v
  F:/repos/a35/NUEVO/astdelux/src/modulo_top_a35t.v
}
read_vhdl -library xil_defaultlib {
  F:/repos/a35/NUEVO/astdelux/src/rtl_mio/keyb/keyboard.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_mio/keyb/ps2_intf.vhd
  F:/repos/a35/NUEVO/astdelux/src/roms/ASTEROIDS_PROG_ROM_1.VHD
  F:/repos/a35/NUEVO/astdelux/src/roms/ASTEROIDS_PROG_ROM_2.VHD
  F:/repos/a35/NUEVO/astdelux/src/roms/ASTEROIDS_PROG_ROM_0.VHD
  F:/repos/a35/NUEVO/astdelux/src/rtl/asteroids_main.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl/asteroids_ram.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl/asteroids_vg.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl/asteroids_dw.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl/asteroids.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_mio/dac.vhd
  F:/repos/a35/NUEVO/astdelux/src/roms/ASTEROIDS_VEC_ROM_1.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_T65/T65.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_T65/T65_ALU.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_T65/T65_MCode.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_T65/T65_Pack.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_mio/ram_1k.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl_mio/debounce.vhd
  F:/repos/a35/NUEVO/astdelux/src/roms/ASTEROIDS_VEC_ROM_2.vhd
  F:/repos/a35/NUEVO/astdelux/src/roms/ASTEROIDS_PROG_ROM_3.vhd
  F:/repos/a35/NUEVO/astdelux/src/rtl/asteroids_pokey.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/repos/a35/NUEVO/astdelux/pines_zxuno_a35t.xdc
set_property used_in_implementation false [get_files F:/repos/a35/NUEVO/astdelux/pines_zxuno_a35t.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top asteroids_top -part xc7a35tftg256-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef asteroids_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file asteroids_top_utilization_synth.rpt -pb asteroids_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
