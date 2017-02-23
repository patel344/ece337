// $Id: $
// File name:   tb_tx_fifo.sv
// Created:     2/18/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: fifo testbench

`timescale 1ns / 100ps
module tb_tx_fifo
();
	localparam TEST_DELAY					= 10;
	localparam DEFAULT_SIZE 				=  4;
	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	=10;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	
	// Shared Test Variables
	reg tb_clk;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// Declare Design Under TEST (DUT) portmap signals
	reg tb_n_rst;
	reg tb_read_enable;
	reg tb_write_enable;
	reg [7:0] tb_write_data;

	reg [7:0] tb_read_data;
	reg tb_fifo_empty;
	reg tb_fifo_full;

	
	// Declare Test Bench Signals
	reg [7:0] tb_expected_read_data;
	reg tb_expected_fifo_empty;
	reg tb_expected_fifo_full;

	// DUT Port Map
	tx_fifo DUT(.clk(tb_clk), .n_rst(tb_n_rst), .read_enable(tb_read_enable), .read_data(tb_read_data), .fifo_empty(tb_fifo_empty), .fifo_full(tb_fifo_full), .write_enable(tb_write_enable), .write_data(tb_write_data));

	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		//tb_expected_read_data = 0;
		tb_expected_fifo_empty = 0;
		tb_expected_fifo_full = 0;
		tb_n_rst = 1;
		tb_n_rst = 0;
		tb_n_rst = 1;

		// TEST CASE 1: RESET 
		@(posedge tb_clk)
		tb_n_rst = 0;
		tb_read_enable = 0;
		tb_write_enable = 0;
		tb_write_data = 8'b10101010;

		@(posedge tb_clk)

		//tb_expected_read_data = 0;
		tb_expected_fifo_empty =1;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 1!");
		end

		// TEST CASE 2: WRITE DATA
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_read_enable = 0;
		tb_write_enable = 1;
		tb_write_data = 8'b01010101;

		@(posedge tb_clk)

		//tb_expected_read_data = 0;
		tb_expected_fifo_empty =0;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 2!");
		end

		// TEST CASE 2.5: RESET 
		@(posedge tb_clk)
		tb_n_rst = 0;
		tb_read_enable = 0;
		tb_write_enable = 0;
		tb_write_data = 8'b10101010;

		@(posedge tb_clk)

		tb_expected_read_data = 8'b01010101;
		tb_expected_fifo_empty =1;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 2.5!");
		end

		// TEST CASE 2.75: WRITE DATA
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_read_enable = 0;
		tb_write_enable = 1;
		tb_write_data = 8'b01010101;

		@(posedge tb_clk)

		tb_expected_read_data = 8'b10101010;
		tb_expected_fifo_empty =0;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 2.75!");
		end

		// TEST CASE 3: READ AND WRITE DATA
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_read_enable = 1;
		tb_write_enable = 1;
		tb_write_data = 8'b10101010;

		@(posedge tb_clk)

		tb_expected_read_data = 8'b01010101;
		tb_expected_fifo_empty =0;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 3!");
		end
		
		// TEST CASE 4: READ DATA
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_read_enable = 1;
		tb_write_enable = 0;
		tb_write_data = 8'b10101010;

		@(posedge tb_clk)

		tb_expected_read_data = 8'b10101010;
		tb_expected_fifo_empty =1;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 4!");
		end

		// TEST CASE 5: WRITE DATA UNTIL FIFO FULL
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_read_enable = 0;
		tb_write_enable = 1;
		tb_write_data = 8'b01010101;
		@(posedge tb_clk)
		tb_write_data = 8'b10101010;
		@(posedge tb_clk)
		tb_write_data = 8'b01010101;
		@(posedge tb_clk)
		tb_write_data = 8'b10101010;
		@(posedge tb_clk)
		tb_write_data = 8'b01010101;
		@(posedge tb_clk)
		tb_write_data = 8'b10101010;
		@(posedge tb_clk)
		tb_write_data = 8'b01010101;
		@(posedge tb_clk)
		tb_write_data = 8'b10101010;
		@(posedge tb_clk)

		tb_expected_read_data = 0;
		tb_expected_fifo_empty =0;
		tb_expected_fifo_full = 1;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 5!");
		end

		
		// TEST CASE 6: READ DATA UNTIL FIFO EMPTY
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_read_enable = 1;
		tb_write_enable = 0;
		tb_write_data = 8'b01010101;

		tb_expected_read_data = 8'b01010101;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b10101010;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b01010101;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b10101010;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b01010101;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b10101010;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b01010101;
		@(posedge tb_clk)
		tb_expected_read_data = 8'b10101010;
		@(posedge tb_clk)
		tb_expected_fifo_empty =1;
		tb_expected_fifo_full = 0;
			
		@(posedge tb_clk)
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 6!");
		end

		// TEST CASE 7: RESET 
		@(posedge tb_clk)
		tb_n_rst = 0;
		tb_read_enable = 0;
		tb_write_enable = 0;
		tb_write_data = 8'b10101010;

		@(posedge tb_clk)

		tb_expected_read_data = 0;
		tb_expected_fifo_empty =1;
		tb_expected_fifo_full = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_read_data == tb_read_data && tb_expected_fifo_empty == tb_fifo_empty && tb_expected_fifo_full == tb_fifo_full)
		else
		begin 
			$error("Incorrect value for test case 7!");
		end

	end
endmodule