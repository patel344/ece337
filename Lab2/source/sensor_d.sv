// $Id: $
// File name:   sensor_d.sv
// Created:     1/17/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Dataflow Style Sensor Error Detector.

module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);

wire st1;
wire st2;
wire st3;

assign st1 = (sensors[3] == 1'b0) ? 1'b0 : 1'b1;
assign st2 = (sensors[2] == 1'b0) ? 1'b0 : 1'b1;
assign st3 = (sensors[1] == 1'b0) ? 1'b0 : ((1 & st1) | (1 & st2));  
assign error = (sensors[0] == 1'b0) ? st3 : 1'b1;

endmodule