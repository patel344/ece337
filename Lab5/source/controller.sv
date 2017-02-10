// $Id: $
// File name:   controller.sv
// Created:     2/9/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: controller module

module controller
(
	input wire clk,
	input wire n_reset,
	input wire dr,
	input wire lc,
	input wire overflow,
	
	output reg cnt_up,
	output reg clear,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

typedef enum bit [4:0] {IDLE,STORE,ZERO,SORT1,SORT2,SORT3,SORT4,MUL1,SUB1,MUL2,ADD1,MUL3,SUB2,MUL4,ADD2,LOAD1,LOAD2,LOAD3,LOAD4,MODWAIT1,MODWAIT2,MODWAIT3,EIDLE} stateType;
typedef enum bit [2:0] {NOP, COPY, LOADONE, LOADTWO, ADD, SUB, MUL} opType;
stateType state;
stateType next_state;
opType oper;
reg next_modwait;
reg temp;

always_ff@(negedge n_reset, posedge clk)
begin : REG_LOGIC
	if(n_reset == 1'b0)
	begin
		state <= IDLE;
		temp <= 0;
	end
	else
	begin
		state <= next_state;
		temp <= next_modwait;
	end
end

assign modwait = temp;

always_comb
begin : NXT_LOGIC
	next_state = state;
	
	case(state)
		IDLE:
		begin
			if(dr == 0)
				next_state = IDLE;
			else if(lc == 1)
				next_state = LOAD1;
			else
				next_state = STORE;
		end
		STORE:
		begin
			if(dr == 1)
				next_state = ZERO;
			else
				next_state = EIDLE;
		end
		ZERO:
		begin
			next_state = SORT1;
		end
		SORT1:
		begin
			next_state = SORT2;
		end
		SORT2:
		begin
			next_state = SORT3;
		end
		SORT3:
		begin
			next_state = SORT4;
		end
		SORT4:
		begin
			next_state = MUL4;
		end
		MUL1:
		begin
			next_state = SUB1;
		end
		SUB1:
		begin
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = IDLE;
		end
		MUL2:
		begin
			next_state = ADD1;
		end
		ADD1:
		begin
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = MUL1;
		end
		MUL3:
		begin
			next_state = SUB2;
		end
		SUB2:
		begin
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = MUL2;
			
		end
		MUL4:
		begin
			next_state = ADD2;
		end
		ADD2:
		begin
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = MUL3;
		end
		LOAD1:
		begin
			next_state = MODWAIT1;
		end
		MODWAIT1:
		begin
			next_state = LOAD2;
		end
		LOAD2:
		begin
			next_state = MODWAIT2;
		end
		MODWAIT2:
		begin
			next_state = LOAD3;
		end
		LOAD3:
		begin
			next_state = MODWAIT3;
		end
		MODWAIT3:
		begin
			next_state = LOAD4;
		end
		LOAD4:
		begin
			next_state = IDLE;
		end
		EIDLE:
		begin
			if(dr == 0)
				next_state = EIDLE;
			else if(lc == 1)
				next_state = LOAD1;
			else
				next_state = IDLE;
		end
	endcase
end

always_comb
begin	
	cnt_up = 0;
	clear = 0;
	op = NOP;
	next_modwait = 1;
	src1 = 0;
	src2 = 0;
	dest = 0;
	err = 0;
	
	if(state == IDLE)
	begin
		next_modwait = 0;
	end
	else if(state == STORE)
	begin
		op = LOADONE;
		dest = 5;
	end
	else if(state == ZERO)
	begin 
		cnt_up = 1;
		op = SUB;
		src1 = 0;
		src2 = 0;
		dest = 0;
	end
	else if(state == SORT1)
	begin
		op = COPY;
		src1 = 2;
		src2 = 1;
	end
	else if(state == SORT2)
	begin
		op = COPY;
		src1 = 3;
		src2 = 2;
	end
	else if(state == SORT3)
	begin
		op = COPY;
		src1 = 4;
		src2 = 3;
	end
	else if(state == SORT4)
	begin
		op = COPY;
		src1 = 5;
		src2 = 4;
	end
	else if(state == MUL1)
	begin
		op = MUL;
		src1 = 4;
		src2 = 6;
		dest = 10;
	end
	else if(state == SUB1)
	begin
		op = SUB;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if(state == MUL2)
	begin
		op = MUL;
		src1 = 3;
		src2 = 7;
		dest = 10;
	end
	else if(state == ADD1)
	begin
		op = ADD;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if(state == MUL3)
	begin
		op = MUL;
		src1 = 2;
		src2 = 8;
		dest = 10;
	end
	else if(state == SUB2)
	begin
		op = SUB;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if(state == MUL4)
	begin
		op = MUL;
		src1 = 4;
		src2 = 9;
		dest = 10;
	end
	else if(state == ADD2)
	begin
		op = ADD;
		src1 = 0;
		src2 = 10;
		dest = 0;
	end
	else if(state == LOAD1)
	begin
		op = LOADTWO;
		dest = 6;
		clear = 1;
	end
	else if(state == LOAD2)
	begin
		op = LOADTWO;
		dest = 7;
		clear = 1;
	end
	else if(state == LOAD3)
	begin
		op = LOADTWO;
		dest = 8;
		clear = 1;
	end
	else if(state == LOAD4)
	begin
		op = LOADTWO;
		dest = 9;
		clear = 1;
	end
	else if(state == MODWAIT1)
	begin
		next_modwait = 0;
	end
	else if(state == MODWAIT2)
	begin
		next_modwait = 0;
	end
	else if(state == MODWAIT3)
	begin
		next_modwait = 0;
	end
	else if(state == EIDLE)
	begin
		err = 1;
		next_modwait = 0;
	end
end
endmodule