// $Id: $
// File name:   adder_1bit.sv
// Created:     1/19/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 1-bit Full Adder Module.

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);

wire temp1;
wire temp2;
wire temp3;
wire temp4;
xor X1 (temp1, a, b);
xor X2 (sum, temp1, carry_in);
and A1 (temp2, !carry_in, a, b);
or  O1 (temp3, a, b);
and A2 (temp4, carry_in, temp3);
or  O2 (carry_out, temp2, temp4);

endmodule