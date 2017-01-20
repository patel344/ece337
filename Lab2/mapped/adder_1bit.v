/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Jan 19 18:18:19 2017
/////////////////////////////////////////////////////////////


module adder_1bit ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U5 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX1 U6 ( .A(n5), .Y(carry_out) );
  AOI22X1 U7 ( .A(b), .B(a), .C(n4), .D(carry_in), .Y(n5) );
  XOR2X1 U8 ( .A(a), .B(b), .Y(n4) );
endmodule

