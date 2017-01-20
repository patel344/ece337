/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Jan 19 18:18:20 2017
/////////////////////////////////////////////////////////////


module adder_1bit ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n6, n7, n8;

  INVX2 U5 ( .A(b), .Y(n6) );
  INVX2 U6 ( .A(carry_in), .Y(n7) );
  OAI22X1 U7 ( .A(n6), .B(n8), .C(sum), .D(n7), .Y(carry_out) );
  XNOR2X1 U8 ( .A(n7), .B(n8), .Y(sum) );
  XNOR2X1 U9 ( .A(n6), .B(a), .Y(n8) );
endmodule

