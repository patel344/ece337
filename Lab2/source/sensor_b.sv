// $Id: $
// File name:   sensor_b.sv
// Created:     1/17/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Behavioral Style Sensor Error Detector.

module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);

always_comb
begin
	error = 1'b0;
	
	if(sensors[0] | sensors[1] & sensors[2] | sensors[1] & sensors[3])
	begin
		error = 1'b1;
	end
end

endmodule