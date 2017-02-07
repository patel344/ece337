// $Id: $
// File name:   timer.sv
// Created:     2/3/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Timer 

module timer
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output reg shift_strobe,
	output reg packet_done
);
wire clear;
wire [3:0] rollover_clock;
wire [3:0] rollover_bit;
reg [3:0] clock_count;

assign rollover_clock = 4'd10;
assign rollover_bit = 4'd10;

always_comb
begin
	shift_strobe = clock_count == 1;
end

flex_counter clock_counter(.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(enable_timer), .rollover_val(rollover_clock), .rollover_flag(), .count_out(clock_count));
flex_counter bit_counter(.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(shift_strobe), .rollover_val(rollover_bit), .rollover_flag(packet_done));

endmodule