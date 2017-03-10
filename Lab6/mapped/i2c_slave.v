/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 23 19:40:55 2017
/////////////////////////////////////////////////////////////


module controller ( clk, n_rst, stop_found, start_found, byte_received, 
        ack_prep, check_ack, ack_done, rw_mode, address_match, sda_in, 
        rx_enable, tx_enable, read_enable, sda_mode, load_data );
  output [1:0] sda_mode;
  input clk, n_rst, stop_found, start_found, byte_received, ack_prep,
         check_ack, ack_done, rw_mode, address_match, sda_in;
  output rx_enable, tx_enable, read_enable, load_data;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;
  wire   [3:0] state;
  wire   [3:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  INVX1 U7 ( .A(n5), .Y(sda_mode[1]) );
  OR2X1 U8 ( .A(n6), .B(n7), .Y(next_state[3]) );
  OAI22X1 U9 ( .A(sda_in), .B(n8), .C(ack_done), .D(n9), .Y(n7) );
  OAI21X1 U10 ( .A(n10), .B(n11), .C(n12), .Y(n6) );
  OR2X1 U11 ( .A(n13), .B(n14), .Y(next_state[2]) );
  OAI21X1 U12 ( .A(n9), .B(n15), .C(n16), .Y(n14) );
  AOI22X1 U13 ( .A(n17), .B(state[2]), .C(n18), .D(n11), .Y(n16) );
  INVX1 U14 ( .A(check_ack), .Y(n11) );
  OAI21X1 U15 ( .A(n19), .B(n20), .C(n21), .Y(n13) );
  NOR2X1 U16 ( .A(sda_mode[0]), .B(load_data), .Y(n21) );
  NAND2X1 U17 ( .A(n22), .B(n23), .Y(sda_mode[0]) );
  NAND2X1 U18 ( .A(n24), .B(n25), .Y(n20) );
  NAND3X1 U19 ( .A(n26), .B(n27), .C(n28), .Y(next_state[1]) );
  AOI21X1 U20 ( .A(n17), .B(state[1]), .C(n29), .Y(n28) );
  NAND2X1 U21 ( .A(n30), .B(n22), .Y(n29) );
  INVX1 U22 ( .A(n12), .Y(n17) );
  AOI22X1 U23 ( .A(n24), .B(n19), .C(byte_received), .D(rx_enable), .Y(n26) );
  NAND3X1 U24 ( .A(n31), .B(n32), .C(n33), .Y(next_state[0]) );
  NOR2X1 U25 ( .A(n34), .B(n35), .Y(n33) );
  OAI21X1 U26 ( .A(sda_in), .B(n8), .C(n27), .Y(n35) );
  INVX1 U27 ( .A(n36), .Y(n27) );
  OAI21X1 U28 ( .A(check_ack), .B(n10), .C(n37), .Y(n36) );
  AOI22X1 U29 ( .A(n38), .B(ack_prep), .C(n39), .D(n15), .Y(n37) );
  NOR2X1 U30 ( .A(n25), .B(n40), .Y(n38) );
  AND2X1 U31 ( .A(rw_mode), .B(address_match), .Y(n25) );
  OAI22X1 U32 ( .A(byte_received), .B(n41), .C(n19), .D(n22), .Y(n34) );
  INVX1 U33 ( .A(ack_prep), .Y(n19) );
  INVX1 U34 ( .A(n42), .Y(n32) );
  OAI21X1 U35 ( .A(n43), .B(n44), .C(n9), .Y(n42) );
  INVX1 U36 ( .A(start_found), .Y(n43) );
  INVX1 U37 ( .A(n45), .Y(n31) );
  OAI22X1 U38 ( .A(n12), .B(n46), .C(n23), .D(n15), .Y(n45) );
  INVX1 U39 ( .A(ack_done), .Y(n15) );
  NAND3X1 U40 ( .A(n47), .B(n48), .C(n49), .Y(n12) );
  NOR2X1 U41 ( .A(n50), .B(n51), .Y(n49) );
  NAND2X1 U42 ( .A(n9), .B(n8), .Y(n51) );
  NAND3X1 U43 ( .A(state[3]), .B(n52), .C(n53), .Y(n9) );
  NAND3X1 U44 ( .A(n44), .B(n5), .C(n23), .Y(n50) );
  NAND3X1 U45 ( .A(n46), .B(n54), .C(n55), .Y(n23) );
  NOR2X1 U46 ( .A(tx_enable), .B(n39), .Y(n5) );
  INVX1 U47 ( .A(n56), .Y(n39) );
  NAND3X1 U48 ( .A(state[0]), .B(n57), .C(state[1]), .Y(n56) );
  NAND3X1 U49 ( .A(n46), .B(n54), .C(n57), .Y(n44) );
  INVX1 U50 ( .A(state[1]), .Y(n54) );
  NOR2X1 U51 ( .A(n18), .B(load_data), .Y(n48) );
  INVX1 U52 ( .A(n10), .Y(n18) );
  NAND3X1 U53 ( .A(state[1]), .B(state[0]), .C(n55), .Y(n10) );
  NOR2X1 U54 ( .A(rx_enable), .B(n24), .Y(n47) );
  INVX1 U55 ( .A(n40), .Y(n24) );
  NAND3X1 U56 ( .A(n57), .B(n46), .C(state[1]), .Y(n40) );
  INVX1 U57 ( .A(n22), .Y(tx_enable) );
  NAND3X1 U58 ( .A(state[1]), .B(n46), .C(n55), .Y(n22) );
  INVX1 U59 ( .A(n41), .Y(rx_enable) );
  NAND2X1 U60 ( .A(n53), .B(n57), .Y(n41) );
  NOR2X1 U61 ( .A(state[2]), .B(state[3]), .Y(n57) );
  INVX1 U62 ( .A(n8), .Y(read_enable) );
  NAND3X1 U63 ( .A(state[3]), .B(n46), .C(n58), .Y(n8) );
  NOR2X1 U64 ( .A(state[2]), .B(state[1]), .Y(n58) );
  INVX1 U65 ( .A(n30), .Y(load_data) );
  NAND2X1 U66 ( .A(n53), .B(n55), .Y(n30) );
  NOR2X1 U67 ( .A(n52), .B(state[3]), .Y(n55) );
  INVX1 U68 ( .A(state[2]), .Y(n52) );
  NOR2X1 U69 ( .A(n46), .B(state[1]), .Y(n53) );
  INVX1 U70 ( .A(state[0]), .Y(n46) );
endmodule


module flex_counter_NUM_CNT_BITS5 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [4:0] rollover_val;
  output [4:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n25, n1, n2, n3, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41;

  DFFSR rollover_flag_reg ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  OAI22X1 U6 ( .A(n1), .B(n2), .C(n3), .D(n10), .Y(n37) );
  OAI22X1 U10 ( .A(n11), .B(n2), .C(n12), .D(n10), .Y(n38) );
  OAI22X1 U11 ( .A(n13), .B(n2), .C(n14), .D(n10), .Y(n39) );
  OAI22X1 U12 ( .A(n15), .B(n2), .C(n16), .D(n10), .Y(n40) );
  INVX1 U13 ( .A(count_out[1]), .Y(n15) );
  OAI22X1 U14 ( .A(n17), .B(n2), .C(n18), .D(n10), .Y(n41) );
  INVX1 U15 ( .A(n19), .Y(n10) );
  OAI22X1 U16 ( .A(n2), .B(n20), .C(n21), .D(n22), .Y(n25) );
  NAND3X1 U17 ( .A(n23), .B(n24), .C(n26), .Y(n22) );
  XOR2X1 U18 ( .A(n3), .B(rollover_val[4]), .Y(n26) );
  XOR2X1 U19 ( .A(n27), .B(n28), .Y(n3) );
  NOR2X1 U20 ( .A(rollover_flag), .B(n1), .Y(n28) );
  INVX1 U21 ( .A(count_out[4]), .Y(n1) );
  NAND2X1 U22 ( .A(n29), .B(n30), .Y(n27) );
  XOR2X1 U23 ( .A(n12), .B(rollover_val[3]), .Y(n24) );
  XNOR2X1 U24 ( .A(n30), .B(n29), .Y(n12) );
  NOR2X1 U25 ( .A(n13), .B(n31), .Y(n29) );
  NOR2X1 U26 ( .A(n11), .B(rollover_flag), .Y(n30) );
  INVX1 U27 ( .A(count_out[3]), .Y(n11) );
  XOR2X1 U28 ( .A(n16), .B(rollover_val[1]), .Y(n23) );
  XOR2X1 U29 ( .A(n32), .B(n18), .Y(n16) );
  NAND2X1 U30 ( .A(count_out[1]), .B(n20), .Y(n32) );
  NAND3X1 U31 ( .A(n19), .B(n33), .C(n34), .Y(n21) );
  XOR2X1 U32 ( .A(n14), .B(rollover_val[2]), .Y(n34) );
  XOR2X1 U33 ( .A(n31), .B(n35), .Y(n14) );
  NOR2X1 U34 ( .A(rollover_flag), .B(n13), .Y(n35) );
  INVX1 U35 ( .A(count_out[2]), .Y(n13) );
  NAND2X1 U36 ( .A(count_out[1]), .B(n18), .Y(n31) );
  XOR2X1 U37 ( .A(rollover_val[0]), .B(n18), .Y(n33) );
  NOR2X1 U38 ( .A(n17), .B(rollover_flag), .Y(n18) );
  INVX1 U39 ( .A(count_out[0]), .Y(n17) );
  NOR2X1 U40 ( .A(n36), .B(clear), .Y(n19) );
  INVX1 U41 ( .A(rollover_flag), .Y(n20) );
  INVX1 U42 ( .A(n36), .Y(n2) );
  NOR2X1 U43 ( .A(count_enable), .B(clear), .Y(n36) );
endmodule


module timer ( clk, n_rst, rising_edge_found, falling_edge_found, stop_found, 
        start_found, byte_received, ack_prep, check_ack, ack_done );
  input clk, n_rst, rising_edge_found, falling_edge_found, stop_found,
         start_found;
  output byte_received, ack_prep, check_ack, ack_done;
  wire   nxt_ack_prep, nxt_check_ack, nxt_ack_done, _1_net_, n4, n5, n6, n7,
         n8, n9;
  wire   [4:0] count;

  DFFSR ack_done_reg ( .D(nxt_ack_done), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ack_done) );
  DFFSR ack_prep_reg ( .D(nxt_ack_prep), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ack_prep) );
  DFFSR check_ack_reg ( .D(nxt_check_ack), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        check_ack) );
  flex_counter_NUM_CNT_BITS5 counter ( .clk(clk), .n_rst(n_rst), .clear(
        _1_net_), .count_enable(rising_edge_found), .rollover_val({1'b0, 1'b1, 
        1'b0, 1'b0, 1'b1}), .count_out(count) );
  AND2X1 U6 ( .A(rising_edge_found), .B(byte_received), .Y(nxt_check_ack) );
  AND2X1 U7 ( .A(byte_received), .B(falling_edge_found), .Y(nxt_ack_prep) );
  NOR2X1 U8 ( .A(n4), .B(n5), .Y(nxt_ack_done) );
  NAND2X1 U9 ( .A(falling_edge_found), .B(n6), .Y(n5) );
  INVX1 U10 ( .A(n7), .Y(n6) );
  INVX1 U11 ( .A(count[0]), .Y(n4) );
  NOR2X1 U12 ( .A(n7), .B(count[0]), .Y(byte_received) );
  NAND3X1 U13 ( .A(count[3]), .B(n8), .C(n9), .Y(n7) );
  NOR2X1 U14 ( .A(count[4]), .B(count[2]), .Y(n9) );
  INVX1 U15 ( .A(count[1]), .Y(n8) );
  OR2X1 U16 ( .A(start_found), .B(stop_found), .Y(_1_net_) );
endmodule


module decode ( clk, n_rst, scl, sda_in, starting_byte, rw_mode, address_match, 
        stop_found, start_found );
  input [7:0] starting_byte;
  input clk, n_rst, scl, sda_in;
  output rw_mode, address_match, stop_found, start_found;
  wire   Q1, old_sample_sda, new_sample_sda, Q2, old_sample_scl,
         new_sample_scl, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  assign rw_mode = starting_byte[0];

  DFFSR Q1_reg ( .D(sda_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q1) );
  DFFSR new_sample_sda_reg ( .D(Q1), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample_sda) );
  DFFSR old_sample_sda_reg ( .D(new_sample_sda), .CLK(clk), .R(1'b1), .S(n_rst), .Q(old_sample_sda) );
  DFFSR Q2_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q2) );
  DFFSR new_sample_scl_reg ( .D(Q2), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample_scl) );
  DFFSR old_sample_scl_reg ( .D(new_sample_scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(old_sample_scl) );
  NOR2X1 U9 ( .A(n7), .B(n8), .Y(stop_found) );
  NAND2X1 U10 ( .A(old_sample_scl), .B(new_sample_sda), .Y(n8) );
  NAND2X1 U11 ( .A(new_sample_scl), .B(n9), .Y(n7) );
  INVX1 U12 ( .A(old_sample_sda), .Y(n9) );
  NOR2X1 U13 ( .A(n10), .B(n11), .Y(start_found) );
  NAND2X1 U14 ( .A(old_sample_sda), .B(old_sample_scl), .Y(n11) );
  NAND2X1 U15 ( .A(new_sample_scl), .B(n12), .Y(n10) );
  INVX1 U16 ( .A(new_sample_sda), .Y(n12) );
  NOR2X1 U17 ( .A(n13), .B(n14), .Y(address_match) );
  NAND3X1 U18 ( .A(starting_byte[6]), .B(starting_byte[5]), .C(
        starting_byte[7]), .Y(n14) );
  NAND3X1 U19 ( .A(starting_byte[4]), .B(n15), .C(n16), .Y(n13) );
  NOR2X1 U20 ( .A(starting_byte[3]), .B(starting_byte[2]), .Y(n16) );
  INVX1 U21 ( .A(starting_byte[1]), .Y(n15) );
endmodule


module flex_stp_sr_NUM_BITS8 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6, n7,
         n8;

  DFFSR \parallel_out_reg[0]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[7]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  INVX1 U2 ( .A(n1), .Y(n26) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n24) );
  MUX2X1 U5 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n20) );
  MUX2X1 U9 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n18) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n16) );
  MUX2X1 U13 ( .B(parallel_out[5]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n14) );
  MUX2X1 U15 ( .B(parallel_out[6]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n12) );
  MUX2X1 U17 ( .B(parallel_out[7]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n8) );
endmodule


module rx_sr ( clk, n_rst, sda_in, rising_edge_found, rx_enable, rx_data );
  output [7:0] rx_data;
  input clk, n_rst, sda_in, rising_edge_found, rx_enable;
  wire   _0_net_;

  flex_stp_sr_NUM_BITS8 stp ( .clk(clk), .n_rst(n_rst), .shift_enable(_0_net_), 
        .serial_in(sda_in), .parallel_out(rx_data) );
  AND2X1 U1 ( .A(rx_enable), .B(rising_edge_found), .Y(_0_net_) );
endmodule


module flex_pts_sr_NUM_BITS8 ( clk, n_rst, shift_enable, load_enable, 
        parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [6:0] curr_parallel_in;

  DFFSR \curr_parallel_in_reg[0]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[0]) );
  DFFSR \curr_parallel_in_reg[1]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[1]) );
  DFFSR \curr_parallel_in_reg[2]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[2]) );
  DFFSR \curr_parallel_in_reg[3]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[3]) );
  DFFSR \curr_parallel_in_reg[4]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[4]) );
  DFFSR \curr_parallel_in_reg[5]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[5]) );
  DFFSR \curr_parallel_in_reg[6]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(curr_parallel_in[6]) );
  DFFSR \curr_parallel_in_reg[7]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(serial_out) );
  NAND2X1 U11 ( .A(n9), .B(n10), .Y(n35) );
  INVX1 U12 ( .A(n11), .Y(n10) );
  MUX2X1 U13 ( .B(parallel_in[0]), .A(curr_parallel_in[0]), .S(n12), .Y(n9) );
  OAI21X1 U14 ( .A(n13), .B(n14), .C(n15), .Y(n34) );
  AOI22X1 U15 ( .A(n11), .B(curr_parallel_in[0]), .C(curr_parallel_in[1]), .D(
        n12), .Y(n15) );
  INVX1 U16 ( .A(parallel_in[1]), .Y(n14) );
  OAI21X1 U17 ( .A(n13), .B(n16), .C(n17), .Y(n33) );
  AOI22X1 U18 ( .A(curr_parallel_in[1]), .B(n11), .C(curr_parallel_in[2]), .D(
        n12), .Y(n17) );
  INVX1 U19 ( .A(parallel_in[2]), .Y(n16) );
  OAI21X1 U20 ( .A(n13), .B(n18), .C(n19), .Y(n32) );
  AOI22X1 U21 ( .A(curr_parallel_in[2]), .B(n11), .C(curr_parallel_in[3]), .D(
        n12), .Y(n19) );
  INVX1 U22 ( .A(parallel_in[3]), .Y(n18) );
  OAI21X1 U23 ( .A(n13), .B(n20), .C(n21), .Y(n31) );
  AOI22X1 U24 ( .A(curr_parallel_in[3]), .B(n11), .C(curr_parallel_in[4]), .D(
        n12), .Y(n21) );
  INVX1 U25 ( .A(parallel_in[4]), .Y(n20) );
  OAI21X1 U26 ( .A(n13), .B(n22), .C(n23), .Y(n30) );
  AOI22X1 U27 ( .A(curr_parallel_in[4]), .B(n11), .C(curr_parallel_in[5]), .D(
        n12), .Y(n23) );
  INVX1 U28 ( .A(parallel_in[5]), .Y(n22) );
  OAI21X1 U29 ( .A(n13), .B(n24), .C(n25), .Y(n29) );
  AOI22X1 U30 ( .A(curr_parallel_in[5]), .B(n11), .C(curr_parallel_in[6]), .D(
        n12), .Y(n25) );
  INVX1 U31 ( .A(parallel_in[6]), .Y(n24) );
  OAI21X1 U32 ( .A(n13), .B(n26), .C(n27), .Y(n28) );
  AOI22X1 U33 ( .A(curr_parallel_in[6]), .B(n11), .C(serial_out), .D(n12), .Y(
        n27) );
  NOR2X1 U34 ( .A(n12), .B(load_enable), .Y(n11) );
  NOR2X1 U35 ( .A(shift_enable), .B(load_enable), .Y(n12) );
  INVX1 U36 ( .A(parallel_in[7]), .Y(n26) );
  INVX1 U37 ( .A(load_enable), .Y(n13) );
endmodule


module tx_sr ( clk, n_rst, falling_edge_found, tx_enable, tx_data, load_data, 
        tx_out );
  input [7:0] tx_data;
  input clk, n_rst, falling_edge_found, tx_enable, load_data;
  output tx_out;
  wire   _0_net_;

  flex_pts_sr_NUM_BITS8 pts ( .clk(clk), .n_rst(n_rst), .shift_enable(_0_net_), 
        .load_enable(load_data), .parallel_in(tx_data), .serial_out(tx_out) );
  AND2X1 U1 ( .A(tx_enable), .B(falling_edge_found), .Y(_0_net_) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   N10, N11, N12, N13, N14, N15, \fiforeg[0][7] , \fiforeg[0][6] ,
         \fiforeg[0][5] , \fiforeg[0][4] , \fiforeg[0][3] , \fiforeg[0][2] ,
         \fiforeg[0][1] , \fiforeg[0][0] , \fiforeg[1][7] , \fiforeg[1][6] ,
         \fiforeg[1][5] , \fiforeg[1][4] , \fiforeg[1][3] , \fiforeg[1][2] ,
         \fiforeg[1][1] , \fiforeg[1][0] , \fiforeg[2][7] , \fiforeg[2][6] ,
         \fiforeg[2][5] , \fiforeg[2][4] , \fiforeg[2][3] , \fiforeg[2][2] ,
         \fiforeg[2][1] , \fiforeg[2][0] , \fiforeg[3][7] , \fiforeg[3][6] ,
         \fiforeg[3][5] , \fiforeg[3][4] , \fiforeg[3][3] , \fiforeg[3][2] ,
         \fiforeg[3][1] , \fiforeg[3][0] , \fiforeg[4][7] , \fiforeg[4][6] ,
         \fiforeg[4][5] , \fiforeg[4][4] , \fiforeg[4][3] , \fiforeg[4][2] ,
         \fiforeg[4][1] , \fiforeg[4][0] , \fiforeg[5][7] , \fiforeg[5][6] ,
         \fiforeg[5][5] , \fiforeg[5][4] , \fiforeg[5][3] , \fiforeg[5][2] ,
         \fiforeg[5][1] , \fiforeg[5][0] , \fiforeg[6][7] , \fiforeg[6][6] ,
         \fiforeg[6][5] , \fiforeg[6][4] , \fiforeg[6][3] , \fiforeg[6][2] ,
         \fiforeg[6][1] , \fiforeg[6][0] , \fiforeg[7][7] , \fiforeg[7][6] ,
         \fiforeg[7][5] , \fiforeg[7][4] , \fiforeg[7][3] , \fiforeg[7][2] ,
         \fiforeg[7][1] , \fiforeg[7][0] , N17, N18, N19, N20, N21, N22, N23,
         N24, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = waddr[0];
  assign N14 = waddr[1];
  assign N15 = waddr[2];

  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n152), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n151), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n150), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n149), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n148), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n147), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n146), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n145), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n144), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n143), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n142), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n141), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n140), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n139), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n138), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n137), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n136), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n135), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n134), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n133), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n132), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n131), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n130), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n129), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n128), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n127), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n126), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n125), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n124), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n123), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n122), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n121), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n120), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n119), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n118), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n117), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n116), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n115), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n114), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n113), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n112), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n111), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n110), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n109), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n108), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n107), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n106), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n105), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n104), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n103), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n102), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n101), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n100), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n99), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n98), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n97), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n96), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n95), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n94), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n93), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n92), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n91), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n90), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n89), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  BUFX2 U2 ( .A(n54), .Y(n1) );
  BUFX2 U3 ( .A(n56), .Y(n2) );
  BUFX2 U4 ( .A(n175), .Y(n3) );
  BUFX2 U5 ( .A(n53), .Y(n4) );
  BUFX2 U6 ( .A(n172), .Y(n5) );
  BUFX2 U7 ( .A(n173), .Y(n6) );
  BUFX2 U8 ( .A(n55), .Y(n7) );
  BUFX2 U9 ( .A(n174), .Y(n8) );
  NOR2X1 U10 ( .A(n63), .B(N11), .Y(n54) );
  NOR2X1 U11 ( .A(n63), .B(n62), .Y(n53) );
  AOI22X1 U12 ( .A(\fiforeg[4][0] ), .B(n1), .C(\fiforeg[6][0] ), .D(n4), .Y(
        n10) );
  NOR2X1 U13 ( .A(N11), .B(N12), .Y(n56) );
  NOR2X1 U14 ( .A(n62), .B(N12), .Y(n55) );
  AOI22X1 U15 ( .A(\fiforeg[0][0] ), .B(n2), .C(\fiforeg[2][0] ), .D(n7), .Y(
        n9) );
  AOI21X1 U16 ( .A(n10), .B(n9), .C(N10), .Y(n14) );
  AOI22X1 U17 ( .A(\fiforeg[5][0] ), .B(n1), .C(\fiforeg[7][0] ), .D(n4), .Y(
        n12) );
  AOI22X1 U18 ( .A(\fiforeg[1][0] ), .B(n2), .C(\fiforeg[3][0] ), .D(n7), .Y(
        n11) );
  AOI21X1 U19 ( .A(n12), .B(n11), .C(n61), .Y(n13) );
  OR2X1 U20 ( .A(n14), .B(n13), .Y(rdata[0]) );
  AOI22X1 U21 ( .A(\fiforeg[4][1] ), .B(n1), .C(\fiforeg[6][1] ), .D(n4), .Y(
        n16) );
  AOI22X1 U22 ( .A(\fiforeg[0][1] ), .B(n2), .C(\fiforeg[2][1] ), .D(n7), .Y(
        n15) );
  AOI21X1 U23 ( .A(n16), .B(n15), .C(N10), .Y(n20) );
  AOI22X1 U24 ( .A(\fiforeg[5][1] ), .B(n1), .C(\fiforeg[7][1] ), .D(n4), .Y(
        n18) );
  AOI22X1 U25 ( .A(\fiforeg[1][1] ), .B(n2), .C(\fiforeg[3][1] ), .D(n7), .Y(
        n17) );
  AOI21X1 U26 ( .A(n18), .B(n17), .C(n61), .Y(n19) );
  OR2X1 U27 ( .A(n20), .B(n19), .Y(rdata[1]) );
  AOI22X1 U28 ( .A(\fiforeg[4][2] ), .B(n1), .C(\fiforeg[6][2] ), .D(n4), .Y(
        n22) );
  AOI22X1 U29 ( .A(\fiforeg[0][2] ), .B(n2), .C(\fiforeg[2][2] ), .D(n7), .Y(
        n21) );
  AOI21X1 U30 ( .A(n22), .B(n21), .C(N10), .Y(n26) );
  AOI22X1 U31 ( .A(\fiforeg[5][2] ), .B(n1), .C(\fiforeg[7][2] ), .D(n4), .Y(
        n24) );
  AOI22X1 U32 ( .A(\fiforeg[1][2] ), .B(n2), .C(\fiforeg[3][2] ), .D(n7), .Y(
        n23) );
  AOI21X1 U33 ( .A(n24), .B(n23), .C(n61), .Y(n25) );
  OR2X1 U34 ( .A(n26), .B(n25), .Y(rdata[2]) );
  AOI22X1 U35 ( .A(\fiforeg[4][3] ), .B(n1), .C(\fiforeg[6][3] ), .D(n4), .Y(
        n28) );
  AOI22X1 U36 ( .A(\fiforeg[0][3] ), .B(n2), .C(\fiforeg[2][3] ), .D(n7), .Y(
        n27) );
  AOI21X1 U37 ( .A(n28), .B(n27), .C(N10), .Y(n32) );
  AOI22X1 U38 ( .A(\fiforeg[5][3] ), .B(n1), .C(\fiforeg[7][3] ), .D(n4), .Y(
        n30) );
  AOI22X1 U39 ( .A(\fiforeg[1][3] ), .B(n2), .C(\fiforeg[3][3] ), .D(n7), .Y(
        n29) );
  AOI21X1 U40 ( .A(n30), .B(n29), .C(n61), .Y(n31) );
  OR2X1 U41 ( .A(n32), .B(n31), .Y(rdata[3]) );
  AOI22X1 U42 ( .A(\fiforeg[4][4] ), .B(n1), .C(\fiforeg[6][4] ), .D(n4), .Y(
        n34) );
  AOI22X1 U43 ( .A(\fiforeg[0][4] ), .B(n2), .C(\fiforeg[2][4] ), .D(n7), .Y(
        n33) );
  AOI21X1 U44 ( .A(n34), .B(n33), .C(N10), .Y(n38) );
  AOI22X1 U45 ( .A(\fiforeg[5][4] ), .B(n1), .C(\fiforeg[7][4] ), .D(n4), .Y(
        n36) );
  AOI22X1 U46 ( .A(\fiforeg[1][4] ), .B(n2), .C(\fiforeg[3][4] ), .D(n7), .Y(
        n35) );
  AOI21X1 U47 ( .A(n36), .B(n35), .C(n61), .Y(n37) );
  OR2X1 U48 ( .A(n38), .B(n37), .Y(rdata[4]) );
  AOI22X1 U49 ( .A(\fiforeg[4][5] ), .B(n1), .C(\fiforeg[6][5] ), .D(n4), .Y(
        n40) );
  AOI22X1 U50 ( .A(\fiforeg[0][5] ), .B(n2), .C(\fiforeg[2][5] ), .D(n7), .Y(
        n39) );
  AOI21X1 U51 ( .A(n40), .B(n39), .C(N10), .Y(n44) );
  AOI22X1 U52 ( .A(\fiforeg[5][5] ), .B(n1), .C(\fiforeg[7][5] ), .D(n4), .Y(
        n42) );
  AOI22X1 U53 ( .A(\fiforeg[1][5] ), .B(n2), .C(\fiforeg[3][5] ), .D(n7), .Y(
        n41) );
  AOI21X1 U54 ( .A(n42), .B(n41), .C(n61), .Y(n43) );
  OR2X1 U55 ( .A(n44), .B(n43), .Y(rdata[5]) );
  AOI22X1 U56 ( .A(\fiforeg[4][6] ), .B(n1), .C(\fiforeg[6][6] ), .D(n4), .Y(
        n46) );
  AOI22X1 U57 ( .A(\fiforeg[0][6] ), .B(n2), .C(\fiforeg[2][6] ), .D(n7), .Y(
        n45) );
  AOI21X1 U58 ( .A(n46), .B(n45), .C(N10), .Y(n50) );
  AOI22X1 U59 ( .A(\fiforeg[5][6] ), .B(n1), .C(\fiforeg[7][6] ), .D(n4), .Y(
        n48) );
  AOI22X1 U60 ( .A(\fiforeg[1][6] ), .B(n2), .C(\fiforeg[3][6] ), .D(n7), .Y(
        n47) );
  AOI21X1 U61 ( .A(n48), .B(n47), .C(n61), .Y(n49) );
  OR2X1 U62 ( .A(n50), .B(n49), .Y(rdata[6]) );
  AOI22X1 U63 ( .A(\fiforeg[4][7] ), .B(n1), .C(\fiforeg[6][7] ), .D(n4), .Y(
        n52) );
  AOI22X1 U64 ( .A(\fiforeg[0][7] ), .B(n2), .C(\fiforeg[2][7] ), .D(n7), .Y(
        n51) );
  AOI21X1 U65 ( .A(n52), .B(n51), .C(N10), .Y(n60) );
  AOI22X1 U66 ( .A(\fiforeg[5][7] ), .B(n1), .C(\fiforeg[7][7] ), .D(n4), .Y(
        n58) );
  AOI22X1 U67 ( .A(\fiforeg[1][7] ), .B(n2), .C(\fiforeg[3][7] ), .D(n7), .Y(
        n57) );
  AOI21X1 U68 ( .A(n58), .B(n57), .C(n61), .Y(n59) );
  OR2X1 U69 ( .A(n60), .B(n59), .Y(rdata[7]) );
  INVX2 U70 ( .A(N10), .Y(n61) );
  INVX2 U71 ( .A(N11), .Y(n62) );
  INVX2 U72 ( .A(N12), .Y(n63) );
  NOR2X1 U73 ( .A(n211), .B(N14), .Y(n173) );
  NOR2X1 U74 ( .A(n211), .B(n180), .Y(n172) );
  AOI22X1 U75 ( .A(\fiforeg[4][0] ), .B(n6), .C(\fiforeg[6][0] ), .D(n5), .Y(
        n65) );
  NOR2X1 U76 ( .A(N14), .B(N15), .Y(n175) );
  NOR2X1 U77 ( .A(n180), .B(N15), .Y(n174) );
  AOI22X1 U78 ( .A(\fiforeg[0][0] ), .B(n3), .C(\fiforeg[2][0] ), .D(n8), .Y(
        n64) );
  AOI21X1 U79 ( .A(n65), .B(n64), .C(N13), .Y(n69) );
  AOI22X1 U80 ( .A(\fiforeg[5][0] ), .B(n6), .C(\fiforeg[7][0] ), .D(n5), .Y(
        n67) );
  AOI22X1 U81 ( .A(\fiforeg[1][0] ), .B(n3), .C(\fiforeg[3][0] ), .D(n8), .Y(
        n66) );
  AOI21X1 U82 ( .A(n67), .B(n66), .C(n212), .Y(n68) );
  OR2X1 U83 ( .A(n69), .B(n68), .Y(N24) );
  AOI22X1 U84 ( .A(\fiforeg[4][1] ), .B(n6), .C(\fiforeg[6][1] ), .D(n5), .Y(
        n71) );
  AOI22X1 U85 ( .A(\fiforeg[0][1] ), .B(n3), .C(\fiforeg[2][1] ), .D(n8), .Y(
        n70) );
  AOI21X1 U86 ( .A(n71), .B(n70), .C(N13), .Y(n75) );
  AOI22X1 U87 ( .A(\fiforeg[5][1] ), .B(n6), .C(\fiforeg[7][1] ), .D(n5), .Y(
        n73) );
  AOI22X1 U88 ( .A(\fiforeg[1][1] ), .B(n3), .C(\fiforeg[3][1] ), .D(n8), .Y(
        n72) );
  AOI21X1 U89 ( .A(n73), .B(n72), .C(n212), .Y(n74) );
  OR2X1 U90 ( .A(n75), .B(n74), .Y(N23) );
  AOI22X1 U91 ( .A(\fiforeg[4][2] ), .B(n6), .C(\fiforeg[6][2] ), .D(n5), .Y(
        n77) );
  AOI22X1 U92 ( .A(\fiforeg[0][2] ), .B(n3), .C(\fiforeg[2][2] ), .D(n8), .Y(
        n76) );
  AOI21X1 U93 ( .A(n77), .B(n76), .C(N13), .Y(n81) );
  AOI22X1 U94 ( .A(\fiforeg[5][2] ), .B(n6), .C(\fiforeg[7][2] ), .D(n5), .Y(
        n79) );
  AOI22X1 U95 ( .A(\fiforeg[1][2] ), .B(n3), .C(\fiforeg[3][2] ), .D(n8), .Y(
        n78) );
  AOI21X1 U96 ( .A(n79), .B(n78), .C(n212), .Y(n80) );
  OR2X1 U97 ( .A(n81), .B(n80), .Y(N22) );
  AOI22X1 U98 ( .A(\fiforeg[4][3] ), .B(n6), .C(\fiforeg[6][3] ), .D(n5), .Y(
        n83) );
  AOI22X1 U99 ( .A(\fiforeg[0][3] ), .B(n3), .C(\fiforeg[2][3] ), .D(n8), .Y(
        n82) );
  AOI21X1 U100 ( .A(n83), .B(n82), .C(N13), .Y(n87) );
  AOI22X1 U101 ( .A(\fiforeg[5][3] ), .B(n6), .C(\fiforeg[7][3] ), .D(n5), .Y(
        n85) );
  AOI22X1 U102 ( .A(\fiforeg[1][3] ), .B(n3), .C(\fiforeg[3][3] ), .D(n8), .Y(
        n84) );
  AOI21X1 U103 ( .A(n85), .B(n84), .C(n212), .Y(n86) );
  OR2X1 U104 ( .A(n87), .B(n86), .Y(N21) );
  AOI22X1 U105 ( .A(\fiforeg[4][4] ), .B(n6), .C(\fiforeg[6][4] ), .D(n5), .Y(
        n153) );
  AOI22X1 U106 ( .A(\fiforeg[0][4] ), .B(n3), .C(\fiforeg[2][4] ), .D(n8), .Y(
        n88) );
  AOI21X1 U107 ( .A(n153), .B(n88), .C(N13), .Y(n157) );
  AOI22X1 U108 ( .A(\fiforeg[5][4] ), .B(n6), .C(\fiforeg[7][4] ), .D(n5), .Y(
        n155) );
  AOI22X1 U109 ( .A(\fiforeg[1][4] ), .B(n3), .C(\fiforeg[3][4] ), .D(n8), .Y(
        n154) );
  AOI21X1 U110 ( .A(n155), .B(n154), .C(n212), .Y(n156) );
  OR2X1 U111 ( .A(n157), .B(n156), .Y(N20) );
  AOI22X1 U112 ( .A(\fiforeg[4][5] ), .B(n6), .C(\fiforeg[6][5] ), .D(n5), .Y(
        n159) );
  AOI22X1 U113 ( .A(\fiforeg[0][5] ), .B(n3), .C(\fiforeg[2][5] ), .D(n8), .Y(
        n158) );
  AOI21X1 U114 ( .A(n159), .B(n158), .C(N13), .Y(n163) );
  AOI22X1 U115 ( .A(\fiforeg[5][5] ), .B(n6), .C(\fiforeg[7][5] ), .D(n5), .Y(
        n161) );
  AOI22X1 U116 ( .A(\fiforeg[1][5] ), .B(n3), .C(\fiforeg[3][5] ), .D(n8), .Y(
        n160) );
  AOI21X1 U117 ( .A(n161), .B(n160), .C(n212), .Y(n162) );
  OR2X1 U118 ( .A(n163), .B(n162), .Y(N19) );
  AOI22X1 U119 ( .A(\fiforeg[4][6] ), .B(n6), .C(\fiforeg[6][6] ), .D(n5), .Y(
        n165) );
  AOI22X1 U120 ( .A(\fiforeg[0][6] ), .B(n3), .C(\fiforeg[2][6] ), .D(n8), .Y(
        n164) );
  AOI21X1 U121 ( .A(n165), .B(n164), .C(N13), .Y(n169) );
  AOI22X1 U122 ( .A(\fiforeg[5][6] ), .B(n6), .C(\fiforeg[7][6] ), .D(n5), .Y(
        n167) );
  AOI22X1 U123 ( .A(\fiforeg[1][6] ), .B(n3), .C(\fiforeg[3][6] ), .D(n8), .Y(
        n166) );
  AOI21X1 U124 ( .A(n167), .B(n166), .C(n212), .Y(n168) );
  OR2X1 U125 ( .A(n169), .B(n168), .Y(N18) );
  AOI22X1 U126 ( .A(\fiforeg[4][7] ), .B(n6), .C(\fiforeg[6][7] ), .D(n5), .Y(
        n171) );
  AOI22X1 U127 ( .A(\fiforeg[0][7] ), .B(n3), .C(\fiforeg[2][7] ), .D(n8), .Y(
        n170) );
  AOI21X1 U128 ( .A(n171), .B(n170), .C(N13), .Y(n179) );
  AOI22X1 U129 ( .A(\fiforeg[5][7] ), .B(n6), .C(\fiforeg[7][7] ), .D(n5), .Y(
        n177) );
  AOI22X1 U130 ( .A(\fiforeg[1][7] ), .B(n3), .C(\fiforeg[3][7] ), .D(n8), .Y(
        n176) );
  AOI21X1 U131 ( .A(n177), .B(n176), .C(n212), .Y(n178) );
  OR2X1 U132 ( .A(n179), .B(n178), .Y(N17) );
  INVX2 U133 ( .A(N14), .Y(n180) );
  MUX2X1 U134 ( .B(n181), .A(n182), .S(n183), .Y(n99) );
  INVX1 U135 ( .A(\fiforeg[6][2] ), .Y(n182) );
  MUX2X1 U136 ( .B(n184), .A(n185), .S(n183), .Y(n98) );
  INVX1 U137 ( .A(\fiforeg[6][1] ), .Y(n185) );
  MUX2X1 U138 ( .B(n186), .A(n187), .S(n183), .Y(n97) );
  INVX1 U139 ( .A(\fiforeg[6][0] ), .Y(n187) );
  MUX2X1 U140 ( .B(n188), .A(n189), .S(n190), .Y(n96) );
  INVX1 U141 ( .A(\fiforeg[7][7] ), .Y(n189) );
  MUX2X1 U142 ( .B(n191), .A(n192), .S(n190), .Y(n95) );
  INVX1 U143 ( .A(\fiforeg[7][6] ), .Y(n192) );
  MUX2X1 U144 ( .B(n193), .A(n194), .S(n190), .Y(n94) );
  INVX1 U145 ( .A(\fiforeg[7][5] ), .Y(n194) );
  MUX2X1 U146 ( .B(n195), .A(n196), .S(n190), .Y(n93) );
  INVX1 U147 ( .A(\fiforeg[7][4] ), .Y(n196) );
  MUX2X1 U148 ( .B(n197), .A(n198), .S(n190), .Y(n92) );
  INVX1 U149 ( .A(\fiforeg[7][3] ), .Y(n198) );
  MUX2X1 U150 ( .B(n181), .A(n199), .S(n190), .Y(n91) );
  INVX1 U151 ( .A(\fiforeg[7][2] ), .Y(n199) );
  MUX2X1 U152 ( .B(n184), .A(n200), .S(n190), .Y(n90) );
  INVX1 U153 ( .A(\fiforeg[7][1] ), .Y(n200) );
  MUX2X1 U154 ( .B(n186), .A(n201), .S(n190), .Y(n89) );
  NAND3X1 U155 ( .A(N15), .B(N14), .C(N13), .Y(n190) );
  INVX1 U156 ( .A(\fiforeg[7][0] ), .Y(n201) );
  MUX2X1 U157 ( .B(n188), .A(n202), .S(n203), .Y(n152) );
  INVX1 U158 ( .A(\fiforeg[0][7] ), .Y(n202) );
  MUX2X1 U159 ( .B(n191), .A(n204), .S(n203), .Y(n151) );
  INVX1 U160 ( .A(\fiforeg[0][6] ), .Y(n204) );
  MUX2X1 U161 ( .B(n193), .A(n205), .S(n203), .Y(n150) );
  INVX1 U162 ( .A(\fiforeg[0][5] ), .Y(n205) );
  MUX2X1 U163 ( .B(n195), .A(n206), .S(n203), .Y(n149) );
  INVX1 U164 ( .A(\fiforeg[0][4] ), .Y(n206) );
  MUX2X1 U165 ( .B(n197), .A(n207), .S(n203), .Y(n148) );
  INVX1 U166 ( .A(\fiforeg[0][3] ), .Y(n207) );
  MUX2X1 U167 ( .B(n181), .A(n208), .S(n203), .Y(n147) );
  INVX1 U168 ( .A(\fiforeg[0][2] ), .Y(n208) );
  MUX2X1 U169 ( .B(n184), .A(n209), .S(n203), .Y(n146) );
  INVX1 U170 ( .A(\fiforeg[0][1] ), .Y(n209) );
  MUX2X1 U171 ( .B(n186), .A(n210), .S(n203), .Y(n145) );
  NAND3X1 U172 ( .A(n180), .B(n211), .C(n212), .Y(n203) );
  INVX1 U173 ( .A(\fiforeg[0][0] ), .Y(n210) );
  MUX2X1 U174 ( .B(n188), .A(n213), .S(n214), .Y(n144) );
  INVX1 U175 ( .A(\fiforeg[1][7] ), .Y(n213) );
  MUX2X1 U176 ( .B(n191), .A(n215), .S(n214), .Y(n143) );
  INVX1 U177 ( .A(\fiforeg[1][6] ), .Y(n215) );
  MUX2X1 U178 ( .B(n193), .A(n216), .S(n214), .Y(n142) );
  INVX1 U179 ( .A(\fiforeg[1][5] ), .Y(n216) );
  MUX2X1 U180 ( .B(n195), .A(n217), .S(n214), .Y(n141) );
  INVX1 U181 ( .A(\fiforeg[1][4] ), .Y(n217) );
  MUX2X1 U182 ( .B(n197), .A(n218), .S(n214), .Y(n140) );
  INVX1 U183 ( .A(\fiforeg[1][3] ), .Y(n218) );
  MUX2X1 U184 ( .B(n181), .A(n219), .S(n214), .Y(n139) );
  INVX1 U185 ( .A(\fiforeg[1][2] ), .Y(n219) );
  MUX2X1 U186 ( .B(n184), .A(n220), .S(n214), .Y(n138) );
  INVX1 U187 ( .A(\fiforeg[1][1] ), .Y(n220) );
  MUX2X1 U188 ( .B(n186), .A(n221), .S(n214), .Y(n137) );
  NAND3X1 U189 ( .A(n180), .B(n211), .C(N13), .Y(n214) );
  INVX1 U190 ( .A(\fiforeg[1][0] ), .Y(n221) );
  MUX2X1 U191 ( .B(n188), .A(n222), .S(n223), .Y(n136) );
  INVX1 U192 ( .A(\fiforeg[2][7] ), .Y(n222) );
  MUX2X1 U193 ( .B(n191), .A(n224), .S(n223), .Y(n135) );
  INVX1 U194 ( .A(\fiforeg[2][6] ), .Y(n224) );
  MUX2X1 U195 ( .B(n193), .A(n225), .S(n223), .Y(n134) );
  INVX1 U196 ( .A(\fiforeg[2][5] ), .Y(n225) );
  MUX2X1 U197 ( .B(n195), .A(n226), .S(n223), .Y(n133) );
  INVX1 U198 ( .A(\fiforeg[2][4] ), .Y(n226) );
  MUX2X1 U199 ( .B(n197), .A(n227), .S(n223), .Y(n132) );
  INVX1 U200 ( .A(\fiforeg[2][3] ), .Y(n227) );
  MUX2X1 U201 ( .B(n181), .A(n228), .S(n223), .Y(n131) );
  INVX1 U202 ( .A(\fiforeg[2][2] ), .Y(n228) );
  MUX2X1 U203 ( .B(n184), .A(n229), .S(n223), .Y(n130) );
  INVX1 U204 ( .A(\fiforeg[2][1] ), .Y(n229) );
  MUX2X1 U205 ( .B(n186), .A(n230), .S(n223), .Y(n129) );
  NAND3X1 U206 ( .A(n212), .B(n211), .C(N14), .Y(n223) );
  INVX1 U207 ( .A(\fiforeg[2][0] ), .Y(n230) );
  MUX2X1 U208 ( .B(n188), .A(n231), .S(n232), .Y(n128) );
  INVX1 U209 ( .A(\fiforeg[3][7] ), .Y(n231) );
  MUX2X1 U210 ( .B(n191), .A(n233), .S(n232), .Y(n127) );
  INVX1 U211 ( .A(\fiforeg[3][6] ), .Y(n233) );
  MUX2X1 U212 ( .B(n193), .A(n234), .S(n232), .Y(n126) );
  INVX1 U213 ( .A(\fiforeg[3][5] ), .Y(n234) );
  MUX2X1 U214 ( .B(n195), .A(n235), .S(n232), .Y(n125) );
  INVX1 U215 ( .A(\fiforeg[3][4] ), .Y(n235) );
  MUX2X1 U216 ( .B(n197), .A(n236), .S(n232), .Y(n124) );
  INVX1 U217 ( .A(\fiforeg[3][3] ), .Y(n236) );
  MUX2X1 U218 ( .B(n181), .A(n237), .S(n232), .Y(n123) );
  INVX1 U219 ( .A(\fiforeg[3][2] ), .Y(n237) );
  MUX2X1 U220 ( .B(n184), .A(n238), .S(n232), .Y(n122) );
  INVX1 U221 ( .A(\fiforeg[3][1] ), .Y(n238) );
  MUX2X1 U222 ( .B(n186), .A(n239), .S(n232), .Y(n121) );
  NAND3X1 U223 ( .A(N14), .B(n211), .C(N13), .Y(n232) );
  INVX1 U224 ( .A(N15), .Y(n211) );
  INVX1 U225 ( .A(\fiforeg[3][0] ), .Y(n239) );
  MUX2X1 U226 ( .B(n188), .A(n240), .S(n241), .Y(n120) );
  INVX1 U227 ( .A(\fiforeg[4][7] ), .Y(n240) );
  MUX2X1 U228 ( .B(n191), .A(n242), .S(n241), .Y(n119) );
  INVX1 U229 ( .A(\fiforeg[4][6] ), .Y(n242) );
  MUX2X1 U230 ( .B(n193), .A(n243), .S(n241), .Y(n118) );
  INVX1 U231 ( .A(\fiforeg[4][5] ), .Y(n243) );
  MUX2X1 U232 ( .B(n195), .A(n244), .S(n241), .Y(n117) );
  INVX1 U233 ( .A(\fiforeg[4][4] ), .Y(n244) );
  MUX2X1 U234 ( .B(n197), .A(n245), .S(n241), .Y(n116) );
  INVX1 U235 ( .A(\fiforeg[4][3] ), .Y(n245) );
  MUX2X1 U236 ( .B(n181), .A(n246), .S(n241), .Y(n115) );
  INVX1 U237 ( .A(\fiforeg[4][2] ), .Y(n246) );
  MUX2X1 U238 ( .B(n184), .A(n247), .S(n241), .Y(n114) );
  INVX1 U239 ( .A(\fiforeg[4][1] ), .Y(n247) );
  MUX2X1 U240 ( .B(n186), .A(n248), .S(n241), .Y(n113) );
  NAND3X1 U241 ( .A(n212), .B(n180), .C(N15), .Y(n241) );
  INVX1 U242 ( .A(\fiforeg[4][0] ), .Y(n248) );
  MUX2X1 U243 ( .B(n188), .A(n249), .S(n250), .Y(n112) );
  INVX1 U244 ( .A(\fiforeg[5][7] ), .Y(n249) );
  MUX2X1 U245 ( .B(n191), .A(n251), .S(n250), .Y(n111) );
  INVX1 U246 ( .A(\fiforeg[5][6] ), .Y(n251) );
  MUX2X1 U247 ( .B(n193), .A(n252), .S(n250), .Y(n110) );
  INVX1 U248 ( .A(\fiforeg[5][5] ), .Y(n252) );
  MUX2X1 U249 ( .B(n195), .A(n253), .S(n250), .Y(n109) );
  INVX1 U250 ( .A(\fiforeg[5][4] ), .Y(n253) );
  MUX2X1 U251 ( .B(n197), .A(n254), .S(n250), .Y(n108) );
  INVX1 U252 ( .A(\fiforeg[5][3] ), .Y(n254) );
  MUX2X1 U253 ( .B(n181), .A(n255), .S(n250), .Y(n107) );
  INVX1 U254 ( .A(\fiforeg[5][2] ), .Y(n255) );
  MUX2X1 U255 ( .B(N22), .A(wdata[2]), .S(wenable), .Y(n181) );
  MUX2X1 U256 ( .B(n184), .A(n256), .S(n250), .Y(n106) );
  INVX1 U257 ( .A(\fiforeg[5][1] ), .Y(n256) );
  MUX2X1 U258 ( .B(N23), .A(wdata[1]), .S(wenable), .Y(n184) );
  MUX2X1 U259 ( .B(n186), .A(n257), .S(n250), .Y(n105) );
  NAND3X1 U260 ( .A(N15), .B(n180), .C(N13), .Y(n250) );
  INVX1 U261 ( .A(\fiforeg[5][0] ), .Y(n257) );
  MUX2X1 U262 ( .B(N24), .A(wdata[0]), .S(wenable), .Y(n186) );
  MUX2X1 U263 ( .B(n188), .A(n258), .S(n183), .Y(n104) );
  INVX1 U264 ( .A(\fiforeg[6][7] ), .Y(n258) );
  MUX2X1 U265 ( .B(N17), .A(wdata[7]), .S(wenable), .Y(n188) );
  MUX2X1 U266 ( .B(n191), .A(n259), .S(n183), .Y(n103) );
  INVX1 U267 ( .A(\fiforeg[6][6] ), .Y(n259) );
  MUX2X1 U268 ( .B(N18), .A(wdata[6]), .S(wenable), .Y(n191) );
  MUX2X1 U269 ( .B(n193), .A(n260), .S(n183), .Y(n102) );
  INVX1 U270 ( .A(\fiforeg[6][5] ), .Y(n260) );
  MUX2X1 U271 ( .B(N19), .A(wdata[5]), .S(wenable), .Y(n193) );
  MUX2X1 U272 ( .B(n195), .A(n261), .S(n183), .Y(n101) );
  INVX1 U273 ( .A(\fiforeg[6][4] ), .Y(n261) );
  MUX2X1 U274 ( .B(N20), .A(wdata[4]), .S(wenable), .Y(n195) );
  MUX2X1 U275 ( .B(n197), .A(n262), .S(n183), .Y(n100) );
  NAND3X1 U276 ( .A(N14), .B(n212), .C(N15), .Y(n183) );
  INVX1 U277 ( .A(N13), .Y(n212) );
  INVX1 U278 ( .A(\fiforeg[6][3] ), .Y(n262) );
  MUX2X1 U279 ( .B(N21), .A(wdata[3]), .S(wenable), .Y(n197) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n9, n10, n11, n12;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  XOR2X1 U11 ( .A(wptr_nxt[3]), .B(binary_nxt[2]), .Y(wptr_nxt[2]) );
  XNOR2X1 U12 ( .A(n9), .B(binary_r[3]), .Y(wptr_nxt[3]) );
  NAND2X1 U13 ( .A(binary_r[2]), .B(n10), .Y(n9) );
  XOR2X1 U14 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  XOR2X1 U15 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(wptr_nxt[0]) );
  XOR2X1 U16 ( .A(n10), .B(binary_r[2]), .Y(binary_nxt[2]) );
  INVX1 U17 ( .A(n11), .Y(n10) );
  NAND3X1 U18 ( .A(binary_r[1]), .B(binary_r[0]), .C(wenable), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(wenable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(wenable), .Y(binary_nxt[0]) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n22, \gray_wptr[2] , N5, n2, n3, n16, n17, n18, n19, n20, n21;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
  BUFX2 U15 ( .A(n22), .Y(wenable_fifo) );
  NOR2X1 U16 ( .A(full_flag), .B(n2), .Y(n22) );
  INVX1 U17 ( .A(wenable), .Y(n2) );
  NOR2X1 U18 ( .A(n3), .B(n16), .Y(N5) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Y(n16) );
  XOR2X1 U20 ( .A(n19), .B(\gray_wptr[2] ), .Y(n18) );
  XOR2X1 U21 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
  XNOR2X1 U22 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n19) );
  XNOR2X1 U23 ( .A(wrptr_r2[1]), .B(wptr_nxt[1]), .Y(n17) );
  NAND2X1 U24 ( .A(n20), .B(n21), .Y(n3) );
  XOR2X1 U25 ( .A(wrptr_r2[3]), .B(wptr_nxt[3]), .Y(n21) );
  XNOR2X1 U26 ( .A(wrptr_r2[0]), .B(wptr_nxt[0]), .Y(n20) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n9, n10, n11, n12;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  XOR2X1 U11 ( .A(rptr_nxt[3]), .B(binary_nxt[2]), .Y(rptr_nxt[2]) );
  XNOR2X1 U12 ( .A(n9), .B(binary_r[3]), .Y(rptr_nxt[3]) );
  NAND2X1 U13 ( .A(binary_r[2]), .B(n10), .Y(n9) );
  XOR2X1 U14 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XOR2X1 U15 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(rptr_nxt[0]) );
  XOR2X1 U16 ( .A(n10), .B(binary_r[2]), .Y(binary_nxt[2]) );
  INVX1 U17 ( .A(n11), .Y(n10) );
  NAND3X1 U18 ( .A(binary_r[1]), .B(binary_r[0]), .C(renable), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(renable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(renable), .Y(binary_nxt[0]) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n2, n3, n16, n17, n18, n19, n20;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  NOR2X1 U15 ( .A(empty_flag), .B(n1), .Y(renable_p2) );
  INVX1 U16 ( .A(renable), .Y(n1) );
  NOR2X1 U17 ( .A(n2), .B(n3), .Y(N3) );
  NAND2X1 U18 ( .A(n16), .B(n17), .Y(n3) );
  XOR2X1 U19 ( .A(n18), .B(\gray_rptr[2] ), .Y(n17) );
  XOR2X1 U20 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(\gray_rptr[2] ) );
  XNOR2X1 U21 ( .A(rwptr_r2[3]), .B(rwptr_r2[2]), .Y(n18) );
  XNOR2X1 U22 ( .A(rwptr_r2[1]), .B(rptr_nxt[1]), .Y(n16) );
  NAND2X1 U23 ( .A(n19), .B(n20), .Y(n2) );
  XNOR2X1 U24 ( .A(rwptr_r2[0]), .B(rptr_nxt[0]), .Y(n20) );
  XNOR2X1 U25 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n19) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module tx_fifo ( clk, n_rst, read_enable, write_enable, write_data, read_data, 
        fifo_empty, fifo_full );
  input [7:0] write_data;
  output [7:0] read_data;
  input clk, n_rst, read_enable, write_enable;
  output fifo_empty, fifo_full;


  fifo queue ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(read_enable), 
        .w_enable(write_enable), .w_data(write_data), .r_data(read_data), 
        .empty(fifo_empty), .full(fifo_full) );
endmodule


module scl_edge ( clk, n_rst, scl, rising_edge_found, falling_edge_found );
  input clk, n_rst, scl;
  output rising_edge_found, falling_edge_found;
  wire   Q1, old_sample, new_sample, n4;

  DFFSR Q1_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(Q1) );
  DFFSR new_sample_reg ( .D(Q1), .CLK(clk), .R(1'b1), .S(n_rst), .Q(new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  AND2X1 U6 ( .A(n4), .B(new_sample), .Y(rising_edge_found) );
  NOR2X1 U7 ( .A(new_sample), .B(n4), .Y(falling_edge_found) );
  INVX1 U8 ( .A(old_sample), .Y(n4) );
endmodule


module sda_sel ( tx_out, sda_mode, sda_out );
  input [1:0] sda_mode;
  input tx_out;
  output sda_out;
  wire   n1;

  NAND2X1 U3 ( .A(sda_mode[0]), .B(n1), .Y(sda_out) );
  NAND2X1 U4 ( .A(tx_out), .B(sda_mode[1]), .Y(n1) );
endmodule


module i2c_slave ( clk, n_rst, scl, sda_in, write_enable, write_data, sda_out, 
        fifo_empty, fifo_full );
  input [7:0] write_data;
  input clk, n_rst, scl, sda_in, write_enable;
  output sda_out, fifo_empty, fifo_full;
  wire   byte_received, ack_prep, check_ack, ack_done, rw_mode, address_match,
         stop_found, start_found, read_enable, load_data, tx_enable, rx_enable,
         falling_edge_found, rising_edge_found, tx_out;
  wire   [1:0] sda_mode;
  wire   [7:0] rx_data;
  wire   [7:0] read_data;

  controller controlla ( .clk(clk), .n_rst(n_rst), .stop_found(stop_found), 
        .start_found(start_found), .byte_received(byte_received), .ack_prep(
        ack_prep), .check_ack(check_ack), .ack_done(ack_done), .rw_mode(
        rw_mode), .address_match(address_match), .sda_in(sda_in), .rx_enable(
        rx_enable), .tx_enable(tx_enable), .read_enable(read_enable), 
        .sda_mode(sda_mode), .load_data(load_data) );
  timer timaa ( .clk(clk), .n_rst(n_rst), .rising_edge_found(rising_edge_found), .falling_edge_found(falling_edge_found), .stop_found(stop_found), 
        .start_found(start_found), .byte_received(byte_received), .ack_prep(
        ack_prep), .check_ack(check_ack), .ack_done(ack_done) );
  decode decoda ( .clk(clk), .n_rst(n_rst), .scl(scl), .sda_in(sda_in), 
        .starting_byte(rx_data), .rw_mode(rw_mode), .address_match(
        address_match), .stop_found(stop_found), .start_found(start_found) );
  rx_sr reada ( .clk(clk), .n_rst(n_rst), .sda_in(sda_in), .rising_edge_found(
        rising_edge_found), .rx_enable(rx_enable), .rx_data(rx_data) );
  tx_sr transmita ( .clk(clk), .n_rst(n_rst), .falling_edge_found(
        falling_edge_found), .tx_enable(tx_enable), .tx_data(read_data), 
        .load_data(load_data), .tx_out(tx_out) );
  tx_fifo fifa ( .clk(clk), .n_rst(n_rst), .read_enable(read_enable), 
        .write_enable(write_enable), .write_data(write_data), .read_data(
        read_data), .fifo_empty(fifo_empty), .fifo_full(fifo_full) );
  scl_edge edgecata ( .clk(clk), .n_rst(n_rst), .scl(scl), .rising_edge_found(
        rising_edge_found), .falling_edge_found(falling_edge_found) );
  sda_sel selecta ( .tx_out(tx_out), .sda_mode(sda_mode), .sda_out(sda_out) );
endmodule

