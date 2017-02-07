// $Id: $
// File name:   sync_high.sv
// Created:     1/19/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic High Synchronizer.

module sync_high
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);

reg Q1;

always_ff @ (posedge clk, negedge n_rst)
begin 
	if(1'b0 == n_rst)
	begin
		Q1 <= 1'b1;
		sync_out <= 1'b1;
	end
	else
	begin
		Q1 <= async_in;
		sync_out <= Q1;
	end
end
endmodule
		 