// $Id: $
// File name:   tb_moore.sv
// Created:     1/31/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: testbench for moore machine.

`timescale 1ns / 100ps
module tb_moore
();
	localparam TEST_DELAY					= 10;

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
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
	reg tb_i;
	reg tb_o;
	// Declare Test Bench Signals
	reg tb_expected_output;

	// DUT Port Map
	moore DUT(.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		tb_expected_output = 0;
		tb_n_rst = 1;
		tb_i = 0;
		@(posedge tb_clk)
		tb_n_rst = 0;
		@(posedge tb_clk)
		tb_n_rst = 1;
		@(posedge tb_clk)

		// TEST CASE 1: NORMAL
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)

		tb_expected_output = 1;
		#1
		// Check the DUT's Sum output value
		assert(tb_expected_output == tb_o)
		else
		begin 
		$error("Incorrect value for test case 1!");
		end

		// TEST CASE 2: 
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		tb_n_rst = 0;
		@(posedge tb_clk)

		tb_expected_output = 0;
		#1
		// Check the DUT's Sum output value
		assert(tb_expected_output == tb_o)
		else
		begin 
		$error("Incorrect value for test case 2!");
		end
		
		// TEST CASE 3:
		tb_n_rst = 1;
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)	
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)

		tb_expected_output = 0;
		#1
		// Check the DUT's Sum output value
		assert(tb_expected_output == tb_o)
		else
		begin 
		$error("Incorrect value for test case 3!");
		end
		
		// TEST CASE 4:
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk);

		tb_expected_output = 0;
		#1
		// Check the DUT's Sum output value
		assert(tb_expected_output == tb_o)
		else
		begin 
		$error("Incorrect value for test case 4!");
		end

		// TEST CASE 5:
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)

		tb_expected_output = 0;
		#1
		// Check the DUT's Sum output value
		assert(tb_expected_output == tb_o)
		else
		begin 
		$error("Incorrect value for test case 5!");
		end
	
		// TEST CASE 6:
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)
		tb_i = 1;
		@(posedge tb_clk)
		tb_i = 0;
		@(posedge tb_clk)

		tb_expected_output = 0;
		#1
		// Check the DUT's Sum output value
		assert(tb_expected_output == tb_o)
		else
		begin 
		$error("Incorrect value for test case 6!");
		end
	end
endmodule