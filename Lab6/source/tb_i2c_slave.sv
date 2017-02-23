// $Id: $
// File name:   tb_i2c_slave.sv
// Created:     2/21/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: top level testbench

`timescale 1ns / 100ps
module tb_i2c_slave
();
	localparam TESTDELAY					= 10;
	localparam DEFAULT_SIZE 				=  4;
	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	
	// Shared Test Variables
	reg tb_clk;
	reg tb_scl;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	always
	begin
		tb_scl = 1'b0;
		#(CLK_PERIOD*10/2.0);
		tb_scl = 1'b1;
		#(CLK_PERIOD*10/2.0);
	end

	// Declare Design Under TEST (DUT) portmap signals
	reg tb_n_rst;
	reg tb_sda_in;
	reg tb_write_enable;
	reg [7:0] tb_write_data;

	reg tb_sda_out;
	reg tb_fifo_empty;
	reg tb_fifo_full;

	// Declare Test Bench Signals
	reg                  tb_expected_sda_out;
	reg 		     tb_expected_fifo_empty;
	reg		     tb_expected_fifo_full;  


	// Tasks for regulating the timing of input stimulus to the design
	task send_single_byte;
			integer i;
	begin
		reg [7:0] data;
		data = 8'b11110001;
	
	
		// First synchronize to away from clock's rising edge
		@(negedge tb_clk)

		//start condition found
		@(posedge tb_scl)
		#(CLK_PERIOD / 2);
		tb_sda_in = 1;
		#1
		tb_sda_in = 0;
		#(7*CLK_PERIOD);
		// Send start byte
		for(i = 7; i >= 0; i = i- 1)
		begin	
			//@(negedge tb_scl)
			//#5
			tb_sda_in = data[i];
			#(10*CLK_PERIOD);
			
		end
		
		// Send data byte
		//tb_write_data = 8'b01010101;
		//#(10*CLK_PERIOD);

		//stop condition found
		@(posedge tb_scl)
		@(posedge tb_scl)
		#(CLK_PERIOD / 2)
		tb_sda_in = 0;
		#1
		tb_sda_in = 1;
		#(7*CLK_PERIOD);
		
	end
	endtask


	// DUT Port Map
	i2c_slave DUT(.clk(tb_clk), .n_rst(tb_n_rst), .scl(tb_scl), .sda_in(tb_sda_in), .write_enable(tb_write_enable), .write_data(tb_write_data), .sda_out(tb_sda_out), .fifo_empty(tb_fifo_empty), .fifo_full(tb_fifo_full));

	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		tb_expected_sda_out = 1;
		tb_expected_fifo_empty = 1;
		tb_expected_fifo_full = 0;
		
		tb_sda_in = 1;
		tb_write_enable = 0;
		//tb_write_data = 8'b00000000;

		tb_n_rst = 1;
		@(negedge tb_clk)
		tb_n_rst = 0;
		@(posedge tb_clk)
		tb_n_rst = 1;
		@(negedge tb_clk)

		// TEST CASE 1: FALLING FOUND
		tb_n_rst = 1;
		//tb_sda_in = 0;
		tb_write_enable = 1;
		//tb_write_data = 8'b10101010;

		send_single_byte();

		@(negedge tb_clk)
		tb_expected_sda_out = 1;
		tb_expected_fifo_empty = 0;
		tb_expected_fifo_full = 0;
		
		#CHECK_DELAY
		
		assert(tb_expected_sda_out == tb_sda_out && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
			$error("Incorrect value for test case 1!");
		
		
	end
endmodule