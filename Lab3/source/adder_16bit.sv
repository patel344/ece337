// $Id: $
// File name:   adder_16bit.sv
// Created:     1/24/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 16 bit wrapper file.

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

always @ (carry_in)
begin
	assert((carry_in == 1'b1) || (carry_in == 1'b0))
	else $error("Input 'carry_in' of componenet is not a digital logic value");
end

adder_nbit #(.BIT_WIDTH(16)) adder(.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

endmodule