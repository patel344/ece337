// $Id: $
// File name:   i2c_slave.sv
// Created:     2/21/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: top level module

module i2c_slave
(
	input wire clk,
	input wire n_rst,
	input wire scl,
	input wire sda_in,
	input wire write_enable,
	input wire [7:0] write_data,
	
	output wire sda_out,
	output wire fifo_empty,
	output wire fifo_full
);

wire rw_mode;
wire address_match;
wire stop_found;
wire start_found;
wire byte_received;
wire ack_prep;
wire check_ack;
wire ack_done;
wire [7:0] rx_data;
wire rx_enable;
wire read_enable;
wire tx_enable;
wire load_data;
wire [7:0] read_data;
wire tx_out;
wire rising_edge_found;
wire falling_edge_found;
wire [1:0] sda_mode;

controller controlla(.clk(clk), .n_rst(n_rst), .byte_received(byte_received), .ack_prep(ack_prep), .check_ack(check_ack), .ack_done(ack_done), .sda_in(sda_in), .rw_mode(rw_mode), .address_match(address_match), .stop_found(stop_found), .start_found(start_found), .read_enable(read_enable), .load_data(load_data), .tx_enable(tx_enable), .rx_enable(rx_enable), .sda_mode(sda_mode));
timer      timaa    (.clk(clk), .n_rst(n_rst), .falling_edge_found(falling_edge_found), .rising_edge_found(rising_edge_found), .start_found(start_found), .stop_found(stop_found), .byte_received(byte_received), .ack_prep(ack_prep), .check_ack(check_ack), .ack_done(ack_done));
decode     decoda   (.clk(clk), .n_rst(n_rst), .sda_in(sda_in), .scl(scl), .starting_byte(rx_data), .rw_mode(rw_mode), .address_match(address_match), .start_found(start_found), .stop_found(stop_found));
rx_sr	   reada    (.clk(clk), .n_rst(n_rst), .sda_in(sda_in), .rx_enable(rx_enable), .rising_edge_found(rising_edge_found), .rx_data(rx_data));
tx_sr	  transmita (.clk(clk), .n_rst(n_rst), .load_data(load_data), .tx_enable(tx_enable), .tx_data(read_data), .falling_edge_found(falling_edge_found), .tx_out(tx_out));
tx_fifo    fifa     (.clk(clk), .n_rst(n_rst), .read_enable(read_enable), .read_data(read_data), .fifo_empty(fifo_empty), .fifo_full(fifo_full), .write_enable(write_enable), .write_data(write_data));
scl_edge   edgecata (.clk(clk), .n_rst(n_rst), .scl(scl), .rising_edge_found(rising_edge_found), .falling_edge_found(falling_edge_found));
sda_sel    selecta  (                          .sda_mode(sda_mode), .tx_out(tx_out), .sda_out(sda_out));

endmodule