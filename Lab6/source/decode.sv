// $Id: $
// File name:   decode.sv
// Created:     2/16/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: decode testbench.

module decode
(
	input wire clk,
	input wire n_rst,
	input wire scl,
	input wire sda_in,
	input wire [7:0] starting_byte,
	
	output wire rw_mode,
	output wire address_match,
	output wire stop_found,
	output wire start_found
);

assign rw_mode = starting_byte[0];
assign address_match = starting_byte[7:1] == 7'b1111000 ? 1'b1 : 1'b0;

reg Q1;
reg Q2;
reg old_sample_sda;
reg new_sample_sda;
reg old_sample_scl;
reg new_sample_scl;

always_ff @ (negedge n_rst, posedge clk)
begin : REG_LOGIC
	if(1'b0 == n_rst)
	begin
		Q1 <= 1'b1;
		old_sample_sda <= 1'b1;
		new_sample_sda <= 1'b1;
		
		Q2 <= 1'b1;
		old_sample_scl <= 1'b1;
		new_sample_scl <= 1'b1;

		/*old_sample_sda <= 1'b1;
		new_sample_sda <= 1'b1;
		
		old_sample_scl <= 1'b1;
		new_sample_scl <= 1'b1;*/
	end
	else
	begin
		old_sample_sda <= new_sample_sda;
		new_sample_sda <= Q1;
		Q1 <= sda_in;

		old_sample_scl <= new_sample_scl;
		new_sample_scl <= Q2;
		Q2 <= scl;

		/*old_sample_sda <= new_sample_sda;
		new_sample_sda <= sda_in;

		old_sample_scl <= new_sample_scl;
		new_sample_scl <= scl;*/
	end
end

assign start_found = old_sample_sda && (~new_sample_sda) && old_sample_scl && new_sample_scl;
assign stop_found = (~old_sample_sda) && new_sample_sda && old_sample_scl && new_sample_scl;
endmodule