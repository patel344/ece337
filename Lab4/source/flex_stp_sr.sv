// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/24/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: N-bit Serial-to-Parallel Shift Register Design.

module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg [NUM_BITS-1:0] parallel_out 
);
reg [NUM_BITS-1:0] next_parallel_out;

always_ff @ (posedge clk, negedge n_rst)
begin 
	if(1'b0 == n_rst)
		parallel_out <= '1;
	else
		parallel_out <= next_parallel_out; 
end

always_comb
begin
	next_parallel_out = parallel_out;

	if(shift_enable)
	begin
		if(SHIFT_MSB == 1'b0)
			next_parallel_out[NUM_BITS-1:0] = {serial_in, parallel_out[NUM_BITS-1:1]};
		else
			next_parallel_out[NUM_BITS-1:0] = {parallel_out[NUM_BITS-2:0], serial_in};
	end
end

endmodule