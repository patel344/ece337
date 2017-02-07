/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb  6 21:31:56 2017
/////////////////////////////////////////////////////////////


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  NAND3X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(next_state[2]) );
  NAND3X1 U7 ( .A(n7), .B(n8), .C(n5), .Y(next_state[1]) );
  NAND3X1 U8 ( .A(n9), .B(n4), .C(n10), .Y(next_state[0]) );
  AOI22X1 U9 ( .A(n11), .B(state[0]), .C(packet_done), .D(enable_timer), .Y(
        n10) );
  INVX1 U10 ( .A(n5), .Y(n11) );
  NAND3X1 U11 ( .A(n6), .B(n12), .C(state[1]), .Y(n5) );
  NAND3X1 U12 ( .A(n13), .B(n14), .C(n15), .Y(n4) );
  NOR2X1 U13 ( .A(framing_error), .B(n16), .Y(n15) );
  NAND3X1 U14 ( .A(n17), .B(n14), .C(start_bit_detected), .Y(n9) );
  NOR2X1 U15 ( .A(n16), .B(n18), .Y(load_buffer) );
  NAND2X1 U16 ( .A(state[0]), .B(n14), .Y(n18) );
  INVX1 U17 ( .A(n6), .Y(sbc_enable) );
  NAND3X1 U18 ( .A(state[0]), .B(n16), .C(state[1]), .Y(n6) );
  INVX1 U19 ( .A(n8), .Y(sbc_clear) );
  NAND3X1 U20 ( .A(n14), .B(n16), .C(state[0]), .Y(n8) );
  INVX1 U21 ( .A(state[1]), .Y(n14) );
  INVX1 U22 ( .A(n7), .Y(enable_timer) );
  NAND2X1 U23 ( .A(n17), .B(state[1]), .Y(n7) );
  INVX1 U24 ( .A(n12), .Y(n17) );
  NAND2X1 U25 ( .A(n13), .B(n16), .Y(n12) );
  INVX1 U26 ( .A(state[2]), .Y(n16) );
  INVX1 U27 ( .A(state[0]), .Y(n13) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n29, n30, n31, n32, n33, n1, n2, n3, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n34;

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
  OAI22X1 U8 ( .A(n1), .B(n2), .C(n3), .D(n9), .Y(n33) );
  NAND2X1 U9 ( .A(n10), .B(n11), .Y(n9) );
  XOR2X1 U10 ( .A(n12), .B(rollover_val[1]), .Y(n11) );
  XOR2X1 U11 ( .A(n13), .B(rollover_val[2]), .Y(n10) );
  NAND3X1 U12 ( .A(n14), .B(n15), .C(n16), .Y(n3) );
  XOR2X1 U13 ( .A(n17), .B(rollover_val[3]), .Y(n16) );
  XOR2X1 U14 ( .A(rollover_val[0]), .B(n18), .Y(n15) );
  OAI22X1 U15 ( .A(n19), .B(n1), .C(n18), .D(n20), .Y(n32) );
  OAI22X1 U16 ( .A(n21), .B(n1), .C(n12), .D(n20), .Y(n31) );
  OAI21X1 U17 ( .A(n18), .B(n22), .C(n23), .Y(n12) );
  NOR2X1 U18 ( .A(rollover_flag), .B(n21), .Y(n22) );
  INVX1 U19 ( .A(count_out[1]), .Y(n21) );
  OAI22X1 U20 ( .A(n24), .B(n1), .C(n13), .D(n20), .Y(n30) );
  XNOR2X1 U21 ( .A(n23), .B(n25), .Y(n13) );
  INVX1 U22 ( .A(count_out[2]), .Y(n24) );
  OAI22X1 U23 ( .A(n26), .B(n1), .C(n17), .D(n20), .Y(n29) );
  INVX1 U24 ( .A(n14), .Y(n20) );
  NOR2X1 U25 ( .A(n27), .B(clear), .Y(n14) );
  XOR2X1 U26 ( .A(n28), .B(n34), .Y(n17) );
  NOR2X1 U27 ( .A(n25), .B(n23), .Y(n34) );
  NAND2X1 U28 ( .A(count_out[1]), .B(n18), .Y(n23) );
  NOR2X1 U29 ( .A(n19), .B(rollover_flag), .Y(n18) );
  INVX1 U30 ( .A(count_out[0]), .Y(n19) );
  NAND2X1 U31 ( .A(count_out[2]), .B(n2), .Y(n25) );
  NAND2X1 U32 ( .A(count_out[3]), .B(n2), .Y(n28) );
  INVX1 U33 ( .A(rollover_flag), .Y(n2) );
  INVX1 U34 ( .A(n27), .Y(n1) );
  NOR2X1 U35 ( .A(count_enable), .B(clear), .Y(n27) );
  INVX1 U36 ( .A(count_out[3]), .Y(n26) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n34, n35, n36, n37, n38, n39;

  DFFSR rollover_flag_reg ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U8 ( .A(n1), .B(n2), .C(n3), .D(n9), .Y(n35) );
  NAND2X1 U9 ( .A(n10), .B(n11), .Y(n9) );
  XOR2X1 U10 ( .A(n12), .B(rollover_val[1]), .Y(n11) );
  XOR2X1 U11 ( .A(n13), .B(rollover_val[2]), .Y(n10) );
  NAND3X1 U12 ( .A(n14), .B(n15), .C(n16), .Y(n3) );
  XOR2X1 U13 ( .A(n17), .B(rollover_val[3]), .Y(n16) );
  XOR2X1 U14 ( .A(rollover_val[0]), .B(n18), .Y(n15) );
  OAI22X1 U15 ( .A(n19), .B(n1), .C(n18), .D(n20), .Y(n36) );
  OAI22X1 U16 ( .A(n21), .B(n1), .C(n12), .D(n20), .Y(n37) );
  OAI21X1 U17 ( .A(n18), .B(n22), .C(n23), .Y(n12) );
  NOR2X1 U18 ( .A(rollover_flag), .B(n21), .Y(n22) );
  INVX1 U19 ( .A(count_out[1]), .Y(n21) );
  OAI22X1 U20 ( .A(n24), .B(n1), .C(n13), .D(n20), .Y(n38) );
  XNOR2X1 U21 ( .A(n23), .B(n25), .Y(n13) );
  INVX1 U22 ( .A(count_out[2]), .Y(n24) );
  OAI22X1 U23 ( .A(n26), .B(n1), .C(n17), .D(n20), .Y(n39) );
  INVX1 U24 ( .A(n14), .Y(n20) );
  NOR2X1 U25 ( .A(n27), .B(clear), .Y(n14) );
  XOR2X1 U26 ( .A(n28), .B(n34), .Y(n17) );
  NOR2X1 U27 ( .A(n25), .B(n23), .Y(n34) );
  NAND2X1 U28 ( .A(count_out[1]), .B(n18), .Y(n23) );
  NOR2X1 U29 ( .A(n19), .B(rollover_flag), .Y(n18) );
  INVX1 U30 ( .A(count_out[0]), .Y(n19) );
  NAND2X1 U31 ( .A(count_out[2]), .B(n2), .Y(n25) );
  NAND2X1 U32 ( .A(count_out[3]), .B(n2), .Y(n28) );
  INVX1 U33 ( .A(rollover_flag), .Y(n2) );
  INVX1 U34 ( .A(n27), .Y(n1) );
  NOR2X1 U35 ( .A(count_enable), .B(clear), .Y(n27) );
  INVX1 U36 ( .A(count_out[3]), .Y(n26) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   n1, n2, n3;
  wire   [3:0] clock_count;

  flex_counter_1 clock_counter ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .count_out(clock_count) );
  flex_counter_0 bit_counter ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_strobe), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(packet_done) );
  INVX1 U3 ( .A(n1), .Y(shift_strobe) );
  NAND3X1 U4 ( .A(clock_count[1]), .B(n2), .C(n3), .Y(n1) );
  NOR2X1 U5 ( .A(clock_count[3]), .B(clock_count[2]), .Y(n3) );
  INVX1 U6 ( .A(clock_count[0]), .Y(n2) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 bitshift ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   load_buffer_sig, sbc_clear_sig, sbc_enable_sig, stop_bit_sig,
         start_bit_det_sig, packet_done_sig, enable_timer_sig,
         shift_strobe_sig;
  wire   [7:0] packet_data;

  rx_data_buff buffer ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer_sig), .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  stop_bit_chk stop ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear_sig), 
        .sbc_enable(sbc_enable_sig), .stop_bit(stop_bit_sig), .framing_error(
        framing_error) );
  rcu reciver ( .clk(clk), .n_rst(n_rst), .start_bit_detected(
        start_bit_det_sig), .packet_done(packet_done_sig), .framing_error(
        framing_error), .sbc_clear(sbc_clear_sig), .sbc_enable(sbc_enable_sig), 
        .load_buffer(load_buffer_sig), .enable_timer(enable_timer_sig) );
  timer timer ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer_sig), 
        .shift_strobe(shift_strobe_sig), .packet_done(packet_done_sig) );
  sr_9bit shifter ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe_sig), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(
        stop_bit_sig) );
  start_bit_det start ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit_det_sig) );
endmodule

