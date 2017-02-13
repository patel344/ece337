/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb 12 19:28:04 2017
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   Q1;

  DFFSR Q1_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(Q1) );
  DFFSR sync_out_reg ( .D(Q1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   Q1;

  DFFSR Q1_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(Q1) );
  DFFSR sync_out_reg ( .D(Q1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   next_modwait, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147;
  wire   [4:0] state;
  wire   [4:0] next_state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[2]) );
  DFFSR temp_reg ( .D(next_modwait), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        modwait) );
  INVX1 U9 ( .A(n121), .Y(n122) );
  AND2X1 U10 ( .A(n92), .B(n121), .Y(n28) );
  INVX2 U11 ( .A(n107), .Y(n7) );
  OR2X1 U12 ( .A(n106), .B(n8), .Y(next_state[3]) );
  NAND2X1 U13 ( .A(n7), .B(n9), .Y(n8) );
  OR2X1 U14 ( .A(n73), .B(n74), .Y(n106) );
  OR2X2 U15 ( .A(n145), .B(n108), .Y(n9) );
  OR2X2 U16 ( .A(n59), .B(n58), .Y(n108) );
  INVX1 U17 ( .A(src2[0]), .Y(n66) );
  INVX1 U18 ( .A(overflow), .Y(n114) );
  AND2X2 U19 ( .A(n145), .B(n101), .Y(n10) );
  AND2X2 U20 ( .A(n41), .B(n38), .Y(n11) );
  AND2X2 U21 ( .A(n101), .B(n41), .Y(n12) );
  AND2X2 U22 ( .A(n116), .B(n115), .Y(n13) );
  BUFX2 U23 ( .A(n29), .Y(n14) );
  AND2X1 U24 ( .A(n128), .B(n129), .Y(n130) );
  INVX2 U25 ( .A(state[2]), .Y(n101) );
  AND2X1 U26 ( .A(n41), .B(n35), .Y(n33) );
  BUFX2 U27 ( .A(n132), .Y(n15) );
  INVX1 U28 ( .A(n136), .Y(n74) );
  INVX2 U29 ( .A(n123), .Y(n16) );
  INVX2 U30 ( .A(n34), .Y(n17) );
  INVX1 U31 ( .A(n47), .Y(n18) );
  INVX2 U32 ( .A(n23), .Y(n19) );
  INVX2 U33 ( .A(state[1]), .Y(n89) );
  NAND2X1 U34 ( .A(n44), .B(n37), .Y(n20) );
  INVX2 U35 ( .A(n101), .Y(n37) );
  OR2X2 U36 ( .A(src2[2]), .B(n45), .Y(src2[1]) );
  INVX1 U37 ( .A(src2[2]), .Y(n125) );
  INVX1 U38 ( .A(n45), .Y(n127) );
  INVX2 U39 ( .A(n22), .Y(n21) );
  NAND2X1 U40 ( .A(n31), .B(n12), .Y(n132) );
  INVX1 U41 ( .A(n89), .Y(n22) );
  BUFX2 U42 ( .A(n22), .Y(n35) );
  INVX1 U43 ( .A(n72), .Y(n23) );
  BUFX2 U44 ( .A(n18), .Y(n34) );
  BUFX2 U45 ( .A(n38), .Y(n24) );
  BUFX2 U46 ( .A(n83), .Y(n25) );
  INVX4 U47 ( .A(n41), .Y(n83) );
  BUFX2 U48 ( .A(n129), .Y(n26) );
  INVX4 U49 ( .A(n27), .Y(src2[2]) );
  AND2X2 U50 ( .A(n40), .B(n36), .Y(n31) );
  AND2X2 U51 ( .A(n128), .B(n132), .Y(n27) );
  AND2X1 U52 ( .A(n34), .B(n10), .Y(n32) );
  AND2X2 U53 ( .A(n30), .B(n83), .Y(n29) );
  AND2X2 U54 ( .A(state[2]), .B(n39), .Y(n30) );
  AND2X2 U55 ( .A(n47), .B(n89), .Y(n36) );
  INVX1 U56 ( .A(n106), .Y(n87) );
  AND2X2 U57 ( .A(state[1]), .B(n47), .Y(n38) );
  INVX2 U58 ( .A(state[3]), .Y(n39) );
  INVX4 U59 ( .A(n39), .Y(n40) );
  BUFX4 U60 ( .A(state[0]), .Y(n41) );
  INVX1 U61 ( .A(src1[2]), .Y(n90) );
  INVX1 U62 ( .A(n137), .Y(n123) );
  INVX2 U63 ( .A(state[4]), .Y(n47) );
  NAND3X1 U64 ( .A(n41), .B(n37), .C(n31), .Y(n126) );
  NAND2X1 U65 ( .A(n15), .B(n126), .Y(src2[0]) );
  NAND2X1 U66 ( .A(n31), .B(n37), .Y(n43) );
  NAND3X1 U67 ( .A(n40), .B(n38), .C(n83), .Y(n42) );
  INVX2 U68 ( .A(n42), .Y(n44) );
  NAND2X1 U69 ( .A(n44), .B(n37), .Y(n60) );
  OAI21X1 U70 ( .A(n41), .B(n43), .C(n60), .Y(n103) );
  INVX2 U71 ( .A(n103), .Y(n72) );
  NAND2X1 U72 ( .A(n44), .B(n101), .Y(n75) );
  NAND2X1 U73 ( .A(n31), .B(n25), .Y(n135) );
  NAND3X1 U74 ( .A(n72), .B(n75), .C(n135), .Y(n45) );
  NAND3X1 U75 ( .A(n40), .B(n101), .C(n11), .Y(n129) );
  INVX2 U76 ( .A(n40), .Y(n145) );
  NAND2X1 U77 ( .A(n11), .B(n30), .Y(n128) );
  NAND3X1 U78 ( .A(n26), .B(n125), .C(n126), .Y(n107) );
  INVX2 U79 ( .A(n107), .Y(n142) );
  NAND3X1 U80 ( .A(n24), .B(n10), .C(n25), .Y(n147) );
  NAND3X1 U81 ( .A(n127), .B(n142), .C(n147), .Y(op[2]) );
  NAND2X1 U82 ( .A(n11), .B(n10), .Y(n92) );
  NAND3X1 U83 ( .A(n41), .B(n30), .C(n21), .Y(n46) );
  INVX2 U84 ( .A(n46), .Y(n55) );
  NAND2X1 U85 ( .A(n55), .B(n17), .Y(n121) );
  NAND3X1 U86 ( .A(n32), .B(n35), .C(n25), .Y(n133) );
  NAND3X1 U87 ( .A(n32), .B(n25), .C(n21), .Y(n115) );
  INVX2 U88 ( .A(n115), .Y(n88) );
  NAND3X1 U89 ( .A(n41), .B(n36), .C(n10), .Y(n140) );
  INVX2 U90 ( .A(n140), .Y(n143) );
  NOR2X1 U91 ( .A(n88), .B(n143), .Y(n48) );
  NAND3X1 U92 ( .A(n28), .B(n133), .C(n48), .Y(dest[0]) );
  NAND2X1 U93 ( .A(n36), .B(n10), .Y(n49) );
  NAND3X1 U94 ( .A(n34), .B(n35), .C(n14), .Y(n109) );
  OAI21X1 U95 ( .A(n41), .B(n49), .C(n109), .Y(n54) );
  NAND2X1 U96 ( .A(lc), .B(n54), .Y(n71) );
  INVX2 U97 ( .A(n135), .Y(n50) );
  INVX2 U98 ( .A(n109), .Y(err) );
  INVX2 U99 ( .A(dr), .Y(n111) );
  AOI22X1 U100 ( .A(n50), .B(overflow), .C(err), .D(n111), .Y(n51) );
  NAND3X1 U101 ( .A(n71), .B(n75), .C(n51), .Y(n52) );
  INVX2 U102 ( .A(n52), .Y(n104) );
  NAND3X1 U103 ( .A(n40), .B(n37), .C(n11), .Y(n116) );
  NAND2X1 U104 ( .A(n29), .B(n36), .Y(n137) );
  NAND2X1 U105 ( .A(n29), .B(n24), .Y(n136) );
  NAND3X1 U106 ( .A(n34), .B(n14), .C(n21), .Y(n117) );
  INVX2 U107 ( .A(n117), .Y(n96) );
  NOR2X1 U108 ( .A(n74), .B(n96), .Y(n53) );
  NAND3X1 U109 ( .A(n116), .B(n16), .C(n53), .Y(n59) );
  INVX2 U110 ( .A(n54), .Y(n79) );
  INVX2 U111 ( .A(op[2]), .Y(n57) );
  NAND2X1 U112 ( .A(n55), .B(n34), .Y(n64) );
  NAND2X1 U113 ( .A(n33), .B(n32), .Y(n63) );
  NAND2X1 U114 ( .A(n64), .B(n63), .Y(n76) );
  NOR2X1 U115 ( .A(dest[0]), .B(n76), .Y(n56) );
  NAND3X1 U116 ( .A(n79), .B(n57), .C(n56), .Y(n58) );
  INVX2 U117 ( .A(n108), .Y(n110) );
  NAND3X1 U118 ( .A(n140), .B(n147), .C(n121), .Y(n62) );
  NAND2X1 U119 ( .A(n20), .B(n116), .Y(n61) );
  NOR2X1 U120 ( .A(n62), .B(n61), .Y(n68) );
  INVX2 U121 ( .A(n63), .Y(n65) );
  INVX2 U122 ( .A(n64), .Y(n95) );
  MUX2X1 U123 ( .B(n65), .A(n95), .S(lc), .Y(n67) );
  NAND3X1 U124 ( .A(n68), .B(n67), .C(n66), .Y(n69) );
  AOI21X1 U125 ( .A(n110), .B(n35), .C(n69), .Y(n70) );
  NAND2X1 U126 ( .A(n104), .B(n70), .Y(next_state[1]) );
  OAI21X1 U127 ( .A(n19), .B(overflow), .C(n71), .Y(n73) );
  INVX2 U128 ( .A(n75), .Y(n85) );
  INVX2 U129 ( .A(n76), .Y(n118) );
  MUX2X1 U130 ( .B(n118), .A(n117), .S(lc), .Y(n81) );
  NAND2X1 U131 ( .A(n116), .B(n147), .Y(n77) );
  NOR2X1 U132 ( .A(n123), .B(n77), .Y(n78) );
  OAI21X1 U133 ( .A(n79), .B(n111), .C(n78), .Y(n80) );
  NOR2X1 U134 ( .A(n81), .B(n80), .Y(n82) );
  OAI21X1 U135 ( .A(n25), .B(n108), .C(n82), .Y(n84) );
  AOI21X1 U136 ( .A(n85), .B(n114), .C(n84), .Y(n86) );
  NAND2X1 U137 ( .A(n87), .B(n86), .Y(next_state[0]) );
  NAND3X1 U138 ( .A(n126), .B(n136), .C(n121), .Y(src1[2]) );
  AOI21X1 U139 ( .A(n143), .B(n111), .C(n88), .Y(n91) );
  NAND3X1 U140 ( .A(n41), .B(n32), .C(n21), .Y(n134) );
  NAND3X1 U141 ( .A(n91), .B(n134), .C(n90), .Y(n99) );
  NAND3X1 U142 ( .A(n129), .B(n92), .C(n137), .Y(n93) );
  INVX2 U143 ( .A(n93), .Y(n131) );
  INVX2 U144 ( .A(lc), .Y(n94) );
  OAI21X1 U145 ( .A(n96), .B(n95), .C(n94), .Y(n97) );
  NAND2X1 U146 ( .A(n131), .B(n97), .Y(n98) );
  NOR2X1 U147 ( .A(n99), .B(n98), .Y(n100) );
  OAI21X1 U148 ( .A(n101), .B(n108), .C(n100), .Y(n102) );
  AOI21X1 U149 ( .A(overflow), .B(n23), .C(n102), .Y(n105) );
  NAND2X1 U150 ( .A(n105), .B(n104), .Y(next_state[2]) );
  OAI21X1 U151 ( .A(lc), .B(n109), .C(n140), .Y(n112) );
  AOI21X1 U152 ( .A(n112), .B(n111), .C(n110), .Y(n113) );
  OAI21X1 U153 ( .A(n127), .B(n114), .C(n113), .Y(n120) );
  NAND3X1 U154 ( .A(n13), .B(n118), .C(n117), .Y(n119) );
  OR2X1 U155 ( .A(n120), .B(n119), .Y(next_state[4]) );
  NOR2X1 U156 ( .A(n123), .B(n122), .Y(n124) );
  NAND3X1 U157 ( .A(n142), .B(n13), .C(n124), .Y(dest[1]) );
  NAND3X1 U158 ( .A(n13), .B(n136), .C(n140), .Y(dest[2]) );
  NAND3X1 U159 ( .A(n142), .B(n134), .C(n133), .Y(dest[3]) );
  NAND3X1 U160 ( .A(n127), .B(n26), .C(n126), .Y(src2[3]) );
  NAND3X1 U161 ( .A(n136), .B(n137), .C(n130), .Y(src1[0]) );
  NAND2X1 U162 ( .A(n15), .B(n131), .Y(src1[1]) );
  NAND3X1 U163 ( .A(n13), .B(n134), .C(n133), .Y(clear) );
  NAND3X1 U164 ( .A(n136), .B(n135), .C(n28), .Y(n139) );
  INVX2 U165 ( .A(clear), .Y(n141) );
  NAND3X1 U166 ( .A(n16), .B(n141), .C(n147), .Y(n138) );
  OR2X1 U167 ( .A(n139), .B(n138), .Y(op[0]) );
  NAND3X1 U168 ( .A(n142), .B(n141), .C(n140), .Y(op[1]) );
  INVX2 U169 ( .A(op[0]), .Y(n146) );
  AOI21X1 U170 ( .A(n33), .B(n37), .C(n143), .Y(n144) );
  NAND3X1 U171 ( .A(n146), .B(n145), .C(n144), .Y(next_modwait) );
  INVX2 U172 ( .A(n147), .Y(cnt_up) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180;

  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n179), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n179), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n174), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n169), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n169), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n178), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n178), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n177), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n177), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n176), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n176), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n162), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n175), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n180), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(A[0]), .B(n180), .Y(n72) );
  INVX1 U123 ( .A(B[9]), .Y(n93) );
  INVX2 U124 ( .A(B[0]), .Y(n180) );
  BUFX2 U125 ( .A(n60), .Y(n162) );
  INVX1 U126 ( .A(n17), .Y(n163) );
  INVX2 U127 ( .A(n163), .Y(n164) );
  XOR2X1 U128 ( .A(n87), .B(A[15]), .Y(n165) );
  XOR2X1 U129 ( .A(n164), .B(n165), .Y(DIFF[15]) );
  NAND2X1 U130 ( .A(n17), .B(n87), .Y(n166) );
  NAND2X1 U131 ( .A(n17), .B(A[15]), .Y(n167) );
  NAND2X1 U132 ( .A(n87), .B(A[15]), .Y(n168) );
  NAND3X1 U133 ( .A(n167), .B(n166), .C(n168), .Y(n16) );
  INVX1 U134 ( .A(n69), .Y(n68) );
  OR2X2 U135 ( .A(A[11]), .B(n91), .Y(n169) );
  INVX1 U136 ( .A(B[6]), .Y(n96) );
  INVX1 U137 ( .A(B[7]), .Y(n95) );
  INVX1 U138 ( .A(B[10]), .Y(n92) );
  INVX1 U139 ( .A(B[11]), .Y(n91) );
  INVX1 U140 ( .A(B[5]), .Y(n97) );
  XOR2X1 U141 ( .A(n103), .B(B[16]), .Y(n170) );
  XOR2X1 U142 ( .A(n16), .B(n170), .Y(DIFF[16]) );
  NAND2X1 U143 ( .A(n16), .B(n103), .Y(n171) );
  NAND2X1 U144 ( .A(n16), .B(B[16]), .Y(n172) );
  NAND2X1 U145 ( .A(n103), .B(B[16]), .Y(n173) );
  NAND3X1 U146 ( .A(n172), .B(n171), .C(n173), .Y(n15) );
  INVX1 U147 ( .A(B[3]), .Y(n99) );
  INVX1 U148 ( .A(n63), .Y(n84) );
  INVX1 U149 ( .A(B[2]), .Y(n100) );
  BUFX2 U150 ( .A(n28), .Y(n174) );
  INVX1 U151 ( .A(B[15]), .Y(n87) );
  NOR2X1 U152 ( .A(A[0]), .B(n180), .Y(n175) );
  OR2X2 U153 ( .A(A[5]), .B(n97), .Y(n176) );
  OR2X2 U154 ( .A(A[7]), .B(n95), .Y(n177) );
  OR2X2 U155 ( .A(A[9]), .B(n93), .Y(n178) );
  OR2X2 U156 ( .A(A[13]), .B(n89), .Y(n179) );
  INVX1 U157 ( .A(B[4]), .Y(n98) );
  INVX1 U158 ( .A(B[1]), .Y(n101) );
  INVX2 U159 ( .A(B[8]), .Y(n94) );
  INVX2 U160 ( .A(B[12]), .Y(n90) );
  INVX2 U161 ( .A(B[13]), .Y(n89) );
  INVX2 U162 ( .A(B[14]), .Y(n88) );
  INVX2 U163 ( .A(n70), .Y(n86) );
  INVX2 U164 ( .A(n66), .Y(n85) );
  INVX2 U165 ( .A(n58), .Y(n83) );
  INVX2 U166 ( .A(n50), .Y(n81) );
  INVX2 U167 ( .A(n42), .Y(n79) );
  INVX2 U168 ( .A(n34), .Y(n77) );
  INVX2 U169 ( .A(n26), .Y(n75) );
  INVX2 U170 ( .A(n18), .Y(n73) );
  INVX2 U171 ( .A(n56), .Y(n54) );
  INVX2 U172 ( .A(n48), .Y(n46) );
  INVX2 U173 ( .A(n40), .Y(n38) );
  INVX2 U174 ( .A(n32), .Y(n30) );
  INVX2 U175 ( .A(n24), .Y(n22) );
  INVX2 U176 ( .A(A[17]), .Y(n103) );
  INVX2 U177 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n152, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172;

  XNOR2X1 U5 ( .A(n172), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n23), .B(n170), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n170), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n163), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n24) );
  NAND2X1 U18 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n31), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n168), .B(n152), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n168), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n34), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2X1 U32 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n169), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n169), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n40) );
  NAND2X1 U46 ( .A(A[9]), .B(B[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n47), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n164), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n164), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U60 ( .A(A[7]), .B(B[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n55), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n166), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n166), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NAND2X1 U74 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n63), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n167), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n167), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U88 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n165), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n165), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n162), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(A[1]), .B(B[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X2 U113 ( .A(A[2]), .B(B[2]), .Y(n165) );
  OR2X1 U114 ( .A(A[6]), .B(B[6]), .Y(n166) );
  OAI21X1 U115 ( .A(n34), .B(n32), .C(n33), .Y(n152) );
  OR2X2 U116 ( .A(A[0]), .B(B[0]), .Y(n171) );
  AND2X2 U117 ( .A(n162), .B(n171), .Y(SUM[0]) );
  XOR2X1 U118 ( .A(A[15]), .B(B[15]), .Y(n154) );
  XOR2X1 U119 ( .A(n154), .B(n76), .Y(SUM[15]) );
  NAND2X1 U120 ( .A(A[15]), .B(B[15]), .Y(n155) );
  NAND2X1 U121 ( .A(A[15]), .B(n76), .Y(n156) );
  NAND2X1 U122 ( .A(B[15]), .B(n76), .Y(n157) );
  NAND3X1 U123 ( .A(n155), .B(n156), .C(n157), .Y(n17) );
  XOR2X1 U124 ( .A(n93), .B(n92), .Y(n158) );
  XOR2X1 U125 ( .A(n158), .B(n17), .Y(SUM[16]) );
  NAND2X1 U126 ( .A(n93), .B(n92), .Y(n159) );
  NAND2X1 U127 ( .A(n93), .B(n17), .Y(n160) );
  NAND2X1 U128 ( .A(n92), .B(n17), .Y(n161) );
  NAND3X1 U129 ( .A(n159), .B(n160), .C(n161), .Y(n16) );
  BUFX2 U130 ( .A(n75), .Y(n162) );
  BUFX2 U131 ( .A(n26), .Y(n163) );
  OR2X1 U132 ( .A(A[10]), .B(B[10]), .Y(n169) );
  OR2X2 U133 ( .A(A[8]), .B(B[8]), .Y(n164) );
  OR2X2 U134 ( .A(A[12]), .B(B[12]), .Y(n168) );
  OR2X2 U135 ( .A(A[14]), .B(B[14]), .Y(n170) );
  OR2X1 U136 ( .A(A[4]), .B(B[4]), .Y(n167) );
  OAI21X1 U137 ( .A(n163), .B(n24), .C(n25), .Y(n172) );
  INVX2 U138 ( .A(A[17]), .Y(n93) );
  INVX2 U139 ( .A(B[17]), .Y(n92) );
  INVX2 U140 ( .A(n72), .Y(n90) );
  INVX2 U141 ( .A(n64), .Y(n88) );
  INVX2 U142 ( .A(n56), .Y(n86) );
  INVX2 U143 ( .A(n48), .Y(n84) );
  INVX2 U144 ( .A(n40), .Y(n82) );
  INVX2 U145 ( .A(n32), .Y(n80) );
  INVX2 U146 ( .A(n24), .Y(n78) );
  INVX2 U147 ( .A(n18), .Y(n76) );
  INVX2 U148 ( .A(n70), .Y(n68) );
  INVX2 U149 ( .A(n62), .Y(n60) );
  INVX2 U150 ( .A(n54), .Y(n52) );
  INVX2 U151 ( .A(n46), .Y(n44) );
  INVX2 U152 ( .A(n38), .Y(n36) );
  INVX2 U153 ( .A(n30), .Y(n28) );
  INVX2 U154 ( .A(n22), .Y(n20) );
  INVX2 U155 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n9, n13, n19, n22, n24, n25, n30, n31, n36, n37, n40, n46,
         n49, n51, n52, n53, n54, n55, n57, n59, n61, n63, n65, n66, n67, n68,
         n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n109, n111, n112, n113,
         n114, n115, n116, n120, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n133, n134, n135, n136, n137, n140, n142, n144, n145,
         n146, n147, n148, n149, n151, n154, n155, n156, n159, n160, n161,
         n162, n163, n164, n165, n166, n169, n170, n171, n172, n173, n174,
         n177, n178, n179, n181, n182, n183, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n197, n198, n199, n200, n201, n202,
         n205, n206, n207, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n248, n249, n250,
         n251, n256, n257, n258, n259, n264, n265, n266, n267, n275, n279,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n545, n548, n549, n551, n554,
         n557, n558, n563, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n731, n733, n737,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n893, n894, n896,
         n897, n898, n899, n900, n917, n918, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129,
         n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139,
         n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149,
         n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159,
         n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169,
         n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179,
         n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189,
         n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199,
         n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209,
         n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219,
         n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229,
         n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239,
         n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249,
         n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259,
         n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269,
         n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279,
         n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289,
         n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299,
         n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309,
         n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319,
         n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329,
         n1330, n1331, n1332, n1333, n1334;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  XOR2X1 U54 ( .A(n73), .B(n54), .Y(product[46]) );
  NAND2X1 U55 ( .A(n72), .B(n1013), .Y(n54) );
  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  XOR2X1 U59 ( .A(n86), .B(n55), .Y(product[45]) );
  AOI21X1 U60 ( .A(n1282), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1164), .B(n1199), .Y(n74) );
  OAI21X1 U62 ( .A(n1193), .B(n1164), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n104), .B(n82), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1282), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1198), .Y(n87) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1282), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n999), .B(n1198), .Y(n96) );
  OAI21X1 U90 ( .A(n1193), .B(n999), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n130), .B(n106), .Y(n104) );
  OAI21X1 U98 ( .A(n1109), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1169), .B(n1010), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1169), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1169), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  AOI21X1 U108 ( .A(n1282), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n1198), .B(n115), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1194), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1010), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1010), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1282), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1199), .Y(n124) );
  OAI21X1 U124 ( .A(n1194), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1282), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1159), .B(n1199), .Y(n135) );
  OAI21X1 U138 ( .A(n1194), .B(n1159), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1165), .B(n1086), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1165), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1282), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1199), .Y(n146) );
  OAI21X1 U152 ( .A(n1193), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1086), .Y(n61) );
  NAND2X1 U160 ( .A(n330), .B(n339), .Y(n149) );
  AOI21X1 U162 ( .A(n155), .B(n1282), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n1064), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1282), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1160), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1160), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n361), .B(n350), .Y(n166) );
  NAND2X1 U182 ( .A(n361), .B(n350), .Y(n169) );
  AOI21X1 U184 ( .A(n171), .B(n1282), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1002), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1282), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n194), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1051), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1019), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1172), .B(n1166), .Y(n223) );
  AOI21X1 U258 ( .A(n1171), .B(n1166), .C(n1167), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1170), .B(n248), .C(n1173), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1174), .C(n1178), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1175), .C(n1179), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1180), .B(n1176), .C(n1177), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n310), .C(n315), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n587), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n619), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n997), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n605), .C(n621), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n637), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n591), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n655), .YC(n347), .YS(n348) );
  FAX1 U338 ( .A(n354), .B(n363), .C(n352), .YC(n349), .YS(n350) );
  FAX1 U340 ( .A(n371), .B(n369), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U347 ( .A(n625), .B(n593), .C(n372), .YC(n367), .YS(n368) );
  FAX1 U348 ( .A(n609), .B(n657), .C(n641), .YC(n369), .YS(n370) );
  FAX1 U349 ( .A(n1156), .B(n578), .C(n673), .YC(n371), .YS(n372) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n1009), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U358 ( .A(n407), .B(n394), .C(n405), .YC(n389), .YS(n390) );
  FAX1 U361 ( .A(n659), .B(n611), .C(n643), .YC(n395), .YS(n396) );
  FAX1 U363 ( .A(n579), .B(n709), .C(n1244), .YC(n399), .YS(n400) );
  FAX1 U364 ( .A(n417), .B(n406), .C(n404), .YC(n401), .YS(n402) );
  FAX1 U366 ( .A(n423), .B(n996), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U368 ( .A(n660), .B(n612), .C(n644), .YC(n409), .YS(n410) );
  FAX1 U370 ( .A(n563), .B(n580), .C(n692), .YC(n413), .YS(n414) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U379 ( .A(n449), .B(n436), .C(n447), .YC(n431), .YS(n432) );
  FAX1 U380 ( .A(n438), .B(n442), .C(n440), .YC(n433), .YS(n434) );
  FAX1 U381 ( .A(n455), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n614), .YC(n439), .YS(n440) );
  FAX1 U386 ( .A(n463), .B(n450), .C(n461), .YC(n445), .YS(n446) );
  FAX1 U387 ( .A(n465), .B(n998), .C(n454), .YC(n447), .YS(n448) );
  FAX1 U389 ( .A(n679), .B(n631), .C(n565), .YC(n451), .YS(n452) );
  HAX1 U391 ( .A(n711), .B(n615), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U394 ( .A(n1107), .B(n475), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n680), .B(n664), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n696), .B(n616), .C(n648), .YC(n465), .YS(n466) );
  FAX1 U398 ( .A(n474), .B(n483), .C(n472), .YC(n469), .YS(n470) );
  FAX1 U400 ( .A(n480), .B(n1001), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n617), .B(n633), .C(n681), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n698), .B(n634), .C(n666), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n714), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n635), .B(n683), .C(n667), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n700), .B(n652), .C(n684), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n716), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n702), .B(n670), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n718), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n688), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n704), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1311), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1309), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1307), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1305), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n1303), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1299), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n733), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1295), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n1291), .Y(n578) );
  NOR2X1 U447 ( .A(n918), .B(n1285), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1283), .Y(n581) );
  AND2X1 U449 ( .A(n1316), .B(n1315), .Y(n582) );
  OAI22X1 U466 ( .A(n1280), .B(n918), .C(n1278), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1279), .C(n1163), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1163), .B(n742), .C(n1279), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1163), .B(n743), .C(n1082), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1162), .B(n744), .C(n1279), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1162), .B(n745), .C(n1082), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1162), .B(n746), .C(n1279), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1162), .B(n747), .C(n1082), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1162), .B(n748), .C(n1279), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1162), .B(n749), .C(n1082), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1163), .B(n750), .C(n1279), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1080), .B(n751), .C(n1278), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1163), .B(n752), .C(n1279), .D(n751), .Y(n595) );
  OAI22X1 U481 ( .A(n1080), .B(n753), .C(n1082), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1163), .B(n754), .C(n1279), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1080), .B(n755), .C(n1278), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1279), .B(n755), .C(n1280), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n1316), .B(n1083), .Y(n600) );
  XNOR2X1 U487 ( .A(n1312), .B(n1315), .Y(n741) );
  XNOR2X1 U488 ( .A(n1310), .B(n1315), .Y(n742) );
  XNOR2X1 U489 ( .A(n1308), .B(n1315), .Y(n743) );
  XNOR2X1 U490 ( .A(n1306), .B(n1315), .Y(n744) );
  XNOR2X1 U491 ( .A(n1304), .B(n1315), .Y(n745) );
  XNOR2X1 U492 ( .A(n1003), .B(n1315), .Y(n746) );
  XNOR2X1 U493 ( .A(n1300), .B(n1315), .Y(n747) );
  XNOR2X1 U494 ( .A(n1298), .B(n1314), .Y(n748) );
  XNOR2X1 U495 ( .A(n1296), .B(n1314), .Y(n749) );
  XNOR2X1 U496 ( .A(n1294), .B(n1314), .Y(n750) );
  XNOR2X1 U497 ( .A(n1292), .B(n1314), .Y(n751) );
  XNOR2X1 U498 ( .A(n1290), .B(n1314), .Y(n752) );
  XNOR2X1 U499 ( .A(n1288), .B(n1314), .Y(n753) );
  XNOR2X1 U500 ( .A(n1286), .B(n1314), .Y(n754) );
  XNOR2X1 U501 ( .A(n1284), .B(n1314), .Y(n755) );
  XNOR2X1 U502 ( .A(n49), .B(n1314), .Y(n756) );
  OAI22X1 U505 ( .A(n1334), .B(n1275), .C(n1273), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1334), .B(n1077), .C(n1275), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1275), .B(n759), .C(n1077), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1275), .B(n760), .C(n1273), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1275), .B(n761), .C(n1077), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1275), .B(n762), .C(n1273), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1275), .B(n763), .C(n1077), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1275), .B(n764), .C(n1273), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1276), .B(n765), .C(n1077), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1276), .B(n766), .C(n1273), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1275), .B(n767), .C(n1077), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1276), .B(n768), .C(n1273), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1276), .B(n769), .C(n1077), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1275), .B(n770), .C(n1273), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1276), .B(n771), .C(n1077), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1276), .B(n772), .C(n1273), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1077), .B(n772), .C(n1275), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n1312), .B(n1115), .Y(n758) );
  XNOR2X1 U527 ( .A(n1310), .B(n1114), .Y(n759) );
  XNOR2X1 U528 ( .A(n1308), .B(n1115), .Y(n760) );
  XNOR2X1 U529 ( .A(n1306), .B(n1114), .Y(n761) );
  XNOR2X1 U530 ( .A(n1304), .B(n1062), .Y(n762) );
  XNOR2X1 U531 ( .A(n1003), .B(n1063), .Y(n763) );
  XNOR2X1 U532 ( .A(n1300), .B(n1115), .Y(n764) );
  XNOR2X1 U533 ( .A(n1298), .B(n1114), .Y(n765) );
  XNOR2X1 U534 ( .A(n1296), .B(n1063), .Y(n766) );
  XNOR2X1 U535 ( .A(n1294), .B(n1114), .Y(n767) );
  XNOR2X1 U536 ( .A(n1292), .B(n1113), .Y(n768) );
  XNOR2X1 U537 ( .A(n1290), .B(n1113), .Y(n769) );
  XNOR2X1 U538 ( .A(n1288), .B(n1062), .Y(n770) );
  XNOR2X1 U539 ( .A(n1286), .B(n1115), .Y(n771) );
  XNOR2X1 U540 ( .A(n1284), .B(n1063), .Y(n772) );
  XNOR2X1 U541 ( .A(n49), .B(n1062), .Y(n773) );
  OAI22X1 U544 ( .A(n1332), .B(n1061), .C(n1268), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1332), .B(n1269), .C(n1271), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1271), .B(n776), .C(n1269), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1053), .B(n777), .C(n1268), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1053), .B(n778), .C(n1269), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1271), .B(n779), .C(n1268), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1271), .B(n780), .C(n1269), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1271), .B(n781), .C(n1268), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1271), .B(n782), .C(n1269), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1271), .B(n783), .C(n1268), .D(n782), .Y(n628) );
  OAI22X1 U557 ( .A(n1053), .B(n785), .C(n1268), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1061), .B(n786), .C(n1269), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n1053), .B(n787), .C(n1268), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1271), .B(n788), .C(n1269), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1271), .B(n789), .C(n1268), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1269), .B(n789), .C(n1271), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1316), .B(n549), .Y(n636) );
  XNOR2X1 U565 ( .A(n1312), .B(n1331), .Y(n775) );
  XNOR2X1 U566 ( .A(n1310), .B(n1331), .Y(n776) );
  XNOR2X1 U567 ( .A(n1308), .B(n1331), .Y(n777) );
  XNOR2X1 U568 ( .A(n1306), .B(n1197), .Y(n778) );
  XNOR2X1 U569 ( .A(n1304), .B(n1196), .Y(n779) );
  XNOR2X1 U570 ( .A(n1003), .B(n1196), .Y(n780) );
  XNOR2X1 U571 ( .A(n1300), .B(n1196), .Y(n781) );
  XNOR2X1 U572 ( .A(n1298), .B(n1197), .Y(n782) );
  XNOR2X1 U573 ( .A(n1296), .B(n1331), .Y(n783) );
  XNOR2X1 U577 ( .A(n1288), .B(n1196), .Y(n787) );
  XNOR2X1 U578 ( .A(n1286), .B(n1197), .Y(n788) );
  XNOR2X1 U579 ( .A(n1284), .B(n1196), .Y(n789) );
  XNOR2X1 U580 ( .A(n49), .B(n1197), .Y(n790) );
  OAI22X1 U583 ( .A(n1066), .B(n1079), .C(n1265), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1067), .B(n1108), .C(n1267), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1079), .B(n793), .C(n1108), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1079), .B(n794), .C(n1265), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1267), .B(n795), .C(n1108), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1267), .B(n796), .C(n1265), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1267), .B(n797), .C(n1108), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1267), .B(n798), .C(n1265), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1267), .B(n799), .C(n1108), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1267), .B(n800), .C(n1265), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1267), .B(n801), .C(n1108), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1267), .B(n802), .C(n1265), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1267), .B(n803), .C(n1108), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1267), .B(n804), .C(n1265), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1267), .B(n805), .C(n1108), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1267), .B(n806), .C(n1265), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1108), .B(n806), .C(n1267), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1316), .B(n1181), .Y(n654) );
  XNOR2X1 U604 ( .A(n1312), .B(n1052), .Y(n792) );
  XNOR2X1 U605 ( .A(n1310), .B(n1052), .Y(n793) );
  XNOR2X1 U606 ( .A(n1308), .B(n1052), .Y(n794) );
  XNOR2X1 U607 ( .A(n1306), .B(n1327), .Y(n795) );
  XNOR2X1 U608 ( .A(n1304), .B(n1327), .Y(n796) );
  XNOR2X1 U609 ( .A(n1302), .B(n1052), .Y(n797) );
  XNOR2X1 U610 ( .A(n1300), .B(n1052), .Y(n798) );
  XNOR2X1 U611 ( .A(n1298), .B(n1327), .Y(n799) );
  XNOR2X1 U614 ( .A(n1292), .B(n1327), .Y(n802) );
  XNOR2X1 U616 ( .A(n1288), .B(n1052), .Y(n804) );
  XNOR2X1 U617 ( .A(n1286), .B(n1327), .Y(n805) );
  XNOR2X1 U618 ( .A(n1284), .B(n1327), .Y(n806) );
  XNOR2X1 U619 ( .A(n49), .B(n1327), .Y(n807) );
  OAI22X1 U622 ( .A(n1326), .B(n1264), .C(n1119), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1326), .B(n1120), .C(n1264), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1200), .B(n810), .C(n1120), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1200), .B(n811), .C(n1120), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1200), .B(n812), .C(n1120), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1200), .B(n813), .C(n1119), .D(n812), .Y(n660) );
  OAI22X1 U631 ( .A(n1264), .B(n815), .C(n1119), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1264), .B(n816), .C(n1120), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1264), .B(n817), .C(n1119), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1264), .B(n818), .C(n1119), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1264), .B(n819), .C(n1119), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1264), .B(n820), .C(n1119), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1264), .B(n821), .C(n1119), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1264), .B(n822), .C(n1120), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1264), .B(n823), .C(n1120), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1119), .B(n823), .C(n1264), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1316), .B(n1262), .Y(n672) );
  XNOR2X1 U643 ( .A(n1312), .B(n1325), .Y(n809) );
  XNOR2X1 U644 ( .A(n1310), .B(n1325), .Y(n810) );
  XNOR2X1 U645 ( .A(n1308), .B(n1325), .Y(n811) );
  XNOR2X1 U646 ( .A(n1306), .B(n1325), .Y(n812) );
  XNOR2X1 U647 ( .A(n1304), .B(n1325), .Y(n813) );
  XNOR2X1 U648 ( .A(n1003), .B(n1325), .Y(n814) );
  XNOR2X1 U649 ( .A(n1300), .B(n1325), .Y(n815) );
  XNOR2X1 U650 ( .A(n1298), .B(n1325), .Y(n816) );
  XNOR2X1 U651 ( .A(n1296), .B(n1325), .Y(n817) );
  XNOR2X1 U652 ( .A(n1294), .B(n1325), .Y(n818) );
  XNOR2X1 U653 ( .A(n1292), .B(n1325), .Y(n819) );
  XNOR2X1 U654 ( .A(n1290), .B(n1325), .Y(n820) );
  XNOR2X1 U655 ( .A(n1288), .B(n1325), .Y(n821) );
  XNOR2X1 U656 ( .A(n1286), .B(n1325), .Y(n822) );
  XNOR2X1 U657 ( .A(n1284), .B(n1325), .Y(n823) );
  XNOR2X1 U658 ( .A(n49), .B(n1325), .Y(n824) );
  OAI22X1 U661 ( .A(n1324), .B(n1260), .C(n1259), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1324), .B(n1259), .C(n1261), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1261), .B(n827), .C(n1259), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1260), .B(n828), .C(n1259), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1261), .B(n829), .C(n1259), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1260), .B(n830), .C(n1259), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1261), .B(n831), .C(n1259), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1260), .B(n832), .C(n1259), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1260), .B(n833), .C(n1259), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1261), .B(n834), .C(n1259), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1260), .B(n835), .C(n1259), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1261), .B(n836), .C(n1259), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1260), .B(n837), .C(n1259), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1261), .B(n838), .C(n1259), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1260), .B(n839), .C(n1259), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1261), .B(n840), .C(n1259), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1259), .B(n840), .C(n1261), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1316), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n1312), .B(n1071), .Y(n826) );
  XNOR2X1 U683 ( .A(n1310), .B(n1071), .Y(n827) );
  XNOR2X1 U684 ( .A(n1308), .B(n1071), .Y(n828) );
  XNOR2X1 U688 ( .A(n1300), .B(n1158), .Y(n832) );
  XNOR2X1 U689 ( .A(n1298), .B(n1158), .Y(n833) );
  XNOR2X1 U690 ( .A(n1296), .B(n1158), .Y(n834) );
  XNOR2X1 U691 ( .A(n1294), .B(n1158), .Y(n835) );
  XNOR2X1 U692 ( .A(n1292), .B(n1158), .Y(n836) );
  XNOR2X1 U693 ( .A(n1290), .B(n1158), .Y(n837) );
  XNOR2X1 U694 ( .A(n1288), .B(n1158), .Y(n838) );
  XNOR2X1 U695 ( .A(n1286), .B(n1158), .Y(n839) );
  XNOR2X1 U696 ( .A(n1284), .B(n1158), .Y(n840) );
  XNOR2X1 U697 ( .A(n49), .B(n1158), .Y(n841) );
  OAI22X1 U700 ( .A(n1202), .B(n1226), .C(n1065), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1202), .B(n1256), .C(n843), .D(n1258), .Y(n692) );
  OAI22X1 U704 ( .A(n1257), .B(n844), .C(n1256), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1257), .B(n845), .C(n1256), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1226), .B(n846), .C(n1256), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1226), .B(n847), .C(n1256), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1257), .B(n848), .C(n1256), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1226), .B(n849), .C(n1256), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1226), .B(n850), .C(n1065), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1226), .B(n851), .C(n1065), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1257), .B(n852), .C(n1065), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1226), .B(n853), .C(n1065), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1226), .B(n854), .C(n1065), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1226), .B(n855), .C(n1065), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1257), .B(n856), .C(n1065), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1257), .B(n857), .C(n1065), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1065), .B(n857), .C(n1226), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1316), .B(n1255), .Y(n708) );
  XNOR2X1 U722 ( .A(n1310), .B(n1321), .Y(n844) );
  XNOR2X1 U723 ( .A(n1308), .B(n1321), .Y(n845) );
  XNOR2X1 U724 ( .A(n1306), .B(n1321), .Y(n846) );
  XNOR2X1 U725 ( .A(n1304), .B(n1321), .Y(n847) );
  XNOR2X1 U726 ( .A(n1302), .B(n1321), .Y(n848) );
  XNOR2X1 U727 ( .A(n1300), .B(n1321), .Y(n849) );
  XNOR2X1 U728 ( .A(n1298), .B(n1321), .Y(n850) );
  XNOR2X1 U729 ( .A(n1296), .B(n1321), .Y(n851) );
  XNOR2X1 U730 ( .A(n1294), .B(n1068), .Y(n852) );
  XNOR2X1 U731 ( .A(n1292), .B(n1321), .Y(n853) );
  XNOR2X1 U732 ( .A(n1290), .B(n1321), .Y(n854) );
  XNOR2X1 U733 ( .A(n1288), .B(n1321), .Y(n855) );
  XNOR2X1 U734 ( .A(n1286), .B(n1068), .Y(n856) );
  XNOR2X1 U735 ( .A(n1284), .B(n1068), .Y(n857) );
  XNOR2X1 U736 ( .A(n49), .B(n1068), .Y(n858) );
  OAI22X1 U739 ( .A(n1059), .B(n1254), .C(n917), .D(n876), .Y(n572) );
  INVX4 U740 ( .A(n563), .Y(n709) );
  OAI22X1 U742 ( .A(n917), .B(n1060), .C(n1254), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1254), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1254), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1254), .B(n863), .C(n917), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1254), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1254), .B(n865), .C(n917), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1254), .B(n866), .C(n917), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1254), .B(n867), .C(n917), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1254), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1254), .B(n869), .C(n917), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1254), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1254), .B(n871), .C(n917), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1254), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1254), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1254), .B(n874), .C(n917), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1254), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1312), .B(n1319), .Y(n860) );
  XNOR2X1 U759 ( .A(n1310), .B(n1319), .Y(n861) );
  XNOR2X1 U760 ( .A(n1308), .B(n1319), .Y(n862) );
  XNOR2X1 U761 ( .A(n1306), .B(n1318), .Y(n863) );
  XNOR2X1 U762 ( .A(n1304), .B(n1318), .Y(n864) );
  XNOR2X1 U763 ( .A(n1302), .B(n1318), .Y(n865) );
  XNOR2X1 U764 ( .A(n1300), .B(n1318), .Y(n866) );
  XNOR2X1 U765 ( .A(n1298), .B(n1318), .Y(n867) );
  XNOR2X1 U766 ( .A(n1296), .B(n1318), .Y(n868) );
  XNOR2X1 U767 ( .A(n1294), .B(n1318), .Y(n869) );
  XNOR2X1 U768 ( .A(n1292), .B(n1318), .Y(n870) );
  XNOR2X1 U769 ( .A(n1290), .B(n1318), .Y(n871) );
  XNOR2X1 U770 ( .A(n1288), .B(n1318), .Y(n872) );
  XNOR2X1 U771 ( .A(n1286), .B(n1318), .Y(n873) );
  XNOR2X1 U772 ( .A(n1284), .B(n1318), .Y(n874) );
  XNOR2X1 U773 ( .A(n49), .B(n1318), .Y(n875) );
  XOR2X1 U802 ( .A(n1315), .B(a[29]), .Y(n893) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  XOR2X1 U805 ( .A(n1070), .B(n1095), .Y(n894) );
  NAND2X1 U810 ( .A(n896), .B(n1081), .Y(n30) );
  XOR2X1 U811 ( .A(n1328), .B(a[23]), .Y(n896) );
  NAND2X1 U813 ( .A(n897), .B(n22), .Y(n24) );
  XNOR2X1 U815 ( .A(n1076), .B(a[21]), .Y(n22) );
  XOR2X1 U817 ( .A(n1071), .B(a[19]), .Y(n898) );
  INVX2 U828 ( .A(n410), .Y(n995) );
  INVX4 U829 ( .A(n995), .Y(n996) );
  INVX1 U830 ( .A(n128), .Y(n126) );
  INVX8 U831 ( .A(n1084), .Y(n1275) );
  INVX8 U832 ( .A(n1263), .Y(n1264) );
  INVX4 U833 ( .A(n731), .Y(n1003) );
  BUFX4 U834 ( .A(n324), .Y(n997) );
  BUFX4 U835 ( .A(n1333), .Y(n1063) );
  INVX4 U836 ( .A(n1334), .Y(n1333) );
  INVX8 U837 ( .A(n1059), .Y(n1318) );
  INVX4 U838 ( .A(n541), .Y(n1313) );
  BUFX4 U839 ( .A(n452), .Y(n998) );
  INVX8 U840 ( .A(n1315), .Y(n918) );
  INVX8 U841 ( .A(n1311), .Y(n1312) );
  INVX4 U842 ( .A(n877), .Y(n1311) );
  INVX8 U843 ( .A(n1307), .Y(n1308) );
  INVX4 U844 ( .A(n879), .Y(n1307) );
  INVX2 U845 ( .A(n1329), .Y(n1328) );
  INVX2 U846 ( .A(n46), .Y(n1277) );
  BUFX2 U847 ( .A(n1333), .Y(n1113) );
  INVX2 U848 ( .A(n1), .Y(n1320) );
  INVX2 U849 ( .A(n1324), .Y(n1323) );
  INVX4 U850 ( .A(n1301), .Y(n1302) );
  INVX2 U851 ( .A(n882), .Y(n1301) );
  BUFX2 U852 ( .A(n422), .Y(n1188) );
  BUFX2 U853 ( .A(n435), .Y(n1191) );
  BUFX2 U854 ( .A(n439), .Y(n1189) );
  INVX2 U855 ( .A(n1290), .Y(n737) );
  INVX2 U856 ( .A(n1302), .Y(n731) );
  INVX4 U857 ( .A(n1235), .Y(n1261) );
  BUFX2 U858 ( .A(n1333), .Y(n1062) );
  INVX2 U859 ( .A(n889), .Y(n1287) );
  INVX4 U860 ( .A(n1299), .Y(n1300) );
  INVX2 U861 ( .A(n1186), .Y(n1276) );
  INVX2 U862 ( .A(n1317), .Y(n1316) );
  BUFX2 U863 ( .A(n421), .Y(n1104) );
  BUFX2 U864 ( .A(n1274), .Y(n1077) );
  INVX2 U865 ( .A(n420), .Y(n1004) );
  INVX4 U866 ( .A(n1277), .Y(n1278) );
  INVX2 U867 ( .A(n1106), .Y(n1107) );
  BUFX2 U868 ( .A(n52), .Y(n1194) );
  BUFX2 U869 ( .A(n1069), .Y(n1163) );
  BUFX2 U870 ( .A(n53), .Y(n1199) );
  BUFX2 U871 ( .A(n52), .Y(n1193) );
  OR2X2 U872 ( .A(n102), .B(n137), .Y(n999) );
  INVX1 U873 ( .A(n222), .Y(n221) );
  INVX8 U874 ( .A(n1287), .Y(n1288) );
  XNOR2X1 U875 ( .A(n1293), .B(n1066), .Y(n801) );
  INVX4 U876 ( .A(n1066), .Y(n1052) );
  XNOR2X1 U877 ( .A(n1295), .B(n1066), .Y(n800) );
  INVX4 U878 ( .A(n1066), .Y(n1327) );
  XOR2X1 U879 ( .A(n1289), .B(n1052), .Y(n803) );
  INVX1 U880 ( .A(n1268), .Y(n549) );
  INVX2 U881 ( .A(n489), .Y(n1000) );
  INVX4 U882 ( .A(n1000), .Y(n1001) );
  INVX1 U883 ( .A(n1281), .Y(n1002) );
  INVX8 U884 ( .A(n1283), .Y(n1284) );
  INVX4 U885 ( .A(n886), .Y(n1293) );
  XOR2X1 U886 ( .A(n1291), .B(n1195), .Y(n785) );
  XOR2X1 U887 ( .A(n1303), .B(n1323), .Y(n830) );
  INVX4 U888 ( .A(n1323), .Y(n1157) );
  XOR2X1 U889 ( .A(n1289), .B(n1195), .Y(n786) );
  XNOR2X1 U890 ( .A(n431), .B(n1004), .Y(n1131) );
  BUFX2 U891 ( .A(n415), .Y(n1005) );
  XNOR2X1 U892 ( .A(n433), .B(n1006), .Y(n418) );
  XNOR2X1 U893 ( .A(n1188), .B(n1191), .Y(n1006) );
  INVX1 U894 ( .A(n694), .Y(n1007) );
  INVX2 U895 ( .A(n1007), .Y(n1008) );
  INVX4 U896 ( .A(n885), .Y(n1295) );
  OR2X2 U897 ( .A(n49), .B(n1332), .Y(n791) );
  OR2X2 U898 ( .A(n49), .B(n1060), .Y(n876) );
  OR2X2 U899 ( .A(n49), .B(n1067), .Y(n808) );
  OR2X2 U900 ( .A(n49), .B(n1324), .Y(n842) );
  OR2X2 U901 ( .A(n49), .B(n1202), .Y(n859) );
  OR2X2 U902 ( .A(n49), .B(n1326), .Y(n825) );
  OR2X2 U903 ( .A(n49), .B(n1334), .Y(n774) );
  INVX1 U904 ( .A(n49), .Y(n1317) );
  OR2X2 U905 ( .A(n918), .B(n737), .Y(n1009) );
  OR2X2 U906 ( .A(n308), .B(n313), .Y(n1010) );
  INVX2 U907 ( .A(n1081), .Y(n1181) );
  AND2X2 U908 ( .A(n178), .B(n284), .Y(n1011) );
  AND2X2 U909 ( .A(n162), .B(n282), .Y(n1012) );
  INVX2 U910 ( .A(n918), .Y(n1085) );
  INVX2 U911 ( .A(n1255), .Y(n1065) );
  INVX2 U912 ( .A(n1078), .Y(n1273) );
  INVX2 U913 ( .A(n30), .Y(n1266) );
  INVX2 U914 ( .A(n891), .Y(n1283) );
  INVX4 U915 ( .A(n1285), .Y(n1286) );
  INVX2 U916 ( .A(n890), .Y(n1285) );
  INVX4 U917 ( .A(n1305), .Y(n1306) );
  INVX2 U918 ( .A(n880), .Y(n1305) );
  OR2X2 U919 ( .A(n292), .B(n293), .Y(n1013) );
  BUFX4 U920 ( .A(n1330), .Y(n1197) );
  INVX2 U921 ( .A(n1277), .Y(n1082) );
  INVX1 U922 ( .A(n211), .Y(n209) );
  XOR2X1 U923 ( .A(n377), .B(n379), .Y(n1014) );
  XOR2X1 U924 ( .A(n368), .B(n1014), .Y(n364) );
  NAND2X1 U925 ( .A(n368), .B(n377), .Y(n1015) );
  NAND2X1 U926 ( .A(n368), .B(n379), .Y(n1016) );
  NAND2X1 U927 ( .A(n377), .B(n379), .Y(n1017) );
  NAND3X1 U928 ( .A(n1016), .B(n1015), .C(n1017), .Y(n363) );
  BUFX2 U929 ( .A(n646), .Y(n1018) );
  INVX2 U930 ( .A(n201), .Y(n1019) );
  XOR2X1 U931 ( .A(n1311), .B(n1321), .Y(n843) );
  BUFX2 U932 ( .A(n431), .Y(n1190) );
  INVX4 U933 ( .A(n887), .Y(n1291) );
  XOR2X1 U934 ( .A(n383), .B(n381), .Y(n1020) );
  XOR2X1 U935 ( .A(n1020), .B(n370), .Y(n366) );
  NAND2X1 U936 ( .A(n383), .B(n381), .Y(n1021) );
  NAND2X1 U937 ( .A(n383), .B(n370), .Y(n1022) );
  NAND2X1 U938 ( .A(n381), .B(n370), .Y(n1023) );
  NAND3X1 U939 ( .A(n1021), .B(n1022), .C(n1023), .Y(n365) );
  XOR2X1 U940 ( .A(n356), .B(n367), .Y(n1024) );
  XOR2X1 U941 ( .A(n1024), .B(n365), .Y(n352) );
  NAND2X1 U942 ( .A(n356), .B(n367), .Y(n1025) );
  NAND2X1 U943 ( .A(n356), .B(n365), .Y(n1026) );
  NAND2X1 U944 ( .A(n367), .B(n365), .Y(n1027) );
  NAND3X1 U945 ( .A(n1025), .B(n1026), .C(n1027), .Y(n351) );
  XNOR2X1 U946 ( .A(n7), .B(a[19]), .Y(n1028) );
  INVX2 U947 ( .A(n1028), .Y(n1187) );
  INVX2 U948 ( .A(n1185), .Y(n1080) );
  XOR2X1 U949 ( .A(n459), .B(n448), .Y(n1029) );
  XOR2X1 U950 ( .A(n446), .B(n1029), .Y(n444) );
  NAND2X1 U951 ( .A(n446), .B(n459), .Y(n1030) );
  NAND2X1 U952 ( .A(n446), .B(n448), .Y(n1031) );
  NAND2X1 U953 ( .A(n459), .B(n448), .Y(n1032) );
  NAND3X1 U954 ( .A(n1031), .B(n1030), .C(n1032), .Y(n443) );
  XOR2X1 U955 ( .A(n600), .B(n632), .Y(n1033) );
  XOR2X1 U956 ( .A(n1033), .B(n712), .Y(n468) );
  NAND2X1 U957 ( .A(n600), .B(n632), .Y(n1034) );
  NAND2X1 U958 ( .A(n600), .B(n712), .Y(n1035) );
  NAND2X1 U959 ( .A(n632), .B(n712), .Y(n1036) );
  NAND3X1 U960 ( .A(n1034), .B(n1035), .C(n1036), .Y(n467) );
  XOR2X1 U961 ( .A(n663), .B(n456), .Y(n1037) );
  XOR2X1 U962 ( .A(n1037), .B(n467), .Y(n450) );
  NAND2X1 U963 ( .A(n663), .B(n456), .Y(n1038) );
  NAND2X1 U964 ( .A(n663), .B(n467), .Y(n1039) );
  NAND2X1 U965 ( .A(n456), .B(n467), .Y(n1040) );
  NAND3X1 U966 ( .A(n1038), .B(n1039), .C(n1040), .Y(n449) );
  INVX4 U967 ( .A(n888), .Y(n1289) );
  BUFX4 U968 ( .A(a[27]), .Y(n1095) );
  BUFX2 U969 ( .A(n402), .Y(n1041) );
  BUFX4 U970 ( .A(n1330), .Y(n1195) );
  INVX1 U971 ( .A(n1183), .Y(n1258) );
  INVX4 U972 ( .A(n881), .Y(n1303) );
  INVX2 U973 ( .A(n1320), .Y(n1319) );
  XOR2X1 U974 ( .A(n1189), .B(n424), .Y(n1042) );
  XOR2X1 U975 ( .A(n1042), .B(n426), .Y(n420) );
  NAND2X1 U976 ( .A(n1189), .B(n424), .Y(n1043) );
  NAND2X1 U977 ( .A(n1189), .B(n426), .Y(n1044) );
  NAND2X1 U978 ( .A(n424), .B(n426), .Y(n1045) );
  NAND3X1 U979 ( .A(n1043), .B(n1044), .C(n1045), .Y(n419) );
  XOR2X1 U980 ( .A(n1104), .B(n408), .Y(n1046) );
  XOR2X1 U981 ( .A(n1046), .B(n419), .Y(n404) );
  NAND2X1 U982 ( .A(n1104), .B(n408), .Y(n1047) );
  NAND2X1 U983 ( .A(n1104), .B(n419), .Y(n1048) );
  NAND2X1 U984 ( .A(n408), .B(n419), .Y(n1049) );
  NAND3X1 U985 ( .A(n1047), .B(n1048), .C(n1049), .Y(n403) );
  NAND2X1 U986 ( .A(n1213), .B(n1214), .Y(n1050) );
  NOR2X1 U987 ( .A(n1005), .B(n1041), .Y(n1051) );
  OR2X2 U988 ( .A(n1269), .B(n783), .Y(n1214) );
  XOR2X1 U989 ( .A(n1294), .B(n1332), .Y(n784) );
  BUFX2 U990 ( .A(n36), .Y(n1053) );
  BUFX2 U991 ( .A(n36), .Y(n1061) );
  XOR2X1 U992 ( .A(n376), .B(n378), .Y(n1054) );
  XOR2X1 U993 ( .A(n389), .B(n1054), .Y(n374) );
  NAND2X1 U994 ( .A(n389), .B(n376), .Y(n1055) );
  NAND2X1 U995 ( .A(n389), .B(n378), .Y(n1056) );
  NAND2X1 U996 ( .A(n376), .B(n378), .Y(n1057) );
  NAND3X1 U997 ( .A(n1056), .B(n1055), .C(n1057), .Y(n373) );
  INVX4 U998 ( .A(n1270), .Y(n1271) );
  AND2X2 U999 ( .A(n1316), .B(n1078), .Y(n618) );
  BUFX4 U1000 ( .A(n1069), .Y(n1162) );
  BUFX2 U1001 ( .A(n1112), .Y(n1058) );
  INVX2 U1002 ( .A(n1), .Y(n1059) );
  INVX1 U1003 ( .A(n1), .Y(n1060) );
  INVX1 U1004 ( .A(n177), .Y(n284) );
  OR2X2 U1005 ( .A(n49), .B(n918), .Y(n757) );
  INVX2 U1006 ( .A(n36), .Y(n1270) );
  NOR2X1 U1007 ( .A(n349), .B(n340), .Y(n1064) );
  INVX4 U1008 ( .A(n1255), .Y(n1256) );
  INVX2 U1009 ( .A(n22), .Y(n1262) );
  INVX4 U1010 ( .A(n25), .Y(n1066) );
  INVX1 U1011 ( .A(n25), .Y(n1067) );
  INVX2 U1012 ( .A(n25), .Y(n1329) );
  INVX2 U1013 ( .A(n1058), .Y(n1068) );
  NAND2X1 U1014 ( .A(n1278), .B(n893), .Y(n1069) );
  BUFX2 U1015 ( .A(n37), .Y(n1070) );
  XNOR2X1 U1016 ( .A(n1112), .B(a[17]), .Y(n899) );
  BUFX4 U1017 ( .A(n13), .Y(n1071) );
  INVX2 U1018 ( .A(n13), .Y(n1324) );
  XOR2X1 U1019 ( .A(n403), .B(n392), .Y(n1072) );
  XOR2X1 U1020 ( .A(n390), .B(n1072), .Y(n388) );
  NAND2X1 U1021 ( .A(n390), .B(n403), .Y(n1073) );
  NAND2X1 U1022 ( .A(n390), .B(n392), .Y(n1074) );
  NAND2X1 U1023 ( .A(n403), .B(n392), .Y(n1075) );
  NAND3X1 U1024 ( .A(n1074), .B(n1073), .C(n1075), .Y(n387) );
  BUFX2 U1025 ( .A(n13), .Y(n1076) );
  INVX2 U1026 ( .A(n1272), .Y(n1274) );
  INVX1 U1027 ( .A(n40), .Y(n1078) );
  INVX2 U1028 ( .A(n40), .Y(n1272) );
  BUFX2 U1029 ( .A(n1267), .Y(n1079) );
  INVX1 U1030 ( .A(n917), .Y(n1117) );
  INVX2 U1031 ( .A(n1278), .Y(n1083) );
  INVX4 U1032 ( .A(n1083), .Y(n1279) );
  XNOR2X1 U1033 ( .A(n19), .B(a[23]), .Y(n1081) );
  INVX4 U1034 ( .A(n1116), .Y(n563) );
  XOR2X1 U1035 ( .A(n1302), .B(n1157), .Y(n831) );
  INVX4 U1036 ( .A(n1313), .Y(n1314) );
  INVX2 U1037 ( .A(n1332), .Y(n1330) );
  XOR2X1 U1038 ( .A(n1306), .B(n1157), .Y(n829) );
  AND2X2 U1039 ( .A(n894), .B(n1274), .Y(n1084) );
  AND2X2 U1040 ( .A(n1085), .B(n1288), .Y(n579) );
  XOR2X1 U1041 ( .A(n1332), .B(a[25]), .Y(n1201) );
  INVX2 U1042 ( .A(n1332), .Y(n1331) );
  OR2X2 U1043 ( .A(n330), .B(n339), .Y(n1086) );
  INVX1 U1044 ( .A(n1086), .Y(n148) );
  INVX4 U1045 ( .A(n37), .Y(n1334) );
  XOR2X1 U1046 ( .A(n428), .B(n441), .Y(n1087) );
  XOR2X1 U1047 ( .A(n437), .B(n1087), .Y(n422) );
  NAND2X1 U1048 ( .A(n437), .B(n428), .Y(n1088) );
  NAND2X1 U1049 ( .A(n437), .B(n441), .Y(n1089) );
  NAND2X1 U1050 ( .A(n428), .B(n441), .Y(n1090) );
  NAND3X1 U1051 ( .A(n1089), .B(n1088), .C(n1090), .Y(n421) );
  XOR2X1 U1052 ( .A(n630), .B(n646), .Y(n1091) );
  XOR2X1 U1053 ( .A(n662), .B(n1091), .Y(n438) );
  NAND2X1 U1054 ( .A(n662), .B(n630), .Y(n1092) );
  NAND2X1 U1055 ( .A(n662), .B(n1018), .Y(n1093) );
  NAND2X1 U1056 ( .A(n630), .B(n1018), .Y(n1094) );
  NAND3X1 U1057 ( .A(n1093), .B(n1092), .C(n1094), .Y(n437) );
  XOR2X1 U1058 ( .A(n682), .B(n499), .Y(n1096) );
  XOR2X1 U1059 ( .A(n1096), .B(n497), .Y(n486) );
  NAND2X1 U1060 ( .A(n682), .B(n499), .Y(n1097) );
  NAND2X1 U1061 ( .A(n682), .B(n497), .Y(n1098) );
  NAND2X1 U1062 ( .A(n499), .B(n497), .Y(n1099) );
  NAND3X1 U1063 ( .A(n1097), .B(n1098), .C(n1099), .Y(n485) );
  XOR2X1 U1064 ( .A(n476), .B(n478), .Y(n1100) );
  XOR2X1 U1065 ( .A(n1100), .B(n485), .Y(n472) );
  NAND2X1 U1066 ( .A(n476), .B(n478), .Y(n1101) );
  NAND2X1 U1067 ( .A(n476), .B(n485), .Y(n1102) );
  NAND2X1 U1068 ( .A(n478), .B(n485), .Y(n1103) );
  NAND3X1 U1069 ( .A(n1101), .B(n1102), .C(n1103), .Y(n471) );
  XNOR2X1 U1070 ( .A(n145), .B(n1105), .Y(product[40]) );
  AND2X2 U1071 ( .A(n144), .B(n1165), .Y(n1105) );
  XOR2X1 U1072 ( .A(n25), .B(a[25]), .Y(n1184) );
  XOR2X1 U1073 ( .A(n1320), .B(a[17]), .Y(n9) );
  INVX2 U1074 ( .A(n477), .Y(n1106) );
  INVX2 U1075 ( .A(n7), .Y(n1112) );
  INVX1 U1076 ( .A(n189), .Y(n286) );
  INVX4 U1077 ( .A(n1187), .Y(n1259) );
  XNOR2X1 U1078 ( .A(n1326), .B(a[21]), .Y(n897) );
  BUFX2 U1079 ( .A(n1081), .Y(n1108) );
  NAND2X1 U1080 ( .A(n1169), .B(n1010), .Y(n1109) );
  NAND3X1 U1081 ( .A(n1228), .B(n1229), .C(n1230), .Y(n1110) );
  INVX1 U1082 ( .A(n171), .Y(n173) );
  XNOR2X1 U1083 ( .A(n661), .B(n1111), .Y(n424) );
  XNOR2X1 U1084 ( .A(n613), .B(n645), .Y(n1111) );
  INVX1 U1085 ( .A(n130), .Y(n279) );
  INVX2 U1086 ( .A(n7), .Y(n1322) );
  BUFX4 U1087 ( .A(n1333), .Y(n1114) );
  BUFX4 U1088 ( .A(n1333), .Y(n1115) );
  AOI22X1 U1089 ( .A(n1117), .B(n1118), .C(n1182), .D(n1118), .Y(n1116) );
  INVX1 U1090 ( .A(n1059), .Y(n1118) );
  XNOR2X1 U1091 ( .A(n31), .B(a[27]), .Y(n40) );
  INVX2 U1092 ( .A(n1262), .Y(n1119) );
  INVX2 U1093 ( .A(n1262), .Y(n1120) );
  XOR2X1 U1094 ( .A(n375), .B(n366), .Y(n1121) );
  XOR2X1 U1095 ( .A(n1121), .B(n364), .Y(n362) );
  NAND2X1 U1096 ( .A(n364), .B(n375), .Y(n1122) );
  NAND2X1 U1097 ( .A(n364), .B(n366), .Y(n1123) );
  NAND2X1 U1098 ( .A(n375), .B(n366), .Y(n1124) );
  NAND3X1 U1099 ( .A(n1123), .B(n1122), .C(n1124), .Y(n361) );
  XOR2X1 U1100 ( .A(n384), .B(n382), .Y(n1125) );
  XOR2X1 U1101 ( .A(n395), .B(n1125), .Y(n378) );
  NAND2X1 U1102 ( .A(n395), .B(n384), .Y(n1126) );
  NAND2X1 U1103 ( .A(n395), .B(n382), .Y(n1127) );
  NAND2X1 U1104 ( .A(n384), .B(n382), .Y(n1128) );
  NAND3X1 U1105 ( .A(n1127), .B(n1126), .C(n1128), .Y(n377) );
  XOR2X1 U1106 ( .A(n629), .B(n677), .Y(n1205) );
  XNOR2X1 U1107 ( .A(n95), .B(n1129), .Y(product[44]) );
  AND2X2 U1108 ( .A(n94), .B(n91), .Y(n1129) );
  INVX2 U1109 ( .A(n9), .Y(n1255) );
  XNOR2X1 U1110 ( .A(n179), .B(n1011), .Y(product[36]) );
  XNOR2X1 U1111 ( .A(n163), .B(n1012), .Y(product[38]) );
  XNOR2X1 U1112 ( .A(n123), .B(n1130), .Y(product[42]) );
  AND2X2 U1113 ( .A(n122), .B(n1010), .Y(n1130) );
  INVX2 U1114 ( .A(n597), .Y(n1138) );
  XOR2X1 U1115 ( .A(n418), .B(n1131), .Y(n416) );
  NAND2X1 U1116 ( .A(n418), .B(n1190), .Y(n1132) );
  NAND2X1 U1117 ( .A(n418), .B(n420), .Y(n1133) );
  NAND2X1 U1118 ( .A(n1190), .B(n420), .Y(n1134) );
  NAND3X1 U1119 ( .A(n1133), .B(n1132), .C(n1134), .Y(n415) );
  NAND2X1 U1120 ( .A(n433), .B(n1188), .Y(n1135) );
  NAND2X1 U1121 ( .A(n433), .B(n1191), .Y(n1136) );
  NAND2X1 U1122 ( .A(n1188), .B(n1191), .Y(n1137) );
  NAND3X1 U1123 ( .A(n1136), .B(n1137), .C(n1135), .Y(n417) );
  XNOR2X1 U1124 ( .A(n1205), .B(n1138), .Y(n426) );
  XOR2X1 U1125 ( .A(n581), .B(n563), .Y(n1139) );
  XOR2X1 U1126 ( .A(n693), .B(n1139), .Y(n428) );
  NAND2X1 U1127 ( .A(n693), .B(n581), .Y(n1140) );
  NAND2X1 U1128 ( .A(n693), .B(n563), .Y(n1141) );
  NAND2X1 U1129 ( .A(n581), .B(n563), .Y(n1142) );
  NAND3X1 U1130 ( .A(n1141), .B(n1140), .C(n1142), .Y(n427) );
  NAND2X1 U1131 ( .A(n661), .B(n613), .Y(n1143) );
  NAND2X1 U1132 ( .A(n661), .B(n645), .Y(n1144) );
  NAND2X1 U1133 ( .A(n613), .B(n645), .Y(n1145) );
  NAND3X1 U1134 ( .A(n1144), .B(n1143), .C(n1145), .Y(n423) );
  NOR2X1 U1135 ( .A(n1264), .B(n814), .Y(n1146) );
  NOR2X1 U1136 ( .A(n1119), .B(n813), .Y(n1147) );
  OR2X2 U1137 ( .A(n1146), .B(n1147), .Y(n661) );
  XOR2X1 U1138 ( .A(n710), .B(n582), .Y(n1148) );
  XOR2X1 U1139 ( .A(n1148), .B(n1008), .Y(n442) );
  NAND2X1 U1140 ( .A(n694), .B(n710), .Y(n1149) );
  NAND2X1 U1141 ( .A(n694), .B(n582), .Y(n1150) );
  NAND2X1 U1142 ( .A(n710), .B(n582), .Y(n1151) );
  NAND3X1 U1143 ( .A(n1150), .B(n1149), .C(n1151), .Y(n441) );
  INVX4 U1144 ( .A(n1182), .Y(n1254) );
  XOR2X1 U1145 ( .A(n599), .B(n647), .Y(n1152) );
  XOR2X1 U1146 ( .A(n1152), .B(n695), .Y(n454) );
  NAND2X1 U1147 ( .A(n695), .B(n599), .Y(n1153) );
  NAND2X1 U1148 ( .A(n695), .B(n647), .Y(n1154) );
  NAND2X1 U1149 ( .A(n599), .B(n647), .Y(n1155) );
  NAND3X1 U1150 ( .A(n1154), .B(n1153), .C(n1155), .Y(n453) );
  NOR2X1 U1151 ( .A(n918), .B(n737), .Y(n1156) );
  INVX2 U1152 ( .A(n1181), .Y(n1265) );
  INVX8 U1153 ( .A(n1157), .Y(n1158) );
  NAND2X1 U1154 ( .A(n1165), .B(n1086), .Y(n1159) );
  INVX2 U1155 ( .A(n1185), .Y(n1280) );
  INVX2 U1156 ( .A(n283), .Y(n1160) );
  INVX1 U1157 ( .A(n166), .Y(n283) );
  OR2X2 U1158 ( .A(n1159), .B(n80), .Y(n1164) );
  OR2X2 U1159 ( .A(n322), .B(n329), .Y(n1165) );
  OR2X2 U1160 ( .A(n481), .B(n470), .Y(n1166) );
  OR2X2 U1161 ( .A(n302), .B(n307), .Y(n1169) );
  XOR2X1 U1162 ( .A(n1161), .B(n397), .Y(n380) );
  XOR2X1 U1163 ( .A(n626), .B(n399), .Y(n1161) );
  INVX4 U1164 ( .A(n1183), .Y(n1226) );
  AND2X1 U1165 ( .A(n572), .B(n725), .Y(n1180) );
  INVX8 U1166 ( .A(a[15]), .Y(n917) );
  INVX2 U1167 ( .A(n878), .Y(n1309) );
  INVX2 U1168 ( .A(n411), .Y(n1203) );
  AND2X2 U1169 ( .A(n481), .B(n470), .Y(n1167) );
  XNOR2X1 U1170 ( .A(n1168), .B(n342), .Y(n340) );
  XNOR2X1 U1171 ( .A(n353), .B(n351), .Y(n1168) );
  OR2X1 U1172 ( .A(n523), .B(n518), .Y(n1170) );
  AND2X2 U1173 ( .A(n491), .B(n482), .Y(n1171) );
  OR2X1 U1174 ( .A(n491), .B(n482), .Y(n1172) );
  AND2X2 U1175 ( .A(n523), .B(n518), .Y(n1173) );
  OR2X1 U1176 ( .A(n533), .B(n530), .Y(n1174) );
  OR2X1 U1177 ( .A(n539), .B(n538), .Y(n1175) );
  OR2X1 U1178 ( .A(n708), .B(n724), .Y(n1176) );
  AND2X2 U1179 ( .A(n708), .B(n724), .Y(n1177) );
  AND2X2 U1180 ( .A(n533), .B(n530), .Y(n1178) );
  AND2X2 U1181 ( .A(n539), .B(n538), .Y(n1179) );
  XNOR2X1 U1182 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1183 ( .A(n551), .Y(n637) );
  INVX2 U1184 ( .A(n545), .Y(n601) );
  INVX2 U1185 ( .A(n548), .Y(n619) );
  AND2X2 U1186 ( .A(n1085), .B(n1294), .Y(n359) );
  INVX2 U1187 ( .A(n883), .Y(n1299) );
  INVX2 U1188 ( .A(n884), .Y(n1297) );
  AND2X2 U1189 ( .A(n917), .B(n900), .Y(n1182) );
  AND2X2 U1190 ( .A(n9), .B(n899), .Y(n1183) );
  AND2X2 U1191 ( .A(n1278), .B(n893), .Y(n1185) );
  AND2X2 U1192 ( .A(n894), .B(n1274), .Y(n1186) );
  INVX1 U1193 ( .A(n210), .Y(n289) );
  INVX2 U1194 ( .A(n1184), .Y(n1268) );
  BUFX2 U1195 ( .A(n357), .Y(n1192) );
  INVX1 U1196 ( .A(n213), .Y(n212) );
  INVX1 U1197 ( .A(n200), .Y(n202) );
  INVX1 U1198 ( .A(n199), .Y(n201) );
  INVX1 U1199 ( .A(n205), .Y(n288) );
  INVX1 U1200 ( .A(n216), .Y(n290) );
  BUFX4 U1201 ( .A(n1330), .Y(n1196) );
  BUFX2 U1202 ( .A(n53), .Y(n1198) );
  BUFX4 U1203 ( .A(n24), .Y(n1200) );
  INVX2 U1204 ( .A(n24), .Y(n1263) );
  OR2X2 U1205 ( .A(n1201), .B(n1184), .Y(n36) );
  INVX2 U1206 ( .A(n1184), .Y(n1269) );
  INVX2 U1207 ( .A(n1058), .Y(n1245) );
  INVX8 U1208 ( .A(n1322), .Y(n1321) );
  INVX1 U1209 ( .A(n182), .Y(n285) );
  INVX1 U1210 ( .A(n1321), .Y(n1202) );
  INVX1 U1211 ( .A(n183), .Y(n181) );
  INVX1 U1212 ( .A(n172), .Y(n174) );
  XOR2X1 U1213 ( .A(a[15]), .B(n1), .Y(n900) );
  XOR2X1 U1214 ( .A(n1204), .B(n1203), .Y(n394) );
  XNOR2X1 U1215 ( .A(n413), .B(n400), .Y(n1204) );
  NAND2X1 U1216 ( .A(n1050), .B(n677), .Y(n1206) );
  NAND2X1 U1217 ( .A(n1050), .B(n597), .Y(n1207) );
  NAND2X1 U1218 ( .A(n677), .B(n597), .Y(n1208) );
  NAND3X1 U1219 ( .A(n1206), .B(n1207), .C(n1208), .Y(n425) );
  XOR2X1 U1220 ( .A(n427), .B(n414), .Y(n1209) );
  XOR2X1 U1221 ( .A(n1209), .B(n425), .Y(n408) );
  NAND2X1 U1222 ( .A(n427), .B(n414), .Y(n1210) );
  NAND2X1 U1223 ( .A(n427), .B(n425), .Y(n1211) );
  NAND2X1 U1224 ( .A(n414), .B(n425), .Y(n1212) );
  NAND3X1 U1225 ( .A(n1210), .B(n1211), .C(n1212), .Y(n407) );
  OR2X1 U1226 ( .A(n1061), .B(n784), .Y(n1213) );
  NAND2X1 U1227 ( .A(n1213), .B(n1214), .Y(n629) );
  XOR2X1 U1228 ( .A(n355), .B(n346), .Y(n1215) );
  XOR2X1 U1229 ( .A(n1215), .B(n344), .Y(n342) );
  NAND2X1 U1230 ( .A(n355), .B(n346), .Y(n1216) );
  NAND2X1 U1231 ( .A(n355), .B(n344), .Y(n1217) );
  NAND2X1 U1232 ( .A(n346), .B(n344), .Y(n1218) );
  NAND3X1 U1233 ( .A(n1216), .B(n1217), .C(n1218), .Y(n341) );
  NAND2X1 U1234 ( .A(n353), .B(n351), .Y(n1219) );
  NAND2X1 U1235 ( .A(n353), .B(n342), .Y(n1220) );
  NAND2X1 U1236 ( .A(n351), .B(n342), .Y(n1221) );
  NAND3X1 U1237 ( .A(n1219), .B(n1220), .C(n1221), .Y(n339) );
  XOR2X1 U1238 ( .A(n1192), .B(n623), .Y(n1222) );
  XOR2X1 U1239 ( .A(n348), .B(n1222), .Y(n344) );
  NAND2X1 U1240 ( .A(n348), .B(n1192), .Y(n1223) );
  NAND2X1 U1241 ( .A(n348), .B(n623), .Y(n1224) );
  NAND2X1 U1242 ( .A(n1192), .B(n623), .Y(n1225) );
  NAND3X1 U1243 ( .A(n1224), .B(n1223), .C(n1225), .Y(n343) );
  INVX1 U1244 ( .A(n1259), .Y(n558) );
  XOR2X1 U1245 ( .A(n628), .B(n676), .Y(n1227) );
  XOR2X1 U1246 ( .A(n596), .B(n1227), .Y(n412) );
  NAND2X1 U1247 ( .A(n628), .B(n676), .Y(n1228) );
  NAND2X1 U1248 ( .A(n628), .B(n596), .Y(n1229) );
  NAND2X1 U1249 ( .A(n676), .B(n596), .Y(n1230) );
  NAND3X1 U1250 ( .A(n1228), .B(n1229), .C(n1230), .Y(n411) );
  NAND2X1 U1251 ( .A(n413), .B(n400), .Y(n1231) );
  NAND2X1 U1252 ( .A(n413), .B(n1110), .Y(n1232) );
  NAND2X1 U1253 ( .A(n400), .B(n1110), .Y(n1233) );
  NAND3X1 U1254 ( .A(n1231), .B(n1232), .C(n1233), .Y(n393) );
  INVX4 U1255 ( .A(n1234), .Y(n1260) );
  AND2X2 U1256 ( .A(n898), .B(n1028), .Y(n1234) );
  AND2X2 U1257 ( .A(n898), .B(n1028), .Y(n1235) );
  XOR2X1 U1258 ( .A(n409), .B(n396), .Y(n1236) );
  XOR2X1 U1259 ( .A(n1236), .B(n398), .Y(n392) );
  NAND2X1 U1260 ( .A(n409), .B(n396), .Y(n1237) );
  NAND2X1 U1261 ( .A(n409), .B(n398), .Y(n1238) );
  NAND2X1 U1262 ( .A(n396), .B(n398), .Y(n1239) );
  NAND3X1 U1263 ( .A(n1237), .B(n1238), .C(n1239), .Y(n391) );
  XOR2X1 U1264 ( .A(n393), .B(n380), .Y(n1240) );
  XOR2X1 U1265 ( .A(n1240), .B(n391), .Y(n376) );
  NAND2X1 U1266 ( .A(n393), .B(n380), .Y(n1241) );
  NAND2X1 U1267 ( .A(n393), .B(n391), .Y(n1242) );
  NAND2X1 U1268 ( .A(n380), .B(n391), .Y(n1243) );
  NAND3X1 U1269 ( .A(n1241), .B(n1242), .C(n1243), .Y(n375) );
  INVX1 U1270 ( .A(n1051), .Y(n287) );
  AOI22X1 U1271 ( .A(n1255), .B(n1245), .C(n1183), .D(n1245), .Y(n1244) );
  INVX2 U1272 ( .A(n1183), .Y(n1257) );
  OR2X1 U1273 ( .A(n89), .B(n52), .Y(n1246) );
  NAND2X1 U1274 ( .A(n1246), .B(n90), .Y(n88) );
  XOR2X1 U1275 ( .A(n627), .B(n675), .Y(n1247) );
  XOR2X1 U1276 ( .A(n1247), .B(n595), .Y(n398) );
  NAND2X1 U1277 ( .A(n627), .B(n675), .Y(n1248) );
  NAND2X1 U1278 ( .A(n627), .B(n595), .Y(n1249) );
  NAND2X1 U1279 ( .A(n675), .B(n595), .Y(n1250) );
  NAND3X1 U1280 ( .A(n1248), .B(n1249), .C(n1250), .Y(n397) );
  NAND2X1 U1281 ( .A(n626), .B(n399), .Y(n1251) );
  NAND2X1 U1282 ( .A(n626), .B(n397), .Y(n1252) );
  NAND2X1 U1283 ( .A(n399), .B(n397), .Y(n1253) );
  NAND3X1 U1284 ( .A(n1251), .B(n1252), .C(n1253), .Y(n379) );
  INVX2 U1285 ( .A(n554), .Y(n655) );
  INVX2 U1286 ( .A(n557), .Y(n673) );
  INVX4 U1287 ( .A(n51), .Y(n1281) );
  INVX1 U1288 ( .A(n161), .Y(n282) );
  INVX1 U1289 ( .A(n1193), .Y(n156) );
  INVX8 U1290 ( .A(n1266), .Y(n1267) );
  INVX8 U1291 ( .A(n1281), .Y(n1282) );
  INVX8 U1292 ( .A(n1289), .Y(n1290) );
  INVX8 U1293 ( .A(n1291), .Y(n1292) );
  INVX8 U1294 ( .A(n1293), .Y(n1294) );
  INVX8 U1295 ( .A(n1295), .Y(n1296) );
  INVX8 U1296 ( .A(n1297), .Y(n1298) );
  INVX8 U1297 ( .A(n1303), .Y(n1304) );
  INVX8 U1298 ( .A(n1309), .Y(n1310) );
  INVX8 U1299 ( .A(n1313), .Y(n1315) );
  INVX8 U1300 ( .A(n1326), .Y(n1325) );
  INVX8 U1301 ( .A(n19), .Y(n1326) );
  INVX8 U1302 ( .A(n31), .Y(n1332) );
  INVX2 U1303 ( .A(n101), .Y(n99) );
  INVX2 U1304 ( .A(n94), .Y(n92) );
  INVX2 U1305 ( .A(n79), .Y(n77) );
  INVX2 U1306 ( .A(n1298), .Y(n733) );
  OAI22X1 U1307 ( .A(n1259), .B(n1324), .C(n1324), .D(n1260), .Y(n557) );
  OAI22X1 U1308 ( .A(n1120), .B(n1326), .C(n1200), .D(n1326), .Y(n554) );
  OAI22X1 U1309 ( .A(n1265), .B(n1067), .C(n1267), .D(n1066), .Y(n551) );
  OAI22X1 U1310 ( .A(n1268), .B(n1332), .C(n1271), .D(n1332), .Y(n548) );
  OAI22X1 U1311 ( .A(n1273), .B(n1334), .C(n1275), .D(n1334), .Y(n545) );
  OAI22X1 U1312 ( .A(n1082), .B(n918), .C(n1162), .D(n918), .Y(n542) );
  INVX2 U1313 ( .A(n359), .Y(n360) );
  INVX2 U1314 ( .A(n337), .Y(n338) );
  INVX2 U1315 ( .A(n319), .Y(n320) );
  INVX2 U1316 ( .A(n305), .Y(n306) );
  INVX2 U1317 ( .A(n295), .Y(n296) );
  INVX2 U1318 ( .A(n93), .Y(n91) );
  INVX2 U1319 ( .A(n84), .Y(n275) );
  INVX2 U1320 ( .A(n1199), .Y(n155) );
  INVX2 U1321 ( .A(n149), .Y(n151) );
  INVX2 U1322 ( .A(n144), .Y(n142) );
  INVX2 U1323 ( .A(n129), .Y(n127) );
  INVX2 U1324 ( .A(n122), .Y(n120) );
  INVX2 U1325 ( .A(n111), .Y(n109) );
  INVX2 U1326 ( .A(n105), .Y(n103) );
  INVX2 U1327 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n19, src1_data[14], 
        n14, src1_data[12], n23, n10, n7, n13, src1_data[7], n8, n15, n11, n9, 
        src1_data[2:1], n20}), .B({src2_data[16], src2_data[16], n3, 
        src2_data[14:13], n12, src2_data[11:1], n5}), .CI(1'b0), .DIFF(
        large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n19, src1_data[14], 
        n14, src1_data[12], n23, n10, n7, n13, src1_data[7], n8, n15, n11, n9, 
        src1_data[2:1], n20}), .B({src2_data[16], src2_data[16], n3, 
        src2_data[14:13], n12, src2_data[11], n4, src2_data[9:1], n21}), .CI(
        1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b({src2_data[15:1], n6}), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  BUFX4 U3 ( .A(src1_data[0]), .Y(n20) );
  BUFX2 U4 ( .A(src1_data[15]), .Y(n19) );
  INVX2 U6 ( .A(n22), .Y(n21) );
  INVX1 U7 ( .A(src1_data[10]), .Y(n1) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  BUFX2 U10 ( .A(src2_data[15]), .Y(n3) );
  BUFX2 U11 ( .A(src2_data[10]), .Y(n4) );
  INVX2 U12 ( .A(n22), .Y(n5) );
  INVX8 U13 ( .A(n22), .Y(n6) );
  BUFX2 U14 ( .A(src1_data[9]), .Y(n7) );
  INVX4 U15 ( .A(src2_data[0]), .Y(n22) );
  BUFX2 U16 ( .A(src1_data[6]), .Y(n8) );
  BUFX2 U17 ( .A(src1_data[3]), .Y(n9) );
  BUFX2 U18 ( .A(n2), .Y(n10) );
  BUFX2 U19 ( .A(src1_data[4]), .Y(n11) );
  BUFX2 U20 ( .A(src2_data[12]), .Y(n12) );
  BUFX2 U21 ( .A(src1_data[8]), .Y(n13) );
  BUFX2 U22 ( .A(src1_data[13]), .Y(n14) );
  BUFX2 U23 ( .A(src1_data[5]), .Y(n15) );
  INVX2 U24 ( .A(n67), .Y(n62) );
  AND2X2 U25 ( .A(n31), .B(n30), .Y(n16) );
  AND2X2 U26 ( .A(alu_op[1]), .B(n30), .Y(n17) );
  AND2X2 U27 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n18) );
  INVX1 U28 ( .A(src1_data[11]), .Y(n24) );
  INVX2 U29 ( .A(n24), .Y(n23) );
  INVX2 U30 ( .A(large_sum[16]), .Y(n66) );
  XOR2X1 U31 ( .A(n66), .B(large_sum[17]), .Y(n29) );
  INVX2 U32 ( .A(alu_op[1]), .Y(n31) );
  NAND2X1 U33 ( .A(alu_op[0]), .B(n31), .Y(n67) );
  INVX2 U34 ( .A(alu_op[0]), .Y(n30) );
  XOR2X1 U35 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n25) );
  AOI22X1 U36 ( .A(N26), .B(n18), .C(n17), .D(n25), .Y(n26) );
  OAI21X1 U37 ( .A(n29), .B(n67), .C(n26), .Y(overflow) );
  AOI22X1 U38 ( .A(n20), .B(n16), .C(full_mult[30]), .D(n18), .Y(n33) );
  AOI22X1 U39 ( .A(large_dif[0]), .B(n17), .C(large_sum[0]), .D(n62), .Y(n32)
         );
  NAND2X1 U40 ( .A(n33), .B(n32), .Y(result[0]) );
  AOI22X1 U41 ( .A(src1_data[1]), .B(n16), .C(full_mult[31]), .D(n18), .Y(n35)
         );
  AOI22X1 U42 ( .A(large_dif[1]), .B(n17), .C(large_sum[1]), .D(n62), .Y(n34)
         );
  NAND2X1 U43 ( .A(n35), .B(n34), .Y(result[1]) );
  AOI22X1 U44 ( .A(src1_data[2]), .B(n16), .C(full_mult[32]), .D(n18), .Y(n37)
         );
  AOI22X1 U45 ( .A(large_dif[2]), .B(n17), .C(large_sum[2]), .D(n62), .Y(n36)
         );
  NAND2X1 U46 ( .A(n37), .B(n36), .Y(result[2]) );
  AOI22X1 U47 ( .A(n9), .B(n16), .C(full_mult[33]), .D(n18), .Y(n39) );
  AOI22X1 U48 ( .A(large_dif[3]), .B(n17), .C(large_sum[3]), .D(n62), .Y(n38)
         );
  NAND2X1 U49 ( .A(n39), .B(n38), .Y(result[3]) );
  AOI22X1 U50 ( .A(n11), .B(n16), .C(full_mult[34]), .D(n18), .Y(n41) );
  AOI22X1 U51 ( .A(large_dif[4]), .B(n17), .C(large_sum[4]), .D(n62), .Y(n40)
         );
  NAND2X1 U52 ( .A(n41), .B(n40), .Y(result[4]) );
  AOI22X1 U53 ( .A(n15), .B(n16), .C(full_mult[35]), .D(n18), .Y(n43) );
  AOI22X1 U54 ( .A(large_dif[5]), .B(n17), .C(large_sum[5]), .D(n62), .Y(n42)
         );
  NAND2X1 U55 ( .A(n43), .B(n42), .Y(result[5]) );
  AOI22X1 U56 ( .A(n8), .B(n16), .C(full_mult[36]), .D(n18), .Y(n45) );
  AOI22X1 U57 ( .A(large_dif[6]), .B(n17), .C(large_sum[6]), .D(n62), .Y(n44)
         );
  NAND2X1 U58 ( .A(n45), .B(n44), .Y(result[6]) );
  AOI22X1 U59 ( .A(src1_data[7]), .B(n16), .C(full_mult[37]), .D(n18), .Y(n47)
         );
  AOI22X1 U60 ( .A(large_dif[7]), .B(n17), .C(large_sum[7]), .D(n62), .Y(n46)
         );
  NAND2X1 U61 ( .A(n46), .B(n47), .Y(result[7]) );
  AOI22X1 U62 ( .A(n13), .B(n16), .C(full_mult[38]), .D(n18), .Y(n49) );
  AOI22X1 U63 ( .A(large_dif[8]), .B(n17), .C(large_sum[8]), .D(n62), .Y(n48)
         );
  NAND2X1 U64 ( .A(n48), .B(n49), .Y(result[8]) );
  AOI22X1 U65 ( .A(n7), .B(n16), .C(full_mult[39]), .D(n18), .Y(n51) );
  AOI22X1 U66 ( .A(large_dif[9]), .B(n17), .C(large_sum[9]), .D(n62), .Y(n50)
         );
  NAND2X1 U67 ( .A(n50), .B(n51), .Y(result[9]) );
  AOI22X1 U68 ( .A(n10), .B(n16), .C(full_mult[40]), .D(n18), .Y(n53) );
  AOI22X1 U69 ( .A(large_dif[10]), .B(n17), .C(large_sum[10]), .D(n62), .Y(n52) );
  NAND2X1 U70 ( .A(n52), .B(n53), .Y(result[10]) );
  AOI22X1 U71 ( .A(n23), .B(n16), .C(full_mult[41]), .D(n18), .Y(n55) );
  AOI22X1 U72 ( .A(large_dif[11]), .B(n17), .C(large_sum[11]), .D(n62), .Y(n54) );
  NAND2X1 U73 ( .A(n55), .B(n54), .Y(result[11]) );
  AOI22X1 U74 ( .A(src1_data[12]), .B(n16), .C(full_mult[42]), .D(n18), .Y(n57) );
  AOI22X1 U75 ( .A(large_dif[12]), .B(n17), .C(large_sum[12]), .D(n62), .Y(n56) );
  NAND2X1 U76 ( .A(n56), .B(n57), .Y(result[12]) );
  AOI22X1 U77 ( .A(n14), .B(n16), .C(full_mult[43]), .D(n18), .Y(n59) );
  AOI22X1 U78 ( .A(large_dif[13]), .B(n17), .C(large_sum[13]), .D(n62), .Y(n58) );
  NAND2X1 U79 ( .A(n59), .B(n58), .Y(result[13]) );
  AOI22X1 U80 ( .A(src1_data[14]), .B(n16), .C(full_mult[44]), .D(n18), .Y(n61) );
  AOI22X1 U81 ( .A(large_dif[14]), .B(n17), .C(large_sum[14]), .D(n62), .Y(n60) );
  NAND2X1 U82 ( .A(n60), .B(n61), .Y(result[14]) );
  AOI22X1 U83 ( .A(n19), .B(n16), .C(full_mult[45]), .D(n18), .Y(n64) );
  AOI22X1 U84 ( .A(large_dif[15]), .B(n17), .C(large_sum[15]), .D(n62), .Y(n63) );
  NAND2X1 U85 ( .A(n64), .B(n63), .Y(result[15]) );
  AOI22X1 U86 ( .A(src1_data[16]), .B(n16), .C(large_dif[16]), .D(n17), .Y(n65) );
  OAI21X1 U87 ( .A(n67), .B(n66), .C(n65), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  INVX1 U6 ( .A(n20), .Y(n30) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX1 U11 ( .A(n18), .Y(n32) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n13), .Y(n42) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U31 ( .A(n14), .Y(n40) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n753), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n754), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n755), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n753), .Y(n10) );
  NOR2X1 U29 ( .A(n752), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n754), .B(n755), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n751), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n743, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, n701}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n744), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n743, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n744), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n742, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n745), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n743, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n745), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n742, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n746), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n742, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n746), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n742, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n747), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n743, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n747), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n742, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n748), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n743, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n748), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n742, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n749), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n743, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n749), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n742, n739, 
        n737, n735, n733, n729, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n750), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n742, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n750), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n742, n740, 
        n737, n735, n733, n730, n727, n725, n722, n719, n716, n713, n710, n707, 
        n704, w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n751), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n743, n739, 
        n737, n735, n732, n729, n727, n724, n721, n718, n715, n712, n709, n706, 
        n703, n701}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n267), .Y(r1_data[10]) );
  INVX4 U3 ( .A(n419), .Y(n64) );
  INVX4 U4 ( .A(n412), .Y(n72) );
  INVX4 U5 ( .A(n131), .Y(r1_data[2]) );
  INVX4 U31 ( .A(n403), .Y(n406) );
  INVX4 U32 ( .A(n96), .Y(n389) );
  INVX4 U33 ( .A(n680), .Y(n683) );
  INVX4 U34 ( .A(n434), .Y(n680) );
  INVX4 U35 ( .A(n677), .Y(n678) );
  INVX4 U36 ( .A(w_data[12]), .Y(n734) );
  INVX8 U37 ( .A(n692), .Y(n694) );
  INVX4 U38 ( .A(n439), .Y(n692) );
  INVX4 U39 ( .A(n392), .Y(n393) );
  INVX4 U40 ( .A(w_data[8]), .Y(n723) );
  INVX4 U41 ( .A(w_data[7]), .Y(n720) );
  INVX8 U42 ( .A(n404), .Y(n405) );
  BUFX4 U43 ( .A(n402), .Y(n404) );
  BUFX2 U44 ( .A(n685), .Y(n16) );
  BUFX2 U45 ( .A(n435), .Y(n50) );
  BUFX2 U46 ( .A(n402), .Y(n403) );
  INVX2 U47 ( .A(n438), .Y(n688) );
  INVX2 U48 ( .A(n148), .Y(r1_data[3]) );
  INVX2 U49 ( .A(n165), .Y(r1_data[4]) );
  INVX2 U50 ( .A(n199), .Y(r1_data[6]) );
  INVX2 U51 ( .A(n233), .Y(r1_data[8]) );
  INVX2 U52 ( .A(n106), .Y(n407) );
  BUFX2 U53 ( .A(n675), .Y(n677) );
  BUFX2 U54 ( .A(n73), .Y(n60) );
  INVX2 U55 ( .A(n352), .Y(r1_data[15]) );
  INVX2 U56 ( .A(n88), .Y(r1_data[0]) );
  INVX2 U57 ( .A(n250), .Y(r1_data[9]) );
  INVX2 U58 ( .A(n318), .Y(r1_data[13]) );
  BUFX4 U59 ( .A(N12), .Y(n1) );
  AND2X2 U60 ( .A(n69), .B(n70), .Y(r2_data[15]) );
  BUFX4 U61 ( .A(n672), .Y(n673) );
  INVX2 U62 ( .A(n673), .Y(n31) );
  INVX2 U63 ( .A(n674), .Y(n25) );
  INVX1 U64 ( .A(n673), .Y(n36) );
  INVX2 U65 ( .A(n673), .Y(n32) );
  NAND2X1 U66 ( .A(n668), .B(N14), .Y(n3) );
  NAND2X1 U67 ( .A(n667), .B(n4), .Y(n438) );
  INVX2 U68 ( .A(n3), .Y(n4) );
  BUFX2 U69 ( .A(n685), .Y(n14) );
  BUFX2 U70 ( .A(n685), .Y(n15) );
  BUFX2 U71 ( .A(n689), .Y(n17) );
  BUFX4 U72 ( .A(n689), .Y(n18) );
  INVX1 U73 ( .A(n672), .Y(n19) );
  INVX1 U74 ( .A(n672), .Y(n20) );
  INVX1 U75 ( .A(n672), .Y(n21) );
  INVX1 U76 ( .A(n672), .Y(n22) );
  INVX1 U77 ( .A(n672), .Y(n23) );
  INVX1 U78 ( .A(n672), .Y(n24) );
  INVX1 U79 ( .A(n674), .Y(n26) );
  INVX1 U80 ( .A(n674), .Y(n27) );
  INVX1 U81 ( .A(n674), .Y(n28) );
  INVX1 U82 ( .A(n674), .Y(n29) );
  INVX2 U83 ( .A(n674), .Y(n30) );
  INVX1 U84 ( .A(n673), .Y(n33) );
  INVX1 U85 ( .A(n673), .Y(n34) );
  INVX1 U86 ( .A(n673), .Y(n35) );
  INVX1 U87 ( .A(n432), .Y(n37) );
  INVX4 U88 ( .A(n432), .Y(n672) );
  BUFX2 U89 ( .A(n74), .Y(n38) );
  BUFX4 U90 ( .A(n74), .Y(n39) );
  INVX1 U91 ( .A(n80), .Y(n74) );
  AND2X1 U92 ( .A(N14), .B(N16), .Y(n62) );
  INVX2 U93 ( .A(n80), .Y(n73) );
  BUFX2 U94 ( .A(n73), .Y(n61) );
  BUFX2 U95 ( .A(n73), .Y(n41) );
  INVX1 U96 ( .A(N16), .Y(n668) );
  BUFX4 U97 ( .A(n687), .Y(n58) );
  BUFX2 U98 ( .A(n73), .Y(n40) );
  INVX2 U99 ( .A(n684), .Y(n42) );
  INVX2 U100 ( .A(n684), .Y(n43) );
  INVX2 U101 ( .A(n684), .Y(n44) );
  INVX2 U102 ( .A(n684), .Y(n45) );
  INVX2 U103 ( .A(n684), .Y(n46) );
  INVX2 U104 ( .A(n684), .Y(n47) );
  INVX1 U105 ( .A(n684), .Y(n48) );
  BUFX2 U106 ( .A(n435), .Y(n49) );
  BUFX2 U107 ( .A(n435), .Y(n51) );
  BUFX2 U108 ( .A(n435), .Y(n52) );
  BUFX2 U109 ( .A(n435), .Y(n53) );
  BUFX2 U110 ( .A(n435), .Y(n54) );
  BUFX2 U111 ( .A(n435), .Y(n55) );
  BUFX2 U112 ( .A(n687), .Y(n56) );
  BUFX4 U113 ( .A(n687), .Y(n57) );
  BUFX2 U114 ( .A(n73), .Y(n59) );
  INVX2 U115 ( .A(n95), .Y(n386) );
  INVX2 U116 ( .A(n699), .Y(n698) );
  INVX4 U117 ( .A(n407), .Y(n409) );
  INVX2 U118 ( .A(n419), .Y(n400) );
  INVX2 U119 ( .A(n392), .Y(n395) );
  INVX2 U120 ( .A(n97), .Y(n392) );
  INVX2 U121 ( .A(n389), .Y(n390) );
  INVX1 U122 ( .A(n403), .Y(n63) );
  NAND2X1 U123 ( .A(n667), .B(n62), .Y(n439) );
  INVX4 U124 ( .A(n396), .Y(n398) );
  INVX2 U125 ( .A(n182), .Y(r1_data[5]) );
  INVX8 U126 ( .A(n389), .Y(n391) );
  BUFX2 U127 ( .A(n102), .Y(n65) );
  INVX4 U128 ( .A(n392), .Y(n394) );
  INVX4 U129 ( .A(n335), .Y(r1_data[14]) );
  INVX2 U130 ( .A(n369), .Y(n102) );
  INVX2 U131 ( .A(n102), .Y(n399) );
  INVX8 U132 ( .A(n676), .Y(n679) );
  BUFX4 U133 ( .A(n79), .Y(n411) );
  MUX2X1 U134 ( .B(n461), .A(n460), .S(n699), .Y(r2_data[2]) );
  AND2X2 U135 ( .A(N14), .B(N15), .Y(n81) );
  NAND2X1 U136 ( .A(n65), .B(n328), .Y(n66) );
  AND2X1 U137 ( .A(n87), .B(n66), .Y(n327) );
  INVX1 U138 ( .A(n407), .Y(n410) );
  INVX4 U139 ( .A(n216), .Y(r1_data[7]) );
  INVX4 U140 ( .A(n692), .Y(n71) );
  INVX4 U141 ( .A(n396), .Y(n75) );
  INVX4 U142 ( .A(n396), .Y(n397) );
  INVX4 U143 ( .A(n412), .Y(n413) );
  BUFX4 U144 ( .A(n79), .Y(n412) );
  INVX4 U145 ( .A(n114), .Y(r1_data[1]) );
  INVX8 U146 ( .A(n399), .Y(n401) );
  INVX4 U147 ( .A(n301), .Y(r1_data[12]) );
  INVX2 U148 ( .A(n680), .Y(n67) );
  INVX4 U149 ( .A(n407), .Y(n408) );
  INVX2 U150 ( .A(n78), .Y(n68) );
  NAND2X1 U151 ( .A(n642), .B(n699), .Y(n69) );
  NAND2X1 U152 ( .A(n643), .B(n698), .Y(n70) );
  INVX2 U153 ( .A(n688), .Y(n77) );
  INVX4 U154 ( .A(n100), .Y(n396) );
  INVX2 U155 ( .A(n688), .Y(n76) );
  INVX8 U156 ( .A(n411), .Y(n414) );
  INVX2 U157 ( .A(n78), .Y(n686) );
  INVX8 U158 ( .A(n386), .Y(n388) );
  AND2X2 U159 ( .A(N16), .B(n81), .Y(n80) );
  INVX2 U160 ( .A(n435), .Y(n684) );
  INVX2 U161 ( .A(N17), .Y(n699) );
  INVX2 U162 ( .A(w_data[3]), .Y(n708) );
  INVX2 U163 ( .A(w_data[2]), .Y(n705) );
  INVX2 U164 ( .A(w_data[4]), .Y(n711) );
  INVX2 U165 ( .A(w_data[5]), .Y(n714) );
  INVX2 U166 ( .A(w_data[1]), .Y(n702) );
  INVX2 U167 ( .A(w_data[0]), .Y(n700) );
  INVX2 U168 ( .A(n78), .Y(n687) );
  BUFX2 U169 ( .A(n675), .Y(n676) );
  INVX2 U170 ( .A(n78), .Y(n685) );
  AND2X2 U171 ( .A(n81), .B(n668), .Y(n78) );
  INVX2 U172 ( .A(n80), .Y(n695) );
  INVX2 U173 ( .A(n680), .Y(n682) );
  INVX2 U174 ( .A(n692), .Y(n693) );
  INVX2 U175 ( .A(n688), .Y(n691) );
  INVX2 U176 ( .A(n688), .Y(n690) );
  INVX2 U177 ( .A(n80), .Y(n696) );
  INVX2 U178 ( .A(n688), .Y(n689) );
  INVX2 U179 ( .A(n433), .Y(n675) );
  INVX2 U180 ( .A(n680), .Y(n681) );
  AND2X2 U181 ( .A(n384), .B(n380), .Y(n79) );
  INVX2 U182 ( .A(n699), .Y(n697) );
  INVX4 U183 ( .A(n741), .Y(n742) );
  INVX4 U184 ( .A(n731), .Y(n733) );
  INVX4 U185 ( .A(n720), .Y(n722) );
  INVX4 U186 ( .A(n723), .Y(n725) );
  INVX4 U187 ( .A(n717), .Y(n719) );
  INVX4 U188 ( .A(n731), .Y(n732) );
  INVX4 U189 ( .A(n720), .Y(n721) );
  INVX4 U190 ( .A(n723), .Y(n724) );
  INVX4 U191 ( .A(n717), .Y(n718) );
  INVX4 U192 ( .A(n741), .Y(n743) );
  INVX2 U193 ( .A(n708), .Y(n710) );
  INVX2 U194 ( .A(n705), .Y(n707) );
  INVX2 U195 ( .A(n708), .Y(n709) );
  INVX2 U196 ( .A(n705), .Y(n706) );
  INVX2 U197 ( .A(n711), .Y(n713) );
  INVX2 U198 ( .A(n711), .Y(n712) );
  INVX2 U199 ( .A(n714), .Y(n716) );
  INVX2 U200 ( .A(n714), .Y(n715) );
  INVX2 U201 ( .A(n702), .Y(n704) );
  INVX2 U202 ( .A(n702), .Y(n703) );
  INVX2 U203 ( .A(n700), .Y(n701) );
  OR2X1 U204 ( .A(\regs_matrix[3][11] ), .B(n413), .Y(n417) );
  BUFX2 U205 ( .A(n_reset), .Y(n744) );
  BUFX2 U206 ( .A(n_reset), .Y(n745) );
  BUFX2 U207 ( .A(n_reset), .Y(n746) );
  BUFX2 U208 ( .A(n_reset), .Y(n747) );
  BUFX2 U209 ( .A(n_reset), .Y(n748) );
  BUFX2 U210 ( .A(n_reset), .Y(n749) );
  BUFX2 U211 ( .A(n_reset), .Y(n750) );
  BUFX2 U212 ( .A(n_reset), .Y(n751) );
  AOI22X1 U213 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n86) );
  INVX2 U214 ( .A(N13), .Y(n87) );
  INVX2 U215 ( .A(n86), .Y(r1_data[16]) );
  AOI22X1 U216 ( .A(n89), .B(n90), .C(n91), .D(n92), .Y(n88) );
  NOR2X1 U217 ( .A(n93), .B(n94), .Y(n92) );
  OAI22X1 U218 ( .A(\regs_matrix[6][0] ), .B(n387), .C(outreg_data[0]), .D(
        n391), .Y(n94) );
  OAI21X1 U219 ( .A(\regs_matrix[4][0] ), .B(n393), .C(n87), .Y(n93) );
  NOR2X1 U220 ( .A(n98), .B(n99), .Y(n91) );
  OAI21X1 U221 ( .A(\regs_matrix[7][0] ), .B(n75), .C(n101), .Y(n99) );
  AOI22X1 U222 ( .A(n401), .B(n103), .C(n412), .D(n104), .Y(n101) );
  INVX2 U223 ( .A(\regs_matrix[3][0] ), .Y(n104) );
  INVX2 U224 ( .A(\regs_matrix[1][0] ), .Y(n103) );
  OAI22X1 U225 ( .A(\regs_matrix[2][0] ), .B(n405), .C(\regs_matrix[5][0] ), 
        .D(n408), .Y(n98) );
  NOR2X1 U226 ( .A(n107), .B(n108), .Y(n90) );
  OAI22X1 U227 ( .A(\regs_matrix[14][0] ), .B(n387), .C(\regs_matrix[8][0] ), 
        .D(n390), .Y(n108) );
  OAI21X1 U228 ( .A(\regs_matrix[12][0] ), .B(n395), .C(N13), .Y(n107) );
  NOR2X1 U229 ( .A(n109), .B(n110), .Y(n89) );
  OAI21X1 U230 ( .A(\regs_matrix[15][0] ), .B(n75), .C(n111), .Y(n110) );
  AOI22X1 U231 ( .A(n400), .B(n112), .C(n411), .D(n113), .Y(n111) );
  INVX2 U232 ( .A(\regs_matrix[11][0] ), .Y(n113) );
  INVX2 U233 ( .A(\regs_matrix[9][0] ), .Y(n112) );
  OAI22X1 U234 ( .A(\regs_matrix[10][0] ), .B(n405), .C(\regs_matrix[13][0] ), 
        .D(n410), .Y(n109) );
  AOI22X1 U235 ( .A(n115), .B(n116), .C(n117), .D(n118), .Y(n114) );
  NOR2X1 U236 ( .A(n119), .B(n120), .Y(n118) );
  OAI22X1 U237 ( .A(outreg_data[1]), .B(n391), .C(\regs_matrix[2][1] ), .D(
        n406), .Y(n120) );
  OAI22X1 U238 ( .A(\regs_matrix[4][1] ), .B(n394), .C(\regs_matrix[6][1] ), 
        .D(n387), .Y(n119) );
  NOR2X1 U239 ( .A(n122), .B(n121), .Y(n117) );
  OAI21X1 U240 ( .A(\regs_matrix[3][1] ), .B(n413), .C(n123), .Y(n122) );
  AOI21X1 U241 ( .A(n65), .B(n124), .C(N13), .Y(n123) );
  INVX2 U242 ( .A(\regs_matrix[1][1] ), .Y(n124) );
  OAI22X1 U243 ( .A(\regs_matrix[5][1] ), .B(n409), .C(\regs_matrix[7][1] ), 
        .D(n398), .Y(n121) );
  NOR2X1 U244 ( .A(n125), .B(n126), .Y(n116) );
  OAI22X1 U245 ( .A(\regs_matrix[8][1] ), .B(n390), .C(\regs_matrix[10][1] ), 
        .D(n63), .Y(n126) );
  OAI22X1 U246 ( .A(\regs_matrix[12][1] ), .B(n395), .C(\regs_matrix[14][1] ), 
        .D(n387), .Y(n125) );
  NOR2X1 U247 ( .A(n127), .B(n128), .Y(n115) );
  OAI21X1 U248 ( .A(\regs_matrix[11][1] ), .B(n414), .C(n129), .Y(n128) );
  AOI21X1 U249 ( .A(n400), .B(n130), .C(n87), .Y(n129) );
  INVX2 U250 ( .A(\regs_matrix[9][1] ), .Y(n130) );
  OAI22X1 U251 ( .A(\regs_matrix[13][1] ), .B(n408), .C(\regs_matrix[15][1] ), 
        .D(n397), .Y(n127) );
  AOI22X1 U252 ( .A(n132), .B(n133), .C(n134), .D(n135), .Y(n131) );
  NOR2X1 U253 ( .A(n136), .B(n137), .Y(n135) );
  OAI22X1 U254 ( .A(outreg_data[2]), .B(n391), .C(\regs_matrix[2][2] ), .D(
        n406), .Y(n137) );
  OAI22X1 U255 ( .A(\regs_matrix[4][2] ), .B(n393), .C(\regs_matrix[6][2] ), 
        .D(n387), .Y(n136) );
  NOR2X1 U256 ( .A(n138), .B(n139), .Y(n134) );
  OAI21X1 U257 ( .A(\regs_matrix[3][2] ), .B(n414), .C(n140), .Y(n139) );
  AOI21X1 U258 ( .A(n401), .B(n141), .C(N13), .Y(n140) );
  INVX2 U259 ( .A(\regs_matrix[1][2] ), .Y(n141) );
  OAI22X1 U260 ( .A(\regs_matrix[5][2] ), .B(n409), .C(\regs_matrix[7][2] ), 
        .D(n397), .Y(n138) );
  NOR2X1 U261 ( .A(n142), .B(n143), .Y(n133) );
  OAI22X1 U262 ( .A(\regs_matrix[8][2] ), .B(n390), .C(\regs_matrix[10][2] ), 
        .D(n63), .Y(n143) );
  OAI22X1 U263 ( .A(\regs_matrix[12][2] ), .B(n395), .C(\regs_matrix[14][2] ), 
        .D(n387), .Y(n142) );
  NOR2X1 U264 ( .A(n144), .B(n145), .Y(n132) );
  OAI21X1 U265 ( .A(\regs_matrix[11][2] ), .B(n414), .C(n146), .Y(n145) );
  AOI21X1 U266 ( .A(n400), .B(n147), .C(n87), .Y(n146) );
  INVX2 U267 ( .A(\regs_matrix[9][2] ), .Y(n147) );
  OAI22X1 U268 ( .A(\regs_matrix[13][2] ), .B(n410), .C(\regs_matrix[15][2] ), 
        .D(n75), .Y(n144) );
  AOI22X1 U269 ( .A(n149), .B(n150), .C(n151), .D(n152), .Y(n148) );
  NOR2X1 U270 ( .A(n153), .B(n154), .Y(n152) );
  OAI22X1 U271 ( .A(outreg_data[3]), .B(n391), .C(\regs_matrix[2][3] ), .D(
        n406), .Y(n154) );
  OAI22X1 U272 ( .A(\regs_matrix[4][3] ), .B(n394), .C(\regs_matrix[6][3] ), 
        .D(n387), .Y(n153) );
  NOR2X1 U273 ( .A(n155), .B(n156), .Y(n151) );
  OAI21X1 U274 ( .A(\regs_matrix[3][3] ), .B(n414), .C(n157), .Y(n156) );
  AOI21X1 U275 ( .A(n401), .B(n158), .C(N13), .Y(n157) );
  INVX2 U276 ( .A(\regs_matrix[1][3] ), .Y(n158) );
  OAI22X1 U277 ( .A(\regs_matrix[5][3] ), .B(n409), .C(\regs_matrix[7][3] ), 
        .D(n397), .Y(n155) );
  NOR2X1 U278 ( .A(n159), .B(n160), .Y(n150) );
  OAI22X1 U279 ( .A(\regs_matrix[8][3] ), .B(n390), .C(\regs_matrix[10][3] ), 
        .D(n63), .Y(n160) );
  OAI22X1 U280 ( .A(\regs_matrix[12][3] ), .B(n395), .C(\regs_matrix[14][3] ), 
        .D(n387), .Y(n159) );
  NOR2X1 U281 ( .A(n161), .B(n162), .Y(n149) );
  OAI21X1 U282 ( .A(\regs_matrix[11][3] ), .B(n414), .C(n163), .Y(n162) );
  AOI21X1 U283 ( .A(n400), .B(n164), .C(n87), .Y(n163) );
  INVX2 U284 ( .A(\regs_matrix[9][3] ), .Y(n164) );
  OAI22X1 U285 ( .A(\regs_matrix[13][3] ), .B(n410), .C(\regs_matrix[15][3] ), 
        .D(n75), .Y(n161) );
  AOI22X1 U286 ( .A(n166), .B(n167), .C(n168), .D(n169), .Y(n165) );
  NOR2X1 U287 ( .A(n170), .B(n171), .Y(n169) );
  OAI22X1 U288 ( .A(outreg_data[4]), .B(n391), .C(\regs_matrix[2][4] ), .D(
        n405), .Y(n171) );
  OAI22X1 U289 ( .A(\regs_matrix[4][4] ), .B(n393), .C(\regs_matrix[6][4] ), 
        .D(n387), .Y(n170) );
  NOR2X1 U290 ( .A(n172), .B(n173), .Y(n168) );
  OAI21X1 U291 ( .A(\regs_matrix[3][4] ), .B(n414), .C(n174), .Y(n173) );
  AOI21X1 U292 ( .A(n401), .B(n175), .C(N13), .Y(n174) );
  INVX2 U293 ( .A(\regs_matrix[1][4] ), .Y(n175) );
  OAI22X1 U294 ( .A(\regs_matrix[5][4] ), .B(n409), .C(\regs_matrix[7][4] ), 
        .D(n75), .Y(n172) );
  NOR2X1 U295 ( .A(n176), .B(n177), .Y(n167) );
  OAI22X1 U296 ( .A(\regs_matrix[8][4] ), .B(n390), .C(\regs_matrix[10][4] ), 
        .D(n63), .Y(n177) );
  OAI22X1 U297 ( .A(\regs_matrix[12][4] ), .B(n395), .C(\regs_matrix[14][4] ), 
        .D(n387), .Y(n176) );
  NOR2X1 U298 ( .A(n178), .B(n179), .Y(n166) );
  OAI21X1 U299 ( .A(\regs_matrix[11][4] ), .B(n414), .C(n180), .Y(n179) );
  AOI21X1 U300 ( .A(n400), .B(n181), .C(n87), .Y(n180) );
  INVX2 U301 ( .A(\regs_matrix[9][4] ), .Y(n181) );
  OAI22X1 U302 ( .A(\regs_matrix[13][4] ), .B(n408), .C(\regs_matrix[15][4] ), 
        .D(n397), .Y(n178) );
  AOI22X1 U303 ( .A(n183), .B(n184), .C(n185), .D(n186), .Y(n182) );
  NOR2X1 U304 ( .A(n187), .B(n188), .Y(n186) );
  OAI22X1 U305 ( .A(outreg_data[5]), .B(n391), .C(\regs_matrix[2][5] ), .D(
        n406), .Y(n188) );
  OAI22X1 U306 ( .A(\regs_matrix[4][5] ), .B(n394), .C(\regs_matrix[6][5] ), 
        .D(n388), .Y(n187) );
  NOR2X1 U307 ( .A(n189), .B(n190), .Y(n185) );
  OAI21X1 U308 ( .A(\regs_matrix[3][5] ), .B(n413), .C(n191), .Y(n190) );
  AOI21X1 U309 ( .A(n192), .B(n65), .C(N13), .Y(n191) );
  INVX2 U310 ( .A(\regs_matrix[1][5] ), .Y(n192) );
  OAI22X1 U311 ( .A(\regs_matrix[5][5] ), .B(n409), .C(\regs_matrix[7][5] ), 
        .D(n398), .Y(n189) );
  NOR2X1 U312 ( .A(n193), .B(n194), .Y(n184) );
  OAI22X1 U313 ( .A(\regs_matrix[8][5] ), .B(n390), .C(\regs_matrix[10][5] ), 
        .D(n63), .Y(n194) );
  OAI22X1 U314 ( .A(\regs_matrix[12][5] ), .B(n395), .C(\regs_matrix[14][5] ), 
        .D(n388), .Y(n193) );
  NOR2X1 U315 ( .A(n195), .B(n196), .Y(n183) );
  OAI21X1 U316 ( .A(\regs_matrix[11][5] ), .B(n414), .C(n197), .Y(n196) );
  AOI21X1 U317 ( .A(n400), .B(n198), .C(n87), .Y(n197) );
  INVX2 U318 ( .A(\regs_matrix[9][5] ), .Y(n198) );
  OAI22X1 U319 ( .A(\regs_matrix[13][5] ), .B(n408), .C(\regs_matrix[15][5] ), 
        .D(n397), .Y(n195) );
  AOI22X1 U320 ( .A(n200), .B(n201), .C(n202), .D(n203), .Y(n199) );
  NOR2X1 U321 ( .A(n204), .B(n205), .Y(n203) );
  OAI22X1 U322 ( .A(outreg_data[6]), .B(n391), .C(\regs_matrix[2][6] ), .D(
        n406), .Y(n205) );
  OAI22X1 U323 ( .A(\regs_matrix[4][6] ), .B(n394), .C(\regs_matrix[6][6] ), 
        .D(n388), .Y(n204) );
  NOR2X1 U324 ( .A(n206), .B(n207), .Y(n202) );
  OAI21X1 U325 ( .A(\regs_matrix[3][6] ), .B(n414), .C(n208), .Y(n207) );
  AOI21X1 U326 ( .A(n401), .B(n209), .C(N13), .Y(n208) );
  INVX2 U327 ( .A(\regs_matrix[1][6] ), .Y(n209) );
  OAI22X1 U328 ( .A(\regs_matrix[5][6] ), .B(n408), .C(\regs_matrix[7][6] ), 
        .D(n398), .Y(n206) );
  NOR2X1 U329 ( .A(n210), .B(n211), .Y(n201) );
  OAI22X1 U330 ( .A(\regs_matrix[8][6] ), .B(n390), .C(\regs_matrix[10][6] ), 
        .D(n63), .Y(n211) );
  OAI22X1 U331 ( .A(\regs_matrix[12][6] ), .B(n395), .C(\regs_matrix[14][6] ), 
        .D(n388), .Y(n210) );
  NOR2X1 U332 ( .A(n212), .B(n213), .Y(n200) );
  OAI21X1 U333 ( .A(\regs_matrix[11][6] ), .B(n414), .C(n214), .Y(n213) );
  AOI21X1 U334 ( .A(n400), .B(n215), .C(n87), .Y(n214) );
  INVX2 U335 ( .A(\regs_matrix[9][6] ), .Y(n215) );
  OAI22X1 U336 ( .A(\regs_matrix[13][6] ), .B(n408), .C(\regs_matrix[15][6] ), 
        .D(n397), .Y(n212) );
  AOI22X1 U337 ( .A(n217), .B(n218), .C(n219), .D(n220), .Y(n216) );
  NOR2X1 U338 ( .A(n221), .B(n222), .Y(n220) );
  OAI22X1 U339 ( .A(outreg_data[7]), .B(n391), .C(\regs_matrix[2][7] ), .D(
        n406), .Y(n222) );
  OAI22X1 U340 ( .A(\regs_matrix[4][7] ), .B(n394), .C(\regs_matrix[6][7] ), 
        .D(n388), .Y(n221) );
  NOR2X1 U341 ( .A(n223), .B(n224), .Y(n219) );
  OAI21X1 U342 ( .A(\regs_matrix[3][7] ), .B(n414), .C(n225), .Y(n224) );
  AOI21X1 U343 ( .A(n64), .B(n226), .C(N13), .Y(n225) );
  INVX2 U344 ( .A(\regs_matrix[1][7] ), .Y(n226) );
  OAI22X1 U345 ( .A(\regs_matrix[5][7] ), .B(n408), .C(\regs_matrix[7][7] ), 
        .D(n398), .Y(n223) );
  NOR2X1 U346 ( .A(n227), .B(n228), .Y(n218) );
  OAI22X1 U347 ( .A(\regs_matrix[8][7] ), .B(n390), .C(\regs_matrix[10][7] ), 
        .D(n63), .Y(n228) );
  OAI22X1 U348 ( .A(\regs_matrix[12][7] ), .B(n395), .C(\regs_matrix[14][7] ), 
        .D(n388), .Y(n227) );
  NOR2X1 U349 ( .A(n229), .B(n230), .Y(n217) );
  OAI21X1 U350 ( .A(\regs_matrix[11][7] ), .B(n418), .C(n231), .Y(n230) );
  AOI21X1 U351 ( .A(n400), .B(n232), .C(n87), .Y(n231) );
  INVX2 U352 ( .A(\regs_matrix[9][7] ), .Y(n232) );
  OAI22X1 U353 ( .A(\regs_matrix[13][7] ), .B(n410), .C(\regs_matrix[15][7] ), 
        .D(n75), .Y(n229) );
  AOI22X1 U354 ( .A(n234), .B(n235), .C(n236), .D(n237), .Y(n233) );
  NOR2X1 U355 ( .A(n238), .B(n239), .Y(n237) );
  OAI22X1 U356 ( .A(outreg_data[8]), .B(n391), .C(\regs_matrix[2][8] ), .D(
        n405), .Y(n239) );
  OAI22X1 U357 ( .A(\regs_matrix[4][8] ), .B(n393), .C(\regs_matrix[6][8] ), 
        .D(n388), .Y(n238) );
  NOR2X1 U358 ( .A(n240), .B(n241), .Y(n236) );
  OAI21X1 U359 ( .A(\regs_matrix[3][8] ), .B(n72), .C(n242), .Y(n241) );
  AOI21X1 U360 ( .A(n401), .B(n243), .C(N13), .Y(n242) );
  INVX2 U361 ( .A(\regs_matrix[1][8] ), .Y(n243) );
  OAI22X1 U362 ( .A(\regs_matrix[5][8] ), .B(n408), .C(\regs_matrix[7][8] ), 
        .D(n397), .Y(n240) );
  NOR2X1 U363 ( .A(n244), .B(n245), .Y(n235) );
  OAI22X1 U364 ( .A(\regs_matrix[8][8] ), .B(n390), .C(\regs_matrix[10][8] ), 
        .D(n63), .Y(n245) );
  OAI22X1 U365 ( .A(\regs_matrix[12][8] ), .B(n395), .C(\regs_matrix[14][8] ), 
        .D(n388), .Y(n244) );
  NOR2X1 U366 ( .A(n246), .B(n247), .Y(n234) );
  OAI21X1 U367 ( .A(\regs_matrix[11][8] ), .B(n418), .C(n248), .Y(n247) );
  AOI21X1 U368 ( .A(n400), .B(n249), .C(n87), .Y(n248) );
  INVX2 U369 ( .A(\regs_matrix[9][8] ), .Y(n249) );
  OAI22X1 U370 ( .A(\regs_matrix[13][8] ), .B(n410), .C(\regs_matrix[15][8] ), 
        .D(n397), .Y(n246) );
  AOI22X1 U371 ( .A(n251), .B(n252), .C(n253), .D(n254), .Y(n250) );
  NOR2X1 U372 ( .A(n255), .B(n256), .Y(n254) );
  OAI22X1 U373 ( .A(outreg_data[9]), .B(n391), .C(\regs_matrix[2][9] ), .D(
        n405), .Y(n256) );
  OAI22X1 U374 ( .A(\regs_matrix[4][9] ), .B(n394), .C(\regs_matrix[6][9] ), 
        .D(n388), .Y(n255) );
  NOR2X1 U375 ( .A(n257), .B(n258), .Y(n253) );
  AOI21X1 U376 ( .A(n401), .B(n260), .C(N13), .Y(n259) );
  INVX2 U377 ( .A(\regs_matrix[1][9] ), .Y(n260) );
  OAI22X1 U378 ( .A(\regs_matrix[5][9] ), .B(n409), .C(\regs_matrix[7][9] ), 
        .D(n398), .Y(n257) );
  NOR2X1 U379 ( .A(n261), .B(n262), .Y(n252) );
  OAI22X1 U380 ( .A(\regs_matrix[8][9] ), .B(n390), .C(\regs_matrix[10][9] ), 
        .D(n63), .Y(n262) );
  OAI22X1 U381 ( .A(\regs_matrix[12][9] ), .B(n395), .C(\regs_matrix[14][9] ), 
        .D(n388), .Y(n261) );
  NOR2X1 U382 ( .A(n263), .B(n264), .Y(n251) );
  OAI21X1 U383 ( .A(\regs_matrix[11][9] ), .B(n418), .C(n265), .Y(n264) );
  AOI21X1 U384 ( .A(n400), .B(n266), .C(n87), .Y(n265) );
  INVX2 U385 ( .A(\regs_matrix[9][9] ), .Y(n266) );
  OAI22X1 U386 ( .A(\regs_matrix[13][9] ), .B(n410), .C(\regs_matrix[15][9] ), 
        .D(n75), .Y(n263) );
  AOI22X1 U387 ( .A(n268), .B(n269), .C(n270), .D(n271), .Y(n267) );
  NOR2X1 U388 ( .A(n272), .B(n273), .Y(n271) );
  OAI22X1 U389 ( .A(outreg_data[10]), .B(n391), .C(\regs_matrix[2][10] ), .D(
        n405), .Y(n273) );
  OAI22X1 U390 ( .A(\regs_matrix[4][10] ), .B(n393), .C(\regs_matrix[6][10] ), 
        .D(n388), .Y(n272) );
  NOR2X1 U391 ( .A(n274), .B(n275), .Y(n270) );
  OAI21X1 U392 ( .A(\regs_matrix[3][10] ), .B(n72), .C(n276), .Y(n275) );
  AOI21X1 U393 ( .A(n401), .B(n277), .C(N13), .Y(n276) );
  INVX2 U394 ( .A(\regs_matrix[1][10] ), .Y(n277) );
  OAI22X1 U395 ( .A(\regs_matrix[5][10] ), .B(n409), .C(\regs_matrix[7][10] ), 
        .D(n397), .Y(n274) );
  NOR2X1 U396 ( .A(n278), .B(n279), .Y(n269) );
  OAI22X1 U397 ( .A(\regs_matrix[8][10] ), .B(n390), .C(\regs_matrix[10][10] ), 
        .D(n63), .Y(n279) );
  OAI22X1 U398 ( .A(\regs_matrix[12][10] ), .B(n395), .C(\regs_matrix[14][10] ), .D(n388), .Y(n278) );
  NOR2X1 U399 ( .A(n280), .B(n281), .Y(n268) );
  OAI21X1 U400 ( .A(\regs_matrix[11][10] ), .B(n418), .C(n282), .Y(n281) );
  AOI21X1 U401 ( .A(n400), .B(n283), .C(n87), .Y(n282) );
  INVX2 U402 ( .A(\regs_matrix[9][10] ), .Y(n283) );
  OAI22X1 U403 ( .A(\regs_matrix[13][10] ), .B(n410), .C(\regs_matrix[15][10] ), .D(n75), .Y(n280) );
  AOI22X1 U404 ( .A(n285), .B(n286), .C(n287), .D(n288), .Y(n284) );
  NOR2X1 U405 ( .A(n289), .B(n290), .Y(n288) );
  OAI22X1 U406 ( .A(outreg_data[11]), .B(n391), .C(\regs_matrix[2][11] ), .D(
        n405), .Y(n290) );
  OAI22X1 U407 ( .A(\regs_matrix[4][11] ), .B(n394), .C(\regs_matrix[6][11] ), 
        .D(n388), .Y(n289) );
  NOR2X1 U408 ( .A(n291), .B(n292), .Y(n287) );
  AOI21X1 U409 ( .A(n64), .B(n294), .C(N13), .Y(n293) );
  INVX2 U410 ( .A(\regs_matrix[1][11] ), .Y(n294) );
  OAI22X1 U411 ( .A(\regs_matrix[5][11] ), .B(n409), .C(\regs_matrix[7][11] ), 
        .D(n75), .Y(n291) );
  NOR2X1 U412 ( .A(n295), .B(n296), .Y(n286) );
  OAI22X1 U413 ( .A(\regs_matrix[8][11] ), .B(n390), .C(\regs_matrix[10][11] ), 
        .D(n63), .Y(n296) );
  OAI22X1 U414 ( .A(\regs_matrix[12][11] ), .B(n395), .C(\regs_matrix[14][11] ), .D(n388), .Y(n295) );
  NOR2X1 U415 ( .A(n297), .B(n298), .Y(n285) );
  OAI21X1 U416 ( .A(\regs_matrix[11][11] ), .B(n418), .C(n299), .Y(n298) );
  AOI21X1 U417 ( .A(n400), .B(n300), .C(n87), .Y(n299) );
  INVX2 U418 ( .A(\regs_matrix[9][11] ), .Y(n300) );
  OAI22X1 U419 ( .A(\regs_matrix[13][11] ), .B(n410), .C(\regs_matrix[15][11] ), .D(n398), .Y(n297) );
  AOI22X1 U420 ( .A(n302), .B(n303), .C(n304), .D(n305), .Y(n301) );
  NOR2X1 U421 ( .A(n306), .B(n307), .Y(n305) );
  OAI22X1 U422 ( .A(outreg_data[12]), .B(n391), .C(\regs_matrix[2][12] ), .D(
        n405), .Y(n307) );
  OAI22X1 U423 ( .A(\regs_matrix[4][12] ), .B(n394), .C(\regs_matrix[6][12] ), 
        .D(n388), .Y(n306) );
  NOR2X1 U424 ( .A(n308), .B(n309), .Y(n304) );
  OAI21X1 U425 ( .A(\regs_matrix[3][12] ), .B(n72), .C(n310), .Y(n309) );
  AOI21X1 U426 ( .A(n401), .B(n311), .C(N13), .Y(n310) );
  INVX2 U427 ( .A(\regs_matrix[1][12] ), .Y(n311) );
  OAI22X1 U428 ( .A(\regs_matrix[5][12] ), .B(n409), .C(\regs_matrix[7][12] ), 
        .D(n75), .Y(n308) );
  NOR2X1 U429 ( .A(n312), .B(n313), .Y(n303) );
  OAI22X1 U430 ( .A(\regs_matrix[8][12] ), .B(n390), .C(\regs_matrix[10][12] ), 
        .D(n63), .Y(n313) );
  OAI22X1 U431 ( .A(\regs_matrix[12][12] ), .B(n395), .C(\regs_matrix[14][12] ), .D(n388), .Y(n312) );
  NOR2X1 U432 ( .A(n314), .B(n315), .Y(n302) );
  OAI21X1 U433 ( .A(\regs_matrix[11][12] ), .B(n418), .C(n316), .Y(n315) );
  AOI21X1 U434 ( .A(n400), .B(n317), .C(n87), .Y(n316) );
  INVX2 U435 ( .A(\regs_matrix[9][12] ), .Y(n317) );
  OAI22X1 U436 ( .A(\regs_matrix[13][12] ), .B(n408), .C(\regs_matrix[15][12] ), .D(n397), .Y(n314) );
  AOI22X1 U437 ( .A(n319), .B(n320), .C(n321), .D(n322), .Y(n318) );
  NOR2X1 U438 ( .A(n323), .B(n324), .Y(n322) );
  OAI22X1 U439 ( .A(outreg_data[13]), .B(n391), .C(\regs_matrix[2][13] ), .D(
        n405), .Y(n324) );
  OAI22X1 U440 ( .A(\regs_matrix[4][13] ), .B(n393), .C(\regs_matrix[6][13] ), 
        .D(n388), .Y(n323) );
  NOR2X1 U441 ( .A(n325), .B(n326), .Y(n321) );
  OAI21X1 U442 ( .A(\regs_matrix[3][13] ), .B(n414), .C(n327), .Y(n326) );
  INVX2 U443 ( .A(\regs_matrix[1][13] ), .Y(n328) );
  OAI22X1 U444 ( .A(\regs_matrix[5][13] ), .B(n408), .C(\regs_matrix[7][13] ), 
        .D(n398), .Y(n325) );
  NOR2X1 U445 ( .A(n329), .B(n330), .Y(n320) );
  OAI22X1 U446 ( .A(\regs_matrix[8][13] ), .B(n390), .C(\regs_matrix[10][13] ), 
        .D(n405), .Y(n330) );
  OAI22X1 U447 ( .A(\regs_matrix[12][13] ), .B(n395), .C(\regs_matrix[14][13] ), .D(n388), .Y(n329) );
  NOR2X1 U448 ( .A(n331), .B(n332), .Y(n319) );
  OAI21X1 U449 ( .A(\regs_matrix[11][13] ), .B(n418), .C(n333), .Y(n332) );
  AOI21X1 U450 ( .A(n400), .B(n334), .C(n87), .Y(n333) );
  INVX2 U451 ( .A(\regs_matrix[9][13] ), .Y(n334) );
  OAI22X1 U452 ( .A(\regs_matrix[13][13] ), .B(n408), .C(\regs_matrix[15][13] ), .D(n397), .Y(n331) );
  AOI22X1 U453 ( .A(n336), .B(n337), .C(n338), .D(n339), .Y(n335) );
  NOR2X1 U454 ( .A(n340), .B(n341), .Y(n339) );
  OAI22X1 U455 ( .A(outreg_data[14]), .B(n391), .C(\regs_matrix[2][14] ), .D(
        n405), .Y(n341) );
  OAI22X1 U456 ( .A(\regs_matrix[4][14] ), .B(n394), .C(\regs_matrix[6][14] ), 
        .D(n388), .Y(n340) );
  NOR2X1 U457 ( .A(n342), .B(n343), .Y(n338) );
  OAI21X1 U458 ( .A(\regs_matrix[3][14] ), .B(n414), .C(n344), .Y(n343) );
  AOI21X1 U459 ( .A(n401), .B(n345), .C(N13), .Y(n344) );
  INVX2 U460 ( .A(\regs_matrix[1][14] ), .Y(n345) );
  OAI22X1 U461 ( .A(\regs_matrix[5][14] ), .B(n409), .C(\regs_matrix[7][14] ), 
        .D(n398), .Y(n342) );
  NOR2X1 U462 ( .A(n346), .B(n347), .Y(n337) );
  OAI22X1 U463 ( .A(\regs_matrix[8][14] ), .B(n390), .C(\regs_matrix[10][14] ), 
        .D(n405), .Y(n347) );
  OAI22X1 U464 ( .A(\regs_matrix[12][14] ), .B(n395), .C(\regs_matrix[14][14] ), .D(n388), .Y(n346) );
  NOR2X1 U465 ( .A(n348), .B(n349), .Y(n336) );
  OAI21X1 U466 ( .A(\regs_matrix[11][14] ), .B(n418), .C(n350), .Y(n349) );
  AOI21X1 U467 ( .A(n400), .B(n351), .C(n87), .Y(n350) );
  INVX2 U468 ( .A(\regs_matrix[9][14] ), .Y(n351) );
  OAI22X1 U469 ( .A(\regs_matrix[13][14] ), .B(n408), .C(\regs_matrix[15][14] ), .D(n75), .Y(n348) );
  AOI22X1 U470 ( .A(n353), .B(n354), .C(n355), .D(n356), .Y(n352) );
  NOR2X1 U471 ( .A(n357), .B(n358), .Y(n356) );
  OAI22X1 U472 ( .A(outreg_data[15]), .B(n391), .C(\regs_matrix[2][15] ), .D(
        n405), .Y(n358) );
  OAI22X1 U473 ( .A(\regs_matrix[4][15] ), .B(n393), .C(\regs_matrix[6][15] ), 
        .D(n388), .Y(n357) );
  NOR2X1 U474 ( .A(n359), .B(n360), .Y(n355) );
  OAI21X1 U475 ( .A(\regs_matrix[3][15] ), .B(n72), .C(n361), .Y(n360) );
  AOI21X1 U476 ( .A(n64), .B(n362), .C(N13), .Y(n361) );
  INVX2 U477 ( .A(\regs_matrix[1][15] ), .Y(n362) );
  OAI22X1 U478 ( .A(\regs_matrix[5][15] ), .B(n409), .C(\regs_matrix[7][15] ), 
        .D(n398), .Y(n359) );
  NOR2X1 U479 ( .A(n363), .B(n364), .Y(n354) );
  OAI22X1 U480 ( .A(\regs_matrix[8][15] ), .B(n390), .C(\regs_matrix[10][15] ), 
        .D(n405), .Y(n364) );
  OAI22X1 U481 ( .A(\regs_matrix[12][15] ), .B(n395), .C(\regs_matrix[14][15] ), .D(n388), .Y(n363) );
  NOR2X1 U482 ( .A(n365), .B(n366), .Y(n353) );
  OAI21X1 U483 ( .A(\regs_matrix[11][15] ), .B(n418), .C(n367), .Y(n366) );
  AOI21X1 U484 ( .A(n400), .B(n368), .C(n87), .Y(n367) );
  INVX2 U485 ( .A(\regs_matrix[9][15] ), .Y(n368) );
  OAI22X1 U486 ( .A(\regs_matrix[13][15] ), .B(n410), .C(\regs_matrix[15][15] ), .D(n398), .Y(n365) );
  NOR2X1 U487 ( .A(n370), .B(n371), .Y(n82) );
  OAI21X1 U488 ( .A(outreg_data[16]), .B(n391), .C(n372), .Y(n371) );
  AOI21X1 U489 ( .A(n404), .B(n373), .C(N13), .Y(n372) );
  INVX2 U490 ( .A(\regs_matrix[2][16] ), .Y(n373) );
  OAI22X1 U491 ( .A(\regs_matrix[4][16] ), .B(n393), .C(\regs_matrix[6][16] ), 
        .D(n388), .Y(n370) );
  NOR2X1 U492 ( .A(n374), .B(n375), .Y(n83) );
  OAI22X1 U493 ( .A(\regs_matrix[3][16] ), .B(n418), .C(\regs_matrix[1][16] ), 
        .D(n419), .Y(n375) );
  OAI22X1 U494 ( .A(\regs_matrix[5][16] ), .B(n408), .C(\regs_matrix[7][16] ), 
        .D(n75), .Y(n374) );
  NOR3X1 U495 ( .A(n376), .B(n377), .C(n378), .Y(n84) );
  OAI22X1 U496 ( .A(\regs_matrix[10][16] ), .B(n405), .C(\regs_matrix[8][16] ), 
        .D(n390), .Y(n378) );
  NAND3X1 U497 ( .A(n379), .B(n380), .C(n381), .Y(n96) );
  NAND3X1 U498 ( .A(N11), .B(n381), .C(n380), .Y(n105) );
  NOR2X1 U499 ( .A(\regs_matrix[12][16] ), .B(n395), .Y(n377) );
  NAND3X1 U500 ( .A(n1), .B(n379), .C(n381), .Y(n97) );
  OAI22X1 U501 ( .A(\regs_matrix[9][16] ), .B(n419), .C(\regs_matrix[14][16] ), 
        .D(n388), .Y(n376) );
  NAND3X1 U502 ( .A(n1), .B(N11), .C(n381), .Y(n95) );
  INVX2 U503 ( .A(N10), .Y(n381) );
  NAND3X1 U504 ( .A(n420), .B(n380), .C(n379), .Y(n369) );
  NOR2X1 U505 ( .A(n382), .B(n383), .Y(n85) );
  OAI21X1 U506 ( .A(\regs_matrix[11][16] ), .B(n414), .C(N13), .Y(n383) );
  OAI22X1 U507 ( .A(\regs_matrix[15][16] ), .B(n75), .C(\regs_matrix[13][16] ), 
        .D(n408), .Y(n382) );
  NAND3X1 U508 ( .A(n1), .B(n379), .C(n420), .Y(n106) );
  INVX2 U509 ( .A(N11), .Y(n379) );
  NAND2X1 U510 ( .A(n384), .B(n1), .Y(n100) );
  INVX2 U511 ( .A(n385), .Y(n384) );
  NAND2X1 U512 ( .A(N11), .B(N10), .Y(n385) );
  INVX4 U513 ( .A(n1), .Y(n380) );
  INVX2 U514 ( .A(\regs_matrix[3][9] ), .Y(n416) );
  NAND2X1 U515 ( .A(n259), .B(n415), .Y(n258) );
  NAND2X1 U516 ( .A(n416), .B(n411), .Y(n415) );
  NAND2X1 U517 ( .A(n417), .B(n293), .Y(n292) );
  BUFX2 U518 ( .A(n72), .Y(n418) );
  INVX2 U519 ( .A(n105), .Y(n402) );
  INVX4 U520 ( .A(n386), .Y(n387) );
  INVX4 U521 ( .A(n284), .Y(r1_data[11]) );
  BUFX2 U522 ( .A(n369), .Y(n419) );
  BUFX2 U523 ( .A(N10), .Y(n420) );
  AOI22X1 U524 ( .A(n424), .B(n423), .C(n422), .D(n421), .Y(n425) );
  INVX2 U525 ( .A(n425), .Y(r2_data[16]) );
  MUX2X1 U526 ( .B(n426), .A(n427), .S(n697), .Y(r2_data[0]) );
  NAND2X1 U527 ( .A(n428), .B(n429), .Y(n427) );
  NOR2X1 U528 ( .A(n430), .B(n431), .Y(n429) );
  OAI22X1 U529 ( .A(\regs_matrix[8][0] ), .B(n22), .C(\regs_matrix[10][0] ), 
        .D(n678), .Y(n431) );
  OAI22X1 U530 ( .A(\regs_matrix[12][0] ), .B(n683), .C(\regs_matrix[14][0] ), 
        .D(n50), .Y(n430) );
  NOR2X1 U531 ( .A(n437), .B(n436), .Y(n428) );
  OAI22X1 U532 ( .A(\regs_matrix[11][0] ), .B(n14), .C(\regs_matrix[9][0] ), 
        .D(n17), .Y(n437) );
  OAI22X1 U533 ( .A(\regs_matrix[13][0] ), .B(n693), .C(\regs_matrix[15][0] ), 
        .D(n38), .Y(n436) );
  NAND2X1 U534 ( .A(n440), .B(n441), .Y(n426) );
  NOR2X1 U535 ( .A(n442), .B(n443), .Y(n441) );
  OAI22X1 U536 ( .A(outreg_data[0]), .B(n21), .C(\regs_matrix[2][0] ), .D(n678), .Y(n443) );
  OAI22X1 U537 ( .A(\regs_matrix[4][0] ), .B(n683), .C(\regs_matrix[6][0] ), 
        .D(n49), .Y(n442) );
  NOR2X1 U538 ( .A(n444), .B(n445), .Y(n440) );
  OAI22X1 U539 ( .A(\regs_matrix[3][0] ), .B(n56), .C(\regs_matrix[1][0] ), 
        .D(n691), .Y(n445) );
  OAI22X1 U540 ( .A(\regs_matrix[5][0] ), .B(n71), .C(\regs_matrix[7][0] ), 
        .D(n59), .Y(n444) );
  MUX2X1 U541 ( .B(n446), .A(n447), .S(n698), .Y(r2_data[1]) );
  NAND2X1 U542 ( .A(n448), .B(n449), .Y(n447) );
  NOR2X1 U543 ( .A(n451), .B(n450), .Y(n449) );
  OAI22X1 U544 ( .A(\regs_matrix[8][1] ), .B(n30), .C(\regs_matrix[10][1] ), 
        .D(n678), .Y(n451) );
  OAI22X1 U545 ( .A(\regs_matrix[12][1] ), .B(n683), .C(\regs_matrix[14][1] ), 
        .D(n49), .Y(n450) );
  NOR2X1 U546 ( .A(n452), .B(n453), .Y(n448) );
  OAI22X1 U547 ( .A(\regs_matrix[11][1] ), .B(n68), .C(\regs_matrix[9][1] ), 
        .D(n18), .Y(n453) );
  OAI22X1 U548 ( .A(\regs_matrix[13][1] ), .B(n694), .C(\regs_matrix[15][1] ), 
        .D(n40), .Y(n452) );
  NAND2X1 U549 ( .A(n454), .B(n455), .Y(n446) );
  NOR2X1 U550 ( .A(n456), .B(n457), .Y(n455) );
  OAI22X1 U551 ( .A(outreg_data[1]), .B(n25), .C(\regs_matrix[2][1] ), .D(n678), .Y(n457) );
  OAI22X1 U552 ( .A(\regs_matrix[4][1] ), .B(n67), .C(\regs_matrix[6][1] ), 
        .D(n54), .Y(n456) );
  NOR2X1 U553 ( .A(n458), .B(n459), .Y(n454) );
  OAI22X1 U554 ( .A(\regs_matrix[3][1] ), .B(n57), .C(\regs_matrix[1][1] ), 
        .D(n77), .Y(n459) );
  OAI22X1 U555 ( .A(\regs_matrix[5][1] ), .B(n694), .C(\regs_matrix[7][1] ), 
        .D(n41), .Y(n458) );
  NAND2X1 U556 ( .A(n462), .B(n463), .Y(n461) );
  NOR2X1 U557 ( .A(n464), .B(n465), .Y(n463) );
  OAI22X1 U558 ( .A(\regs_matrix[8][2] ), .B(n22), .C(\regs_matrix[10][2] ), 
        .D(n678), .Y(n465) );
  OAI22X1 U559 ( .A(\regs_matrix[12][2] ), .B(n683), .C(\regs_matrix[14][2] ), 
        .D(n55), .Y(n464) );
  NOR2X1 U560 ( .A(n466), .B(n467), .Y(n462) );
  OAI22X1 U561 ( .A(\regs_matrix[11][2] ), .B(n686), .C(\regs_matrix[9][2] ), 
        .D(n691), .Y(n467) );
  OAI22X1 U562 ( .A(\regs_matrix[13][2] ), .B(n71), .C(\regs_matrix[15][2] ), 
        .D(n696), .Y(n466) );
  NAND2X1 U563 ( .A(n468), .B(n469), .Y(n460) );
  NOR2X1 U564 ( .A(n470), .B(n471), .Y(n469) );
  OAI22X1 U565 ( .A(outreg_data[2]), .B(n21), .C(\regs_matrix[2][2] ), .D(n678), .Y(n471) );
  OAI22X1 U566 ( .A(\regs_matrix[4][2] ), .B(n682), .C(\regs_matrix[6][2] ), 
        .D(n51), .Y(n470) );
  NOR2X1 U567 ( .A(n472), .B(n473), .Y(n468) );
  OAI22X1 U568 ( .A(\regs_matrix[3][2] ), .B(n68), .C(\regs_matrix[1][2] ), 
        .D(n76), .Y(n473) );
  OAI22X1 U569 ( .A(\regs_matrix[5][2] ), .B(n694), .C(\regs_matrix[7][2] ), 
        .D(n695), .Y(n472) );
  MUX2X1 U570 ( .B(n474), .A(n475), .S(n698), .Y(r2_data[3]) );
  NAND2X1 U571 ( .A(n476), .B(n477), .Y(n475) );
  NOR2X1 U572 ( .A(n478), .B(n479), .Y(n477) );
  OAI22X1 U573 ( .A(\regs_matrix[8][3] ), .B(n26), .C(\regs_matrix[10][3] ), 
        .D(n678), .Y(n479) );
  OAI22X1 U574 ( .A(\regs_matrix[12][3] ), .B(n681), .C(\regs_matrix[14][3] ), 
        .D(n52), .Y(n478) );
  NOR2X1 U575 ( .A(n480), .B(n481), .Y(n476) );
  OAI22X1 U576 ( .A(\regs_matrix[11][3] ), .B(n15), .C(\regs_matrix[9][3] ), 
        .D(n18), .Y(n481) );
  OAI22X1 U577 ( .A(\regs_matrix[13][3] ), .B(n693), .C(\regs_matrix[15][3] ), 
        .D(n61), .Y(n480) );
  NAND2X1 U578 ( .A(n482), .B(n483), .Y(n474) );
  NOR2X1 U579 ( .A(n484), .B(n485), .Y(n483) );
  OAI22X1 U580 ( .A(outreg_data[3]), .B(n23), .C(\regs_matrix[2][3] ), .D(n678), .Y(n485) );
  OAI22X1 U581 ( .A(\regs_matrix[4][3] ), .B(n682), .C(\regs_matrix[6][3] ), 
        .D(n51), .Y(n484) );
  NOR2X1 U582 ( .A(n486), .B(n487), .Y(n482) );
  OAI22X1 U583 ( .A(\regs_matrix[3][3] ), .B(n16), .C(\regs_matrix[1][3] ), 
        .D(n77), .Y(n487) );
  OAI22X1 U584 ( .A(\regs_matrix[5][3] ), .B(n71), .C(\regs_matrix[7][3] ), 
        .D(n695), .Y(n486) );
  MUX2X1 U585 ( .B(n488), .A(n489), .S(n697), .Y(r2_data[4]) );
  NAND2X1 U586 ( .A(n490), .B(n491), .Y(n489) );
  NOR2X1 U587 ( .A(n492), .B(n493), .Y(n491) );
  OAI22X1 U588 ( .A(\regs_matrix[8][4] ), .B(n27), .C(\regs_matrix[10][4] ), 
        .D(n679), .Y(n493) );
  OAI22X1 U589 ( .A(\regs_matrix[12][4] ), .B(n682), .C(\regs_matrix[14][4] ), 
        .D(n49), .Y(n492) );
  NOR2X1 U590 ( .A(n494), .B(n495), .Y(n490) );
  OAI22X1 U591 ( .A(\regs_matrix[11][4] ), .B(n686), .C(\regs_matrix[9][4] ), 
        .D(n76), .Y(n495) );
  OAI22X1 U592 ( .A(\regs_matrix[13][4] ), .B(n71), .C(\regs_matrix[15][4] ), 
        .D(n696), .Y(n494) );
  NAND2X1 U593 ( .A(n496), .B(n497), .Y(n488) );
  NOR2X1 U594 ( .A(n498), .B(n499), .Y(n497) );
  OAI22X1 U595 ( .A(outreg_data[4]), .B(n24), .C(\regs_matrix[2][4] ), .D(n679), .Y(n499) );
  OAI22X1 U596 ( .A(\regs_matrix[4][4] ), .B(n682), .C(\regs_matrix[6][4] ), 
        .D(n43), .Y(n498) );
  NOR2X1 U597 ( .A(n500), .B(n501), .Y(n496) );
  OAI22X1 U598 ( .A(\regs_matrix[3][4] ), .B(n68), .C(\regs_matrix[1][4] ), 
        .D(n690), .Y(n501) );
  OAI22X1 U599 ( .A(\regs_matrix[5][4] ), .B(n694), .C(\regs_matrix[7][4] ), 
        .D(n39), .Y(n500) );
  MUX2X1 U600 ( .B(n502), .A(n503), .S(n698), .Y(r2_data[5]) );
  NAND2X1 U601 ( .A(n504), .B(n505), .Y(n503) );
  NOR2X1 U602 ( .A(n506), .B(n507), .Y(n505) );
  OAI22X1 U603 ( .A(\regs_matrix[8][5] ), .B(n32), .C(\regs_matrix[10][5] ), 
        .D(n679), .Y(n507) );
  OAI22X1 U604 ( .A(\regs_matrix[12][5] ), .B(n67), .C(\regs_matrix[14][5] ), 
        .D(n46), .Y(n506) );
  NOR2X1 U605 ( .A(n508), .B(n509), .Y(n504) );
  OAI22X1 U606 ( .A(\regs_matrix[11][5] ), .B(n68), .C(\regs_matrix[9][5] ), 
        .D(n18), .Y(n509) );
  OAI22X1 U607 ( .A(\regs_matrix[13][5] ), .B(n694), .C(\regs_matrix[15][5] ), 
        .D(n41), .Y(n508) );
  NAND2X1 U608 ( .A(n510), .B(n511), .Y(n502) );
  NOR2X1 U609 ( .A(n512), .B(n513), .Y(n511) );
  OAI22X1 U610 ( .A(outreg_data[5]), .B(n26), .C(\regs_matrix[2][5] ), .D(n679), .Y(n513) );
  OAI22X1 U611 ( .A(\regs_matrix[4][5] ), .B(n682), .C(\regs_matrix[6][5] ), 
        .D(n47), .Y(n512) );
  NOR2X1 U612 ( .A(n514), .B(n515), .Y(n510) );
  OAI22X1 U613 ( .A(\regs_matrix[3][5] ), .B(n57), .C(\regs_matrix[1][5] ), 
        .D(n77), .Y(n515) );
  OAI22X1 U614 ( .A(\regs_matrix[5][5] ), .B(n693), .C(\regs_matrix[7][5] ), 
        .D(n696), .Y(n514) );
  MUX2X1 U615 ( .B(n516), .A(n517), .S(n697), .Y(r2_data[6]) );
  NAND2X1 U616 ( .A(n518), .B(n519), .Y(n517) );
  NOR2X1 U617 ( .A(n520), .B(n521), .Y(n519) );
  OAI22X1 U618 ( .A(\regs_matrix[8][6] ), .B(n33), .C(\regs_matrix[10][6] ), 
        .D(n679), .Y(n521) );
  OAI22X1 U619 ( .A(\regs_matrix[12][6] ), .B(n67), .C(\regs_matrix[14][6] ), 
        .D(n50), .Y(n520) );
  NOR2X1 U620 ( .A(n522), .B(n523), .Y(n518) );
  OAI22X1 U621 ( .A(\regs_matrix[11][6] ), .B(n686), .C(\regs_matrix[9][6] ), 
        .D(n77), .Y(n523) );
  OAI22X1 U622 ( .A(\regs_matrix[13][6] ), .B(n694), .C(\regs_matrix[15][6] ), 
        .D(n696), .Y(n522) );
  NAND2X1 U623 ( .A(n524), .B(n525), .Y(n516) );
  NOR2X1 U624 ( .A(n526), .B(n527), .Y(n525) );
  OAI22X1 U625 ( .A(outreg_data[6]), .B(n29), .C(\regs_matrix[2][6] ), .D(n679), .Y(n527) );
  OAI22X1 U626 ( .A(\regs_matrix[4][6] ), .B(n681), .C(\regs_matrix[6][6] ), 
        .D(n48), .Y(n526) );
  NOR2X1 U627 ( .A(n528), .B(n529), .Y(n524) );
  OAI22X1 U628 ( .A(\regs_matrix[3][6] ), .B(n68), .C(\regs_matrix[1][6] ), 
        .D(n690), .Y(n529) );
  OAI22X1 U629 ( .A(\regs_matrix[5][6] ), .B(n694), .C(\regs_matrix[7][6] ), 
        .D(n40), .Y(n528) );
  MUX2X1 U630 ( .B(n530), .A(n531), .S(n698), .Y(r2_data[7]) );
  NAND2X1 U631 ( .A(n532), .B(n533), .Y(n531) );
  NOR2X1 U632 ( .A(n534), .B(n535), .Y(n533) );
  OAI22X1 U633 ( .A(\regs_matrix[8][7] ), .B(n32), .C(\regs_matrix[10][7] ), 
        .D(n679), .Y(n535) );
  OAI22X1 U634 ( .A(\regs_matrix[12][7] ), .B(n681), .C(\regs_matrix[14][7] ), 
        .D(n42), .Y(n534) );
  NOR2X1 U635 ( .A(n536), .B(n537), .Y(n532) );
  OAI22X1 U636 ( .A(\regs_matrix[11][7] ), .B(n68), .C(\regs_matrix[9][7] ), 
        .D(n18), .Y(n537) );
  OAI22X1 U637 ( .A(\regs_matrix[13][7] ), .B(n693), .C(\regs_matrix[15][7] ), 
        .D(n61), .Y(n536) );
  NAND2X1 U638 ( .A(n538), .B(n539), .Y(n530) );
  NOR2X1 U639 ( .A(n540), .B(n541), .Y(n539) );
  OAI22X1 U640 ( .A(outreg_data[7]), .B(n27), .C(\regs_matrix[2][7] ), .D(n679), .Y(n541) );
  OAI22X1 U641 ( .A(\regs_matrix[4][7] ), .B(n67), .C(\regs_matrix[6][7] ), 
        .D(n44), .Y(n540) );
  NOR2X1 U642 ( .A(n542), .B(n543), .Y(n538) );
  OAI22X1 U643 ( .A(\regs_matrix[3][7] ), .B(n68), .C(\regs_matrix[1][7] ), 
        .D(n76), .Y(n543) );
  OAI22X1 U644 ( .A(\regs_matrix[5][7] ), .B(n693), .C(\regs_matrix[7][7] ), 
        .D(n61), .Y(n542) );
  MUX2X1 U645 ( .B(n544), .A(n545), .S(n697), .Y(r2_data[8]) );
  NAND2X1 U646 ( .A(n546), .B(n547), .Y(n545) );
  NOR2X1 U647 ( .A(n548), .B(n549), .Y(n547) );
  OAI22X1 U648 ( .A(\regs_matrix[8][8] ), .B(n20), .C(\regs_matrix[10][8] ), 
        .D(n679), .Y(n549) );
  OAI22X1 U649 ( .A(\regs_matrix[12][8] ), .B(n681), .C(\regs_matrix[14][8] ), 
        .D(n48), .Y(n548) );
  NOR2X1 U650 ( .A(n550), .B(n551), .Y(n546) );
  OAI22X1 U651 ( .A(\regs_matrix[11][8] ), .B(n686), .C(\regs_matrix[9][8] ), 
        .D(n76), .Y(n551) );
  OAI22X1 U652 ( .A(\regs_matrix[13][8] ), .B(n71), .C(\regs_matrix[15][8] ), 
        .D(n695), .Y(n550) );
  NAND2X1 U653 ( .A(n552), .B(n553), .Y(n544) );
  NOR2X1 U654 ( .A(n554), .B(n555), .Y(n553) );
  OAI22X1 U655 ( .A(outreg_data[8]), .B(n34), .C(\regs_matrix[2][8] ), .D(n679), .Y(n555) );
  OAI22X1 U656 ( .A(\regs_matrix[4][8] ), .B(n67), .C(\regs_matrix[6][8] ), 
        .D(n47), .Y(n554) );
  NOR2X1 U657 ( .A(n556), .B(n557), .Y(n552) );
  OAI22X1 U658 ( .A(\regs_matrix[3][8] ), .B(n58), .C(\regs_matrix[1][8] ), 
        .D(n691), .Y(n557) );
  OAI22X1 U659 ( .A(\regs_matrix[5][8] ), .B(n71), .C(\regs_matrix[7][8] ), 
        .D(n695), .Y(n556) );
  MUX2X1 U660 ( .B(n558), .A(n559), .S(n698), .Y(r2_data[9]) );
  NAND2X1 U661 ( .A(n560), .B(n561), .Y(n559) );
  NOR2X1 U662 ( .A(n562), .B(n563), .Y(n561) );
  OAI22X1 U663 ( .A(\regs_matrix[8][9] ), .B(n19), .C(\regs_matrix[10][9] ), 
        .D(n679), .Y(n563) );
  OAI22X1 U664 ( .A(\regs_matrix[12][9] ), .B(n683), .C(\regs_matrix[14][9] ), 
        .D(n53), .Y(n562) );
  NOR2X1 U665 ( .A(n564), .B(n565), .Y(n560) );
  OAI22X1 U666 ( .A(\regs_matrix[11][9] ), .B(n686), .C(\regs_matrix[9][9] ), 
        .D(n18), .Y(n565) );
  OAI22X1 U667 ( .A(\regs_matrix[13][9] ), .B(n694), .C(\regs_matrix[15][9] ), 
        .D(n696), .Y(n564) );
  NAND2X1 U668 ( .A(n566), .B(n567), .Y(n558) );
  NOR2X1 U669 ( .A(n568), .B(n569), .Y(n567) );
  OAI22X1 U670 ( .A(outreg_data[9]), .B(n23), .C(\regs_matrix[2][9] ), .D(n679), .Y(n569) );
  OAI22X1 U671 ( .A(\regs_matrix[4][9] ), .B(n683), .C(\regs_matrix[6][9] ), 
        .D(n52), .Y(n568) );
  NOR2X1 U672 ( .A(n570), .B(n571), .Y(n566) );
  OAI22X1 U673 ( .A(\regs_matrix[3][9] ), .B(n57), .C(\regs_matrix[1][9] ), 
        .D(n691), .Y(n571) );
  OAI22X1 U674 ( .A(\regs_matrix[5][9] ), .B(n694), .C(\regs_matrix[7][9] ), 
        .D(n60), .Y(n570) );
  MUX2X1 U675 ( .B(n572), .A(n573), .S(n697), .Y(r2_data[10]) );
  NAND2X1 U676 ( .A(n574), .B(n575), .Y(n573) );
  NOR2X1 U677 ( .A(n576), .B(n577), .Y(n575) );
  OAI22X1 U678 ( .A(\regs_matrix[8][10] ), .B(n28), .C(\regs_matrix[10][10] ), 
        .D(n679), .Y(n577) );
  OAI22X1 U679 ( .A(\regs_matrix[12][10] ), .B(n681), .C(\regs_matrix[14][10] ), .D(n44), .Y(n576) );
  NOR2X1 U680 ( .A(n578), .B(n579), .Y(n574) );
  OAI22X1 U681 ( .A(\regs_matrix[11][10] ), .B(n57), .C(\regs_matrix[9][10] ), 
        .D(n690), .Y(n579) );
  OAI22X1 U682 ( .A(\regs_matrix[13][10] ), .B(n694), .C(\regs_matrix[15][10] ), .D(n39), .Y(n578) );
  NAND2X1 U683 ( .A(n580), .B(n581), .Y(n572) );
  NOR2X1 U684 ( .A(n582), .B(n583), .Y(n581) );
  OAI22X1 U685 ( .A(outreg_data[10]), .B(n20), .C(\regs_matrix[2][10] ), .D(
        n679), .Y(n583) );
  OAI22X1 U686 ( .A(\regs_matrix[4][10] ), .B(n683), .C(\regs_matrix[6][10] ), 
        .D(n45), .Y(n582) );
  NOR2X1 U687 ( .A(n584), .B(n585), .Y(n580) );
  OAI22X1 U688 ( .A(\regs_matrix[3][10] ), .B(n68), .C(\regs_matrix[1][10] ), 
        .D(n691), .Y(n585) );
  OAI22X1 U689 ( .A(\regs_matrix[5][10] ), .B(n71), .C(\regs_matrix[7][10] ), 
        .D(n39), .Y(n584) );
  MUX2X1 U690 ( .B(n586), .A(n587), .S(n698), .Y(r2_data[11]) );
  NAND2X1 U691 ( .A(n588), .B(n589), .Y(n587) );
  NOR2X1 U692 ( .A(n590), .B(n591), .Y(n589) );
  OAI22X1 U693 ( .A(\regs_matrix[8][11] ), .B(n30), .C(\regs_matrix[10][11] ), 
        .D(n679), .Y(n591) );
  OAI22X1 U694 ( .A(\regs_matrix[12][11] ), .B(n682), .C(\regs_matrix[14][11] ), .D(n55), .Y(n590) );
  NOR2X1 U695 ( .A(n592), .B(n593), .Y(n588) );
  OAI22X1 U696 ( .A(\regs_matrix[11][11] ), .B(n686), .C(\regs_matrix[9][11] ), 
        .D(n77), .Y(n593) );
  OAI22X1 U697 ( .A(\regs_matrix[13][11] ), .B(n71), .C(\regs_matrix[15][11] ), 
        .D(n695), .Y(n592) );
  NAND2X1 U698 ( .A(n594), .B(n595), .Y(n586) );
  NOR2X1 U699 ( .A(n596), .B(n597), .Y(n595) );
  OAI22X1 U700 ( .A(outreg_data[11]), .B(n28), .C(\regs_matrix[2][11] ), .D(
        n679), .Y(n597) );
  OAI22X1 U701 ( .A(\regs_matrix[4][11] ), .B(n683), .C(\regs_matrix[6][11] ), 
        .D(n54), .Y(n596) );
  NOR2X1 U702 ( .A(n598), .B(n599), .Y(n594) );
  OAI22X1 U703 ( .A(\regs_matrix[3][11] ), .B(n58), .C(\regs_matrix[1][11] ), 
        .D(n76), .Y(n599) );
  OAI22X1 U704 ( .A(\regs_matrix[5][11] ), .B(n693), .C(\regs_matrix[7][11] ), 
        .D(n39), .Y(n598) );
  MUX2X1 U705 ( .B(n600), .A(n601), .S(n697), .Y(r2_data[12]) );
  NAND2X1 U706 ( .A(n602), .B(n603), .Y(n601) );
  NOR2X1 U707 ( .A(n604), .B(n605), .Y(n603) );
  OAI22X1 U708 ( .A(\regs_matrix[8][12] ), .B(n36), .C(\regs_matrix[10][12] ), 
        .D(n679), .Y(n605) );
  OAI22X1 U709 ( .A(\regs_matrix[12][12] ), .B(n681), .C(\regs_matrix[14][12] ), .D(n52), .Y(n604) );
  NOR2X1 U710 ( .A(n606), .B(n607), .Y(n602) );
  OAI22X1 U711 ( .A(\regs_matrix[11][12] ), .B(n58), .C(\regs_matrix[9][12] ), 
        .D(n77), .Y(n607) );
  OAI22X1 U712 ( .A(\regs_matrix[13][12] ), .B(n694), .C(\regs_matrix[15][12] ), .D(n695), .Y(n606) );
  NAND2X1 U713 ( .A(n608), .B(n609), .Y(n600) );
  NOR2X1 U714 ( .A(n610), .B(n611), .Y(n609) );
  OAI22X1 U715 ( .A(outreg_data[12]), .B(n29), .C(\regs_matrix[2][12] ), .D(
        n679), .Y(n611) );
  OAI22X1 U716 ( .A(\regs_matrix[4][12] ), .B(n681), .C(\regs_matrix[6][12] ), 
        .D(n51), .Y(n610) );
  NOR2X1 U717 ( .A(n613), .B(n612), .Y(n608) );
  OAI22X1 U718 ( .A(\regs_matrix[3][12] ), .B(n686), .C(\regs_matrix[1][12] ), 
        .D(n690), .Y(n613) );
  OAI22X1 U719 ( .A(\regs_matrix[5][12] ), .B(n694), .C(\regs_matrix[7][12] ), 
        .D(n696), .Y(n612) );
  MUX2X1 U720 ( .B(n614), .A(n615), .S(n698), .Y(r2_data[13]) );
  NAND2X1 U721 ( .A(n616), .B(n617), .Y(n615) );
  NOR2X1 U722 ( .A(n618), .B(n619), .Y(n617) );
  OAI22X1 U723 ( .A(\regs_matrix[8][13] ), .B(n19), .C(\regs_matrix[10][13] ), 
        .D(n679), .Y(n619) );
  OAI22X1 U724 ( .A(\regs_matrix[12][13] ), .B(n681), .C(\regs_matrix[14][13] ), .D(n45), .Y(n618) );
  NOR2X1 U725 ( .A(n620), .B(n621), .Y(n616) );
  OAI22X1 U726 ( .A(\regs_matrix[11][13] ), .B(n58), .C(\regs_matrix[9][13] ), 
        .D(n18), .Y(n621) );
  OAI22X1 U727 ( .A(\regs_matrix[13][13] ), .B(n694), .C(\regs_matrix[15][13] ), .D(n696), .Y(n620) );
  NAND2X1 U728 ( .A(n622), .B(n623), .Y(n614) );
  NOR2X1 U729 ( .A(n624), .B(n625), .Y(n623) );
  OAI22X1 U730 ( .A(outreg_data[13]), .B(n31), .C(\regs_matrix[2][13] ), .D(
        n679), .Y(n625) );
  OAI22X1 U731 ( .A(\regs_matrix[4][13] ), .B(n681), .C(\regs_matrix[6][13] ), 
        .D(n43), .Y(n624) );
  NOR2X1 U732 ( .A(n626), .B(n627), .Y(n622) );
  OAI22X1 U733 ( .A(\regs_matrix[3][13] ), .B(n58), .C(\regs_matrix[1][13] ), 
        .D(n691), .Y(n627) );
  OAI22X1 U734 ( .A(\regs_matrix[5][13] ), .B(n71), .C(\regs_matrix[7][13] ), 
        .D(n695), .Y(n626) );
  MUX2X1 U735 ( .B(n628), .A(n629), .S(n697), .Y(r2_data[14]) );
  NAND2X1 U736 ( .A(n630), .B(n631), .Y(n629) );
  NOR2X1 U737 ( .A(n632), .B(n633), .Y(n631) );
  OAI22X1 U738 ( .A(\regs_matrix[8][14] ), .B(n35), .C(\regs_matrix[10][14] ), 
        .D(n679), .Y(n633) );
  OAI22X1 U739 ( .A(\regs_matrix[12][14] ), .B(n682), .C(\regs_matrix[14][14] ), .D(n46), .Y(n632) );
  NOR2X1 U740 ( .A(n634), .B(n635), .Y(n630) );
  OAI22X1 U741 ( .A(\regs_matrix[11][14] ), .B(n15), .C(\regs_matrix[9][14] ), 
        .D(n76), .Y(n635) );
  OAI22X1 U742 ( .A(\regs_matrix[13][14] ), .B(n71), .C(\regs_matrix[15][14] ), 
        .D(n41), .Y(n634) );
  NAND2X1 U743 ( .A(n636), .B(n637), .Y(n628) );
  NOR2X1 U744 ( .A(n638), .B(n639), .Y(n637) );
  OAI22X1 U745 ( .A(outreg_data[14]), .B(n31), .C(\regs_matrix[2][14] ), .D(
        n679), .Y(n639) );
  OAI22X1 U746 ( .A(\regs_matrix[4][14] ), .B(n67), .C(\regs_matrix[6][14] ), 
        .D(n42), .Y(n638) );
  NOR2X1 U747 ( .A(n640), .B(n641), .Y(n636) );
  OAI22X1 U748 ( .A(\regs_matrix[3][14] ), .B(n16), .C(\regs_matrix[1][14] ), 
        .D(n690), .Y(n641) );
  OAI22X1 U749 ( .A(\regs_matrix[5][14] ), .B(n694), .C(\regs_matrix[7][14] ), 
        .D(n60), .Y(n640) );
  NAND2X1 U750 ( .A(n645), .B(n644), .Y(n643) );
  NOR2X1 U751 ( .A(n646), .B(n647), .Y(n645) );
  OAI22X1 U752 ( .A(\regs_matrix[8][15] ), .B(n24), .C(\regs_matrix[10][15] ), 
        .D(n679), .Y(n647) );
  OAI22X1 U753 ( .A(\regs_matrix[12][15] ), .B(n67), .C(\regs_matrix[14][15] ), 
        .D(n53), .Y(n646) );
  NOR2X1 U754 ( .A(n648), .B(n649), .Y(n644) );
  OAI22X1 U755 ( .A(\regs_matrix[11][15] ), .B(n15), .C(\regs_matrix[9][15] ), 
        .D(n690), .Y(n649) );
  OAI22X1 U756 ( .A(\regs_matrix[13][15] ), .B(n694), .C(\regs_matrix[15][15] ), .D(n39), .Y(n648) );
  NAND2X1 U757 ( .A(n650), .B(n651), .Y(n642) );
  NOR2X1 U758 ( .A(n652), .B(n653), .Y(n651) );
  OAI22X1 U759 ( .A(outreg_data[15]), .B(n25), .C(\regs_matrix[2][15] ), .D(
        n679), .Y(n653) );
  OAI22X1 U760 ( .A(\regs_matrix[4][15] ), .B(n682), .C(\regs_matrix[6][15] ), 
        .D(n50), .Y(n652) );
  NOR2X1 U761 ( .A(n654), .B(n655), .Y(n650) );
  OAI22X1 U762 ( .A(\regs_matrix[3][15] ), .B(n16), .C(\regs_matrix[1][15] ), 
        .D(n691), .Y(n655) );
  OAI22X1 U763 ( .A(\regs_matrix[5][15] ), .B(n694), .C(\regs_matrix[7][15] ), 
        .D(n39), .Y(n654) );
  NOR2X1 U764 ( .A(n656), .B(n657), .Y(n421) );
  OAI21X1 U765 ( .A(\regs_matrix[6][16] ), .B(n54), .C(n658), .Y(n657) );
  AOI22X1 U766 ( .A(n677), .B(n373), .C(n37), .D(n659), .Y(n658) );
  INVX2 U767 ( .A(outreg_data[16]), .Y(n659) );
  OAI21X1 U768 ( .A(\regs_matrix[4][16] ), .B(n682), .C(n699), .Y(n656) );
  NOR2X1 U769 ( .A(n660), .B(n661), .Y(n422) );
  OAI22X1 U770 ( .A(\regs_matrix[3][16] ), .B(n686), .C(\regs_matrix[1][16] ), 
        .D(n76), .Y(n661) );
  OAI22X1 U771 ( .A(\regs_matrix[5][16] ), .B(n694), .C(\regs_matrix[7][16] ), 
        .D(n60), .Y(n660) );
  NOR2X1 U772 ( .A(n662), .B(n663), .Y(n423) );
  OAI21X1 U773 ( .A(\regs_matrix[12][16] ), .B(n67), .C(n664), .Y(n663) );
  AOI22X1 U774 ( .A(n677), .B(n665), .C(n37), .D(n666), .Y(n664) );
  INVX2 U775 ( .A(\regs_matrix[8][16] ), .Y(n666) );
  NAND3X1 U776 ( .A(n669), .B(n668), .C(n667), .Y(n432) );
  INVX2 U777 ( .A(\regs_matrix[10][16] ), .Y(n665) );
  NAND3X1 U778 ( .A(n668), .B(N15), .C(n669), .Y(n433) );
  NAND3X1 U779 ( .A(N16), .B(n667), .C(n669), .Y(n434) );
  OAI22X1 U780 ( .A(\regs_matrix[9][16] ), .B(n690), .C(\regs_matrix[14][16] ), 
        .D(n53), .Y(n662) );
  NAND3X1 U781 ( .A(N16), .B(N15), .C(n669), .Y(n435) );
  INVX2 U782 ( .A(N14), .Y(n669) );
  NOR2X1 U783 ( .A(n670), .B(n671), .Y(n424) );
  OAI21X1 U784 ( .A(\regs_matrix[11][16] ), .B(n57), .C(n697), .Y(n671) );
  OAI22X1 U785 ( .A(\regs_matrix[15][16] ), .B(n40), .C(\regs_matrix[13][16] ), 
        .D(n693), .Y(n670) );
  INVX2 U786 ( .A(N15), .Y(n667) );
  BUFX4 U787 ( .A(n672), .Y(n674) );
  INVX4 U788 ( .A(w_data[10]), .Y(n728) );
  INVX4 U789 ( .A(w_data[14]), .Y(n738) );
  INVX4 U790 ( .A(w_data[11]), .Y(n731) );
  INVX4 U791 ( .A(w_data[6]), .Y(n717) );
  INVX4 U792 ( .A(w_data[9]), .Y(n726) );
  INVX4 U793 ( .A(w_data[13]), .Y(n736) );
  INVX4 U794 ( .A(w_data[15]), .Y(n741) );
  INVX8 U795 ( .A(n726), .Y(n727) );
  INVX8 U796 ( .A(n728), .Y(n729) );
  INVX8 U797 ( .A(n728), .Y(n730) );
  INVX8 U798 ( .A(n734), .Y(n735) );
  INVX8 U799 ( .A(n736), .Y(n737) );
  INVX8 U800 ( .A(n738), .Y(n739) );
  INVX8 U801 ( .A(n738), .Y(n740) );
  INVX2 U802 ( .A(w_en), .Y(n752) );
  INVX2 U803 ( .A(w_sel[3]), .Y(n753) );
  INVX2 U804 ( .A(w_sel[1]), .Y(n754) );
  INVX2 U805 ( .A(w_sel[2]), .Y(n755) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U3 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, \sub_add_18_b0/carry[15] , \sub_add_18_b0/carry[14] ,
         \sub_add_18_b0/carry[13] , \sub_add_18_b0/carry[12] ,
         \sub_add_18_b0/carry[11] , \sub_add_18_b0/carry[10] ,
         \sub_add_18_b0/carry[9] , \sub_add_18_b0/carry[8] ,
         \sub_add_18_b0/carry[7] , \sub_add_18_b0/carry[6] ,
         \sub_add_18_b0/carry[5] , \sub_add_18_b0/carry[4] ,
         \sub_add_18_b0/carry[3] , \sub_add_18_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [15:0] twos_comp;
  assign twos_comp[0] = in[0];

  AOI22X1 U22 ( .A(in[9]), .B(n1), .C(twos_comp[9]), .D(in[16]), .Y(n22) );
  AOI22X1 U23 ( .A(in[8]), .B(n1), .C(twos_comp[8]), .D(n2), .Y(n23) );
  AOI22X1 U24 ( .A(in[7]), .B(n1), .C(twos_comp[7]), .D(in[16]), .Y(n24) );
  AOI22X1 U25 ( .A(in[6]), .B(n1), .C(twos_comp[6]), .D(n2), .Y(n25) );
  AOI22X1 U26 ( .A(in[5]), .B(n1), .C(twos_comp[5]), .D(in[16]), .Y(n26) );
  AOI22X1 U27 ( .A(in[4]), .B(n1), .C(twos_comp[4]), .D(n2), .Y(n27) );
  AOI22X1 U28 ( .A(in[3]), .B(n1), .C(twos_comp[3]), .D(in[16]), .Y(n28) );
  AOI22X1 U29 ( .A(in[2]), .B(n1), .C(twos_comp[2]), .D(n2), .Y(n29) );
  AOI22X1 U30 ( .A(in[1]), .B(n1), .C(twos_comp[1]), .D(in[16]), .Y(n30) );
  AOI22X1 U31 ( .A(in[15]), .B(n1), .C(twos_comp[15]), .D(n2), .Y(n31) );
  AOI22X1 U32 ( .A(in[14]), .B(n1), .C(twos_comp[14]), .D(in[16]), .Y(n32) );
  AOI22X1 U33 ( .A(in[13]), .B(n1), .C(twos_comp[13]), .D(n2), .Y(n33) );
  AOI22X1 U34 ( .A(in[12]), .B(n1), .C(twos_comp[12]), .D(n2), .Y(n34) );
  AOI22X1 U35 ( .A(in[11]), .B(n1), .C(twos_comp[11]), .D(n2), .Y(n35) );
  AOI22X1 U36 ( .A(in[10]), .B(n1), .C(twos_comp[10]), .D(in[16]), .Y(n36) );
  AOI22X1 U37 ( .A(twos_comp[0]), .B(n1), .C(twos_comp[0]), .D(n2), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_18_b0/carry[15] ), .Y(twos_comp[15]) );
  AND2X1 U5 ( .A(\sub_add_18_b0/carry[14] ), .B(n17), .Y(
        \sub_add_18_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_18_b0/carry[14] ), .B(n17), .Y(twos_comp[14]) );
  AND2X1 U7 ( .A(\sub_add_18_b0/carry[13] ), .B(n16), .Y(
        \sub_add_18_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_18_b0/carry[13] ), .B(n16), .Y(twos_comp[13]) );
  AND2X1 U9 ( .A(\sub_add_18_b0/carry[12] ), .B(n15), .Y(
        \sub_add_18_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_18_b0/carry[12] ), .B(n15), .Y(twos_comp[12]) );
  AND2X1 U11 ( .A(\sub_add_18_b0/carry[11] ), .B(n14), .Y(
        \sub_add_18_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_18_b0/carry[11] ), .B(n14), .Y(twos_comp[11]) );
  AND2X1 U13 ( .A(\sub_add_18_b0/carry[10] ), .B(n13), .Y(
        \sub_add_18_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_18_b0/carry[10] ), .B(n13), .Y(twos_comp[10]) );
  AND2X1 U15 ( .A(\sub_add_18_b0/carry[9] ), .B(n12), .Y(
        \sub_add_18_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_18_b0/carry[9] ), .B(n12), .Y(twos_comp[9]) );
  AND2X1 U17 ( .A(\sub_add_18_b0/carry[8] ), .B(n11), .Y(
        \sub_add_18_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_18_b0/carry[8] ), .B(n11), .Y(twos_comp[8]) );
  AND2X1 U19 ( .A(\sub_add_18_b0/carry[7] ), .B(n10), .Y(
        \sub_add_18_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_18_b0/carry[7] ), .B(n10), .Y(twos_comp[7]) );
  AND2X1 U21 ( .A(\sub_add_18_b0/carry[6] ), .B(n9), .Y(
        \sub_add_18_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_18_b0/carry[6] ), .B(n9), .Y(twos_comp[6]) );
  AND2X1 U39 ( .A(\sub_add_18_b0/carry[5] ), .B(n8), .Y(
        \sub_add_18_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_18_b0/carry[5] ), .B(n8), .Y(twos_comp[5]) );
  AND2X1 U41 ( .A(\sub_add_18_b0/carry[4] ), .B(n7), .Y(
        \sub_add_18_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_18_b0/carry[4] ), .B(n7), .Y(twos_comp[4]) );
  AND2X1 U43 ( .A(\sub_add_18_b0/carry[3] ), .B(n6), .Y(
        \sub_add_18_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_18_b0/carry[3] ), .B(n6), .Y(twos_comp[3]) );
  AND2X1 U45 ( .A(\sub_add_18_b0/carry[2] ), .B(n5), .Y(
        \sub_add_18_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_18_b0/carry[2] ), .B(n5), .Y(twos_comp[2]) );
  AND2X1 U47 ( .A(n3), .B(n4), .Y(\sub_add_18_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(twos_comp[1]) );
  INVX2 U49 ( .A(twos_comp[0]), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, N41, N40, N39, N38, N37, N36,
         N35, N34, N33, N32, \mult_add_55_aco/b , n1, n2, n3, n4, n16, n17,
         n18, n19, n20, n21, n22, n23;

  DFFSR \count_out_reg[9]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U27 ( .A(\mult_add_55_aco/b ), .B(n23), .C(n29), .Y(n58) );
  NAND2X1 U28 ( .A(n30), .B(n31), .Y(n29) );
  NOR2X1 U29 ( .A(n32), .B(n33), .Y(n31) );
  NAND3X1 U30 ( .A(n34), .B(n35), .C(n36), .Y(n33) );
  XNOR2X1 U31 ( .A(N27), .B(rollover_val[9]), .Y(n36) );
  XNOR2X1 U32 ( .A(N24), .B(rollover_val[6]), .Y(n35) );
  XNOR2X1 U33 ( .A(N25), .B(rollover_val[7]), .Y(n34) );
  NAND3X1 U34 ( .A(n37), .B(n38), .C(n39), .Y(n32) );
  XNOR2X1 U35 ( .A(N21), .B(rollover_val[3]), .Y(n39) );
  XNOR2X1 U36 ( .A(N26), .B(rollover_val[8]), .Y(n37) );
  NOR2X1 U37 ( .A(n40), .B(n41), .Y(n30) );
  NAND2X1 U38 ( .A(n42), .B(n43), .Y(n41) );
  XNOR2X1 U39 ( .A(N19), .B(rollover_val[1]), .Y(n43) );
  XNOR2X1 U40 ( .A(N18), .B(rollover_val[0]), .Y(n42) );
  NAND3X1 U41 ( .A(n44), .B(n45), .C(n46), .Y(n40) );
  XNOR2X1 U42 ( .A(N20), .B(rollover_val[2]), .Y(n46) );
  XNOR2X1 U43 ( .A(N22), .B(rollover_val[4]), .Y(n45) );
  XNOR2X1 U44 ( .A(N23), .B(rollover_val[5]), .Y(n44) );
  OAI21X1 U45 ( .A(N32), .B(n22), .C(n48), .Y(n59) );
  NAND2X1 U46 ( .A(count_out[0]), .B(n1), .Y(n48) );
  OAI21X1 U47 ( .A(n21), .B(n22), .C(n49), .Y(n60) );
  NAND2X1 U48 ( .A(count_out[1]), .B(n1), .Y(n49) );
  OAI21X1 U49 ( .A(n20), .B(n22), .C(n50), .Y(n61) );
  NAND2X1 U50 ( .A(count_out[2]), .B(n1), .Y(n50) );
  OAI21X1 U51 ( .A(n19), .B(n22), .C(n51), .Y(n62) );
  NAND2X1 U52 ( .A(count_out[3]), .B(n1), .Y(n51) );
  OAI21X1 U53 ( .A(n18), .B(n22), .C(n52), .Y(n63) );
  NAND2X1 U54 ( .A(count_out[4]), .B(n1), .Y(n52) );
  OAI21X1 U55 ( .A(n17), .B(n22), .C(n53), .Y(n64) );
  NAND2X1 U56 ( .A(count_out[5]), .B(n1), .Y(n53) );
  OAI21X1 U57 ( .A(n16), .B(n22), .C(n54), .Y(n65) );
  NAND2X1 U58 ( .A(count_out[6]), .B(n1), .Y(n54) );
  OAI21X1 U59 ( .A(n4), .B(n22), .C(n55), .Y(n66) );
  NAND2X1 U60 ( .A(count_out[7]), .B(n1), .Y(n55) );
  OAI21X1 U61 ( .A(n3), .B(n22), .C(n56), .Y(n67) );
  NAND2X1 U62 ( .A(count_out[8]), .B(n1), .Y(n56) );
  OAI21X1 U63 ( .A(n2), .B(n22), .C(n57), .Y(n68) );
  NAND2X1 U64 ( .A(count_out[9]), .B(n1), .Y(n57) );
  NOR2X1 U65 ( .A(n1), .B(clear), .Y(n38) );
  NOR2X1 U66 ( .A(clear), .B(count_enable), .Y(n47) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_55_aco ( .A({N41, N40, N39, N38, 
        N37, N36, N35, N34, N33, N32}), .SUM({N27, N26, N25, N24, N23, N22, 
        N21, N20, N19, N18}) );
  INVX2 U14 ( .A(n38), .Y(n22) );
  BUFX2 U15 ( .A(n47), .Y(n1) );
  INVX2 U16 ( .A(rollover_flag), .Y(\mult_add_55_aco/b ) );
  AND2X1 U17 ( .A(count_out[0]), .B(\mult_add_55_aco/b ), .Y(N32) );
  AND2X1 U18 ( .A(count_out[1]), .B(\mult_add_55_aco/b ), .Y(N33) );
  AND2X1 U19 ( .A(count_out[2]), .B(\mult_add_55_aco/b ), .Y(N34) );
  AND2X1 U20 ( .A(count_out[3]), .B(\mult_add_55_aco/b ), .Y(N35) );
  AND2X1 U21 ( .A(count_out[4]), .B(\mult_add_55_aco/b ), .Y(N36) );
  AND2X1 U22 ( .A(count_out[5]), .B(\mult_add_55_aco/b ), .Y(N37) );
  AND2X1 U23 ( .A(count_out[6]), .B(\mult_add_55_aco/b ), .Y(N38) );
  AND2X1 U24 ( .A(count_out[7]), .B(\mult_add_55_aco/b ), .Y(N39) );
  AND2X1 U25 ( .A(count_out[8]), .B(\mult_add_55_aco/b ), .Y(N40) );
  AND2X1 U26 ( .A(\mult_add_55_aco/b ), .B(count_out[9]), .Y(N41) );
  INVX2 U67 ( .A(N27), .Y(n2) );
  INVX2 U68 ( .A(N26), .Y(n3) );
  INVX2 U69 ( .A(N25), .Y(n4) );
  INVX2 U70 ( .A(N24), .Y(n16) );
  INVX2 U71 ( .A(N23), .Y(n17) );
  INVX2 U72 ( .A(N22), .Y(n18) );
  INVX2 U73 ( .A(N21), .Y(n19) );
  INVX2 U74 ( .A(N20), .Y(n20) );
  INVX2 U75 ( .A(N19), .Y(n21) );
  INVX2 U76 ( .A(n1), .Y(n23) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 counter ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   dr_out, lc_out, overflow_internal, cnt_up_internal, clear_internal;
  wire   [2:0] op_internal;
  wire   [3:0] src1_internal;
  wire   [3:0] src2_internal;
  wire   [3:0] dest_internal;
  wire   [16:0] outreg_data_internal;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 dr_sync ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr_out) );
  sync_low_0 lc_sync ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc_out) );
  controller controlla ( .clk(clk), .n_reset(n_reset), .dr(dr_out), .lc(lc_out), .overflow(overflow_internal), .cnt_up(cnt_up_internal), .clear(
        clear_internal), .modwait(modwait), .op(op_internal), .src1({
        SYNOPSYS_UNCONNECTED__0, src1_internal[2:0]}), .src2(src2_internal), 
        .dest(dest_internal), .err(err) );
  datapath starboy ( .clk(clk), .n_reset(n_reset), .op(op_internal), .src1({
        1'b0, src1_internal[2:0]}), .src2(src2_internal), .dest(dest_internal), 
        .ext_data1(sample_data), .ext_data2(fir_coefficient), .outreg_data(
        outreg_data_internal), .overflow(overflow_internal) );
  magnitude energy ( .in(outreg_data_internal), .out(fir_out) );
  counter onedance ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up_internal), 
        .clear(clear_internal), .one_k_samples(one_k_samples) );
endmodule

