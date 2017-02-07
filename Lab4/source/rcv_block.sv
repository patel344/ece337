// $Id: $
// File name:   rcv_block.sv
// Created:     2/3/2017
// Author:      Parth Patel
// Lab Section: 337-01C
// Version:     1.0  Initial Design Entry
// Description: Top Level Module.

module rcv_block
(
	input wire clk,
	input wire n_rst,
	input wire serial_in,
	input wire data_read,
	output reg [7:0] rx_data,
	output reg data_ready,
	output reg overrun_error,
	output reg framing_error
);
	wire shift_strobe_sig;
	wire packet_done_sig;
	wire enable_timer_sig;
	wire start_bit_det_sig;
	wire sbc_clear_sig;
	wire sbc_enable_sig;
	wire stop_bit_sig;
	wire load_buffer_sig;
	wire [7:0] packet_data;
	

rx_data_buff    buffer  (.clk(clk), .n_rst(n_rst), .load_buffer(load_buffer_sig), .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));
stop_bit_chk    stop    (.clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear_sig), .sbc_enable(sbc_enable_sig), .stop_bit(stop_bit_sig), .framing_error(framing_error));
rcu             reciver (.clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_det_sig), .packet_done(packet_done_sig), .framing_error(framing_error), .sbc_clear(sbc_clear_sig), .sbc_enable(sbc_enable_sig), .load_buffer(load_buffer_sig), .enable_timer(enable_timer_sig));
timer           timer   (.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer_sig), .shift_strobe(shift_strobe_sig), .packet_done(packet_done_sig)); 
sr_9bit         shifter (.clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe_sig), .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit_sig));
start_bit_det   start   (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .start_bit_detected(start_bit_det_sig));

endmodule