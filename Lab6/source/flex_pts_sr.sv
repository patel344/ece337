// $Id: $
// File name:   flex_pts_sr.sv
// Created:     1/25/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: N-bit Parallel-to-Serial Shift Register Design.

module flex_pts_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire load_enable,
	input wire [NUM_BITS-1:0] parallel_in,
	output reg serial_out 
);

reg [NUM_BITS-1:0] next_parallel_in;
reg [NUM_BITS-1:0] curr_parallel_in;


always_ff @ (posedge clk, negedge n_rst)
begin 
	if(1'b0 == n_rst)
	begin
		curr_parallel_in <= '1;
	end
	else
	begin
		curr_parallel_in <= next_parallel_in; 
	end
end

always_comb
begin
	next_parallel_in = curr_parallel_in;

	if(load_enable)
		next_parallel_in = parallel_in;
	else
	begin
		if(shift_enable)
		begin
			if (SHIFT_MSB)
				next_parallel_in = {curr_parallel_in[NUM_BITS-2:0], 1'b1};
			else		
				next_parallel_in = {1'b1, curr_parallel_in[NUM_BITS-1:1]};
		end
	end

end
if (SHIFT_MSB)
	assign serial_out = curr_parallel_in[NUM_BITS-1];
else		
	
	assign serial_out = curr_parallel_in[0];
endmodule