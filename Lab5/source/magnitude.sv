// $Id: $
// File name:   magnitude.sv
// Created:     2/9/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: magnitude module .

module magnitude
(
	input wire [16:0] in,
	output wire [15:0] out
);

wire MSB;
wire [16:0] twos_comp;

assign twos_comp = ~in + 1;
assign MSB = in[16];
assign out = (MSB == 1'b1) ? twos_comp[15:0] : in[15:0]; 

endmodule