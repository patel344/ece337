/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Jan 23 19:15:49 2017
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   Q1;

  DFFSR Q1_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q1) );
  DFFSR sync_out_reg ( .D(Q1), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule

