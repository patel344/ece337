# Step 1:  Read in the source file
analyze -format sverilog -lib WORK { adder_1bit.sv}
elaborate adder_1bit -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/adder_1bit.rep
report_area >> reports/adder_1bit.rep
report_power -hier >> reports/adder_1bit.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/adder_1bit.v"

# Second Compilation Run. Repeat Steps 2-5
# Step 2: Put the max delay constrains in the second pass only.
set_max_delay 6.4 -from "b" -to "sum" 

# Step 3: Compile the design
set_structure true -design adder_1bit -boolean true -boolean_effort medium
compile -map_effort high -boundary_optimization

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/adder_1bit_1.rep
report_area >> reports/adder_1bit_1.rep
report_power -hier >> reports/adder_1bit_1.rep

# Step 5: Output final Verilog and Verilog files
write_file -format verilog -hierarchy -output "mapped/adder_1bit_1.v"

echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
