// $Id: $
// File name:   mealy.sv
// Created:     1/31/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: mealy machine detector design.

module mealy
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

typedef enum bit [1:0] {IDLE, STATE_1, STATE_11, STATE_110} stateType;
stateType state;
stateType next_state;

always_ff @ (negedge n_rst, posedge clk)
begin : REG_LOGIC
	if(1'b0 == n_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always_comb
begin : NXT_LOGIC
	next_state = state;
	
	case(state)
		IDLE:
		begin
			if(i == 1'b1)
				next_state = STATE_1;
			else
				next_state = IDLE;
		end
		STATE_1:
		begin
			if(i == 1'b1)
				next_state = STATE_11;
			else
				next_state = IDLE;
		end
		STATE_11:
		begin
			if(i == 1'b1)
				next_state = STATE_11;
			else
				next_state = STATE_110;
		end
		STATE_110:
		begin
			if(i == 1'b1)
				next_state = STATE_1;
			else
				next_state = IDLE;
		end	
	endcase
end

always_comb
begin
	if(state == STATE_110 && i == 1'b1)
		o = 1'b1;
	else
		o = 1'b0;
end
endmodule