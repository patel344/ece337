// $Id: $
// File name:   rcu.sv
// Created:     2/3/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Receiver unit module.

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire start_bit_detected,
	input wire packet_done,
	input wire framing_error,
	output reg sbc_clear,
	output reg sbc_enable,
	output reg load_buffer,
	output reg enable_timer
);
typedef enum bit [2:0] {IDLE, CLEAR, START, STOP, WAIT, LOAD} stateType;
stateType state;
stateType next_state;

always_ff@(negedge n_rst, posedge clk)
begin : REG_LOGIC
	if(n_rst == 1'b0)
	begin
		state <= IDLE;
	end
	else
	begin
		state <= next_state;
	end
end

always_comb
begin : NXT_LOGIC
	next_state = state;
	
	case(state)
		IDLE:
		begin
			if(start_bit_detected == 1'b1)
				next_state = CLEAR;
			else
				next_state = IDLE;
		end
		CLEAR:
		begin
			next_state = START;
		end
		START:
		begin
			if(packet_done == 1'b1)
				next_state = STOP;
			else
				next_state = START;
		end
		STOP:
		begin
			next_state = WAIT;
		end
		WAIT:
		begin
			if(framing_error == 1'b1)
				next_state = IDLE;
			else
				next_state = LOAD;
		end
		LOAD:
		begin
			next_state = IDLE;
		end
		
	endcase
end

always_comb
begin	
	sbc_clear = 0;
	sbc_enable = 0;
	load_buffer = 0;
	enable_timer = 0;
	if(state == IDLE)
	begin
		sbc_clear = 0;
		sbc_enable = 0;
		load_buffer = 0;
		enable_timer = 0;
	end
	else if(state == CLEAR)
	begin
		sbc_clear = 1;
		sbc_enable = 0;
		load_buffer = 0;
		enable_timer = 0;
	end
	else if(state == START)
	begin
		sbc_clear = 0;
		sbc_enable = 0;
		load_buffer = 0;
		enable_timer = 1;
	end
	else if(state == STOP)
	begin
		sbc_clear = 0;
		sbc_enable = 1;
		load_buffer = 0;
		enable_timer = 0;
	end
	else if(state == WAIT)
	begin
		sbc_clear = 0;
		sbc_enable = 0;
		load_buffer = 0;
		enable_timer = 0;
	end
	else if(state == LOAD)
	begin
		sbc_clear = 0;
		sbc_enable = 0;
		load_buffer = 1;
		enable_timer = 0;
	end
end
endmodule
