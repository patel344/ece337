// $Id: $
// File name:   sda_sel.sv
// Created:     2/16/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sda select module.

module sda_sel
(
	input wire tx_out,
	input wire [1:0] sda_mode,
	
	output wire sda_out
);

assign sda_out = (sda_mode == 2'b00 || sda_mode == 2'b10) ? 1'b1 : ((sda_mode == 2'b01) ? 1'b0 : tx_out);

endmodule  
