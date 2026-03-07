# operating conditions and boundary conditions #

set cycle  0.8        ;#clock period defined by designer

create_clock -period $cycle [get_ports  clk]
set_dont_touch_network      [get_clocks clk]
set_clock_uncertainty  0.1  [get_clocks clk]
set_clock_latency      0.5  [get_clocks clk]

set_input_delay  0      -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 0.5    -clock clk [all_outputs] 
set_load         0.2     [all_outputs]
set_drive        0.1     [all_inputs]


set_operating_conditions -library N16ADFP_StdCellss0p72vm40c_ccs
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs                 
                       

set_max_fanout 20 [all_inputs]
