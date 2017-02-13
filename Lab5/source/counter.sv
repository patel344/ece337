// $Id: $
// File name:   counter.sv
// Created:     2/10/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: counter module

module counter
(	input wire clk,
	input wire n_reset,
	input wire cnt_up,
	input wire clear,

	output wire one_k_samples
);

flex_counter #(.NUM_CNT_BITS(10)) counter(.clk(clk), .n_rst(n_reset), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .rollover_flag(one_k_samples));

endmodule