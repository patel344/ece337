# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {flex_counter.sv rcu.sv rx_data_buff.sv sr_9bit.sv start_bit_det.sv stop_bit_chk.sv flex_stp_sr.sv timer.sv rcv_block.sv}
elaborate rcv_block -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/rcv_block.rep
report_area >> reports/rcv_block.rep
report_power -hier >> reports/rcv_block.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/rcv_block.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
