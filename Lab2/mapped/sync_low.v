/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Jan 20 14:43:37 2017
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   Q1, n1, n2, n7;

  DFFSR Q1_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(Q1) );
  DFFSR sync_out_reg ( .D(Q1), .CLK(clk), .R(n1), .S(n2), .Q(sync_out) );
  NAND2X1 U9 ( .A(Q1), .B(n7), .Y(n2) );
  INVX1 U10 ( .A(n_rst), .Y(n7) );
  OR2X1 U11 ( .A(n_rst), .B(Q1), .Y(n1) );
endmodule

