#Read All Files
read_file -format verilog  CLE.v
#read_file -format sverilog  CLE.v
current_design CLE
link

#Setting Clock Constraints
source -echo -verbose CLE.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile_ultra

write -format ddc     -hierarchy -output "CLE_syn.ddc"
write_sdf -version 1.0  CLE_syn.sdf
write -format verilog -hierarchy -output CLE_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  CLE_syn.qor
