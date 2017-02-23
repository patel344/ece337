// $Id: $
// File name:   timer.sv
// Created:     2/21/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: timer module.

module timer
(
	input wire clk,
	input wire n_rst,
	input wire rising_edge_found,
	input wire falling_edge_found,
	input wire stop_found,
	input wire start_found,
	
	output reg byte_received,
	output reg ack_prep,
	output reg check_ack,
	output reg ack_done
);

wire enable_condition;
wire [4:0] count;
reg nxt_ack_prep;
reg nxt_check_ack;
reg nxt_ack_done;
reg nxt_byte_received;

always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
	begin
		ack_prep <= 0;
		check_ack <= 0;
		ack_done <= 0;
		byte_received <= 0;
	end
	else
	begin
		ack_prep <= nxt_ack_prep;
		check_ack <= nxt_check_ack;
		ack_done <= nxt_ack_done;
		byte_received <= nxt_byte_received;
	end
end
//assign enable_condition = start_found && (rising_edge_found || falling_edge_found);
assign enable_condition = (rising_edge_found || falling_edge_found);

// Doesn't use rollover_flag
flex_counter #(.NUM_CNT_BITS(5)) counter(.clk(clk), .n_rst(n_rst), .count_enable(enable_condition), .rollover_val(5'd18), .clear(start_found || stop_found), .count_out(count));


assign nxt_byte_received = (count == 15) && rising_edge_found;
assign nxt_ack_prep      = (count == 16) && falling_edge_found;
assign nxt_check_ack    = (count == 17)  && rising_edge_found;
assign nxt_ack_done      = (count == 18) && falling_edge_found;

endmodule