// $Id: $
// File name:   tx_sr.sv
// Created:     2/21/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: transmiting shift register.

module tx_sr
(
	input wire clk,
	input wire n_rst,
	input wire falling_edge_found,
	input wire tx_enable,
	input wire [7:0] tx_data,
	input wire load_data,

	output wire tx_out
);

flex_pts_sr #(.NUM_BITS(8)) pts(.clk(clk), .n_rst(n_rst), .shift_enable(tx_enable&&falling_edge_found), .load_enable(load_data), .parallel_in(tx_data), .serial_out(tx_out));

endmodule