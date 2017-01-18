/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 17 13:28:06 2017
/////////////////////////////////////////////////////////////


module sensor_d ( sensors, error );
  input [3:0] sensors;
  output error;
  wire   n4, n5;

  NAND2X1 U7 ( .A(n4), .B(n5), .Y(error) );
  OAI21X1 U8 ( .A(sensors[2]), .B(sensors[3]), .C(sensors[1]), .Y(n5) );
  INVX1 U9 ( .A(sensors[0]), .Y(n4) );
endmodule

