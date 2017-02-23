// $Id: $
// File name:   controller.sv
// Created:     2/21/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: controller module

module controller
(
	input wire clk,
	input wire n_rst,
	input wire stop_found,
	input wire start_found,
	input wire byte_received,
	input wire ack_prep,
	input wire check_ack,
	input wire ack_done,
	input wire rw_mode,
	input wire address_match,
	input wire sda_in,
	
	output reg rx_enable,
	output reg tx_enable,
	output reg read_enable,
	output reg [1:0] sda_mode,
	output reg load_data
);

typedef enum bit [3:0] {IDLE, START, CHK_ADDR, DO_NACK, DO_ACK, LOAD, SEND_BYTE, ACK_CHK, WAIT, WAIT2} stateType;
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
			if(start_found)
				next_state = START;
			else
				next_state = IDLE;
		end
		START:
		begin
			if(byte_received)
				next_state = CHK_ADDR;
			else
				next_state = START;
		end
		CHK_ADDR:
		begin
			if(ack_prep && !(address_match && rw_mode == 1))
				next_state = DO_NACK;
			else if(ack_prep && address_match && rw_mode == 1)
				next_state = DO_ACK;
			else
				next_state = CHK_ADDR;
		end
		DO_NACK:
		begin
			if(ack_done)
				next_state = IDLE;
			else
				next_state = DO_NACK;
		end
		DO_ACK:
		begin
			if(ack_done)
				next_state = LOAD;
			else
				next_state = DO_ACK;
		end
		LOAD:
		begin
			next_state = SEND_BYTE;
		end
		SEND_BYTE:
		begin
			if(ack_prep)
				next_state = ACK_CHK;
			else
				next_state = SEND_BYTE;
		end
		ACK_CHK:
		begin
			if(check_ack)
				next_state = WAIT;
			else
				next_state = ACK_CHK;
		end
		WAIT:
		begin
			if(sda_in == 0)
				next_state = WAIT2;
			else
				next_state = IDLE;
		end
		WAIT2:
		begin
			if(ack_done)
				next_state = LOAD;
			else
				next_state = WAIT2;
		end
	endcase
end

always_comb
begin 
	rx_enable = 0;
	tx_enable = 0;
	read_enable = 0;
	sda_mode = 2'b00;
	load_data = 0;
	
	if(state == START)
	begin
		rx_enable = 1;
	end
	else if(state == DO_NACK)
	begin
		sda_mode = 2'b10;
	end
	else if(state == DO_ACK)
	begin
		sda_mode = 2'b01;
	end
	else if(state == LOAD)
	begin
		load_data = 1;
		sda_mode = 2'b11;
	end
	else if(state == SEND_BYTE)
	begin
		tx_enable = 1;
		sda_mode = 2'b11;
	end
	else if(state == WAIT)
	begin
		read_enable = 1;
	end

end
endmodule