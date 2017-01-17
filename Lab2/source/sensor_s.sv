// $Id: $
// File name:   sensor_s.sv
// Created:     1/17/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Structural Style Sensor Error Detector module.

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);

wire temp1;
wire temp2;

and A1 (temp1, sensors[1], sensors[3]);
and A2 (temp2, sensors[1], sensors[2]);
or A3 (error, temp1, temp2, sensors[0]);

endmodule