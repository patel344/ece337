// $Id: $
// File name:   tb_scl_edge.sv
// Created:     2/16/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: scl testbench.


`timescale 1ns / 100ps
module tb_scl_edge
();
	localparam TESTDELAY					= 10;
	localparam DEFAULT_SIZE 				=  4;
	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;
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
	reg tb_scl;
	reg tb_rising_edge_found;
	reg tb_falling_edge_found;

	// Declare Test Bench Signals
	reg                  tb_expected_rising;
	reg 		     tb_expected_falling;  

	// DUT Port Map
	scl_edge DUT(.clk(tb_clk), .n_rst(tb_n_rst), .scl(tb_scl), .rising_edge_found(tb_rising_edge_found), .falling_edge_found(tb_falling_edge_found));

	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		//tb_expected_rising = 0;
		//tb_expected_falling = 0;
		tb_scl = 1;
		tb_n_rst = 1;
		@(negedge tb_clk)
		tb_n_rst = 0;
		@(posedge tb_clk)
		tb_n_rst = 1;
		
		@(posedge tb_clk)
		// TEST CASE 1: FALLING FOUND
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		@(posedge tb_clk)
		tb_scl = 0;
		
		@(posedge tb_clk)
		tb_expected_rising = 0;
		tb_expected_falling = 1;
		
		#CHECK_DELAY
		
		assert(tb_expected_rising == tb_rising_edge_found && tb_expected_falling == tb_falling_edge_found)
		else
			$error("Incorrect value for test case 1!");
		
		// TEST CASE 2: RESET
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		@(posedge tb_clk)
		tb_scl = 0;
		tb_n_rst = 0;

		@(posedge tb_clk)
		tb_expected_rising = 0;
		tb_expected_falling = 0;
		#CHECK_DELAY
		assert(tb_expected_rising == tb_rising_edge_found && tb_expected_falling == tb_falling_edge_found)
		else
			$error("Incorrect value for test case 2!");
		
		// TEST CASE 3: RISING FOUND
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 0;
		@(posedge tb_clk)
		tb_scl = 1;
		
		@(posedge tb_clk)
		tb_expected_rising = 1;
		tb_expected_falling = 0;
		#CHECK_DELAY
		assert(tb_expected_rising == tb_rising_edge_found && tb_expected_falling == tb_falling_edge_found)
		else
			$error("Incorrect value for test case 3!");

		// TEST CASE 4: NO EDGE DETECTED
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		@(posedge tb_clk)
		tb_scl = 1;
		
		@(posedge tb_clk)
		tb_expected_rising = 0;
		tb_expected_falling = 0;
		#CHECK_DELAY
		assert(tb_expected_rising == tb_rising_edge_found && tb_expected_falling == tb_falling_edge_found)
		else
			$error("Incorrect value for test case 4!");

		// TEST CASE 5: NO EDGE DETECTED
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 0;
		@(posedge tb_clk)
		tb_scl = 0;
		
		@(posedge tb_clk)
		tb_expected_rising = 0;
		tb_expected_falling = 0;
		#CHECK_DELAY
		assert(tb_expected_rising == tb_rising_edge_found && tb_expected_falling == tb_falling_edge_found)
		else
			$error("Incorrect value for test case 5!");

	end
endmodule