// $Id: $
// File name:   scl_edge.sv
// Created:     2/16/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: scl edge detector module.

module scl_edge
(
	input wire clk,
	input wire n_rst,
	input wire scl,
	
	output wire rising_edge_found,
	output wire falling_edge_found
);

reg Q1;
reg old_sample;
reg new_sample;

always_ff @ (negedge n_rst, posedge clk)
begin : REG_LOGIC
	if(1'b0 == n_rst)
	begin
		Q1 <= 1'b1;
		old_sample <= 1'b1;
		new_sample <= 1'b1;
		
		/*old_sample <= 1'b1;
		new_sample <= 1'b1;*/
	end
	else
	begin
		old_sample <= new_sample;
		new_sample <= Q1;
		Q1 <= scl;
		
		/*old_sample <= new_sample;
		new_sample <= scl;*/
	end
end

assign falling_edge_found = old_sample && (~new_sample);
assign rising_edge_found = (~old_sample) && new_sample;

endmodule
		 
