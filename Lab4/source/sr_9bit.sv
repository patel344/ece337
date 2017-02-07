// $Id: $
// File name:   sr_9bit.sv
// Created:     2/3/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 9-bit Shift Register.

module sr_9bit
(
	input wire clk,
	input wire n_rst,
	input wire shift_strobe,
	input wire serial_in,
	output reg [7:0] packet_data,
	output reg stop_bit
);

flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) bitshift(.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({stop_bit, packet_data}));

endmodule