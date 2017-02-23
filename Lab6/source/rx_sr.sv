// $Id: $
// File name:   rx_sr.sv
// Created:     2/21/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: receiving shift register.


module rx_sr
(
	input wire clk,
	input wire n_rst,
	input wire sda_in,
	input wire rising_edge_found,
	input wire rx_enable,

	output wire [7:0] rx_data
);

flex_stp_sr #(.NUM_BITS(8)) stp(.clk(clk), .n_rst(n_rst), .shift_enable(rx_enable&&rising_edge_found), .serial_in(sda_in), .parallel_out(rx_data));

endmodule