# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {scl_edge.sv sda_sel.sv decode.sv tx_fifo.sv tx_sr.sv rx_sr.sv controller.sv timer.sv flex_counter.sv flex_stp_sr.sv flex_pts_sr.sv i2c_slave.sv}
elaborate i2c_slave -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/i2c_slave.rep
report_area >> reports/i2c_slave.rep
report_power -hier >> reports/i2c_slave.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/i2c_slave.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
