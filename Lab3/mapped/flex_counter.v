/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Jan 30 21:26:33 2017
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57;

  DFFSR rollover_flag_reg ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U33 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n33) );
  NAND2X1 U34 ( .A(n38), .B(n39), .Y(n37) );
  XOR2X1 U35 ( .A(n40), .B(rollover_val[1]), .Y(n39) );
  XOR2X1 U36 ( .A(n41), .B(rollover_val[2]), .Y(n38) );
  NAND3X1 U37 ( .A(n42), .B(n43), .C(n44), .Y(n36) );
  XOR2X1 U38 ( .A(n45), .B(rollover_val[3]), .Y(n44) );
  XOR2X1 U39 ( .A(rollover_val[0]), .B(n46), .Y(n43) );
  OAI22X1 U40 ( .A(n47), .B(n34), .C(n46), .D(n48), .Y(n32) );
  OAI22X1 U41 ( .A(n49), .B(n34), .C(n40), .D(n48), .Y(n31) );
  OAI21X1 U42 ( .A(n46), .B(n50), .C(n51), .Y(n40) );
  NOR2X1 U43 ( .A(rollover_flag), .B(n49), .Y(n50) );
  INVX1 U44 ( .A(count_out[1]), .Y(n49) );
  OAI22X1 U45 ( .A(n52), .B(n34), .C(n41), .D(n48), .Y(n30) );
  XNOR2X1 U46 ( .A(n51), .B(n53), .Y(n41) );
  INVX1 U47 ( .A(count_out[2]), .Y(n52) );
  OAI22X1 U48 ( .A(n54), .B(n34), .C(n45), .D(n48), .Y(n29) );
  INVX1 U49 ( .A(n42), .Y(n48) );
  NOR2X1 U50 ( .A(n55), .B(clear), .Y(n42) );
  XOR2X1 U51 ( .A(n56), .B(n57), .Y(n45) );
  NOR2X1 U52 ( .A(n53), .B(n51), .Y(n57) );
  NAND2X1 U53 ( .A(count_out[1]), .B(n46), .Y(n51) );
  NOR2X1 U54 ( .A(n47), .B(rollover_flag), .Y(n46) );
  INVX1 U55 ( .A(count_out[0]), .Y(n47) );
  NAND2X1 U56 ( .A(count_out[2]), .B(n35), .Y(n53) );
  NAND2X1 U57 ( .A(count_out[3]), .B(n35), .Y(n56) );
  INVX1 U58 ( .A(rollover_flag), .Y(n35) );
  INVX1 U59 ( .A(n55), .Y(n34) );
  NOR2X1 U60 ( .A(count_enable), .B(clear), .Y(n55) );
  INVX1 U61 ( .A(count_out[3]), .Y(n54) );
endmodule

