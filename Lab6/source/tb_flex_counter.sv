// $Id: $
// File name:   tb_flex_counter.sv
// Created:     1/26/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Flex Counter.

`timescale 1ns / 100ps
module tb_flex_counter
();
	localparam TEST_DELAY					= 10;
	localparam DEFAULT_SIZE 				=  4;
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
	reg tb_clear;
	reg tb_count_enable;
	reg [DEFAULT_SIZE-1:0] tb_rollover_val;
	reg [DEFAULT_SIZE-1:0] tb_count_out;
	reg tb_rollover_flag;
	
	// Declare Test Bench Signals
	reg [DEFAULT_SIZE-1:0] tb_expected_count;
	reg                  tb_expected_rollover_flag;  

	// DUT Port Map
	flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		tb_expected_count = 0;
		tb_expected_rollover_flag = 1'b0;
		tb_n_rst = 0;

		// TEST CASE 1: RESET 
		tb_n_rst = 0;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 15; 

		@(posedge tb_clk)

		tb_expected_count = 0;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
			
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 1!");
		end


		// TEST CASE 2: CLEAR
		tb_n_rst = 1;
		tb_clear = 1;
		tb_count_enable = 1;
		tb_rollover_val = 2; 

		@(posedge tb_clk)	

		tb_expected_count = 0;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
			
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 2!");
		end


		// TEST CASE 3: INCREMENT ONCE
		// Initialize test inputs for DUT
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 15; 
		@(posedge tb_clk)

		tb_expected_count = tb_expected_count + 1;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
			

		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 3!");
		end
		

		// TEST CASE 4: RESET AND CLEAR
		tb_n_rst = 0;
		tb_clear = 1;
		tb_count_enable = 0;
		tb_rollover_val = 1; 

		@(posedge tb_clk)

		tb_expected_count = 0;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
			
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 4!");
		end
	

		// TEST CASE 5: INCREMENT UNTIL ROLLOVER_VAL
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 2; 

		@(posedge tb_clk)
		tb_expected_count = tb_expected_count + 1;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 5!");
		end
		

		// TEST CASE 5.5: INCREMENT UNTIL ROLLOVER_VAL
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 2; 
		
		// Wait one clock cycle
		@(posedge tb_clk)
	
		// Calculate the expected outputs
		tb_expected_count = tb_expected_count + 1;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 5.5!");
		end
		

		// TEST CASE 6: INCREMENT ONE MORE TIME
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 2; 

		@(posedge tb_clk)

		// Calculate the expected outputs
		tb_expected_count = tb_expected_count + 1;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
		tb_expected_count = 1; // Reset count to 1 after rollover value is reached
		
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 6!");
		end
		

		// TEST CASE 7: DO NOTHING
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 0;
		tb_rollover_val = 2; 

		@(posedge tb_clk)

		// Calculate the expected outputs
		tb_expected_count = tb_expected_count;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
			
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 7!");
		end
		
		// TEST CASE 8: CLEAR
		tb_n_rst = 1;
		tb_clear = 1;
		tb_count_enable = 0;
		tb_rollover_val = 2; 

		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		@(posedge tb_clk)


		// Wait for DUT to process the inputs
		//#(TEST_DELAY - 1);

		// Calculate the expected outputs
		tb_expected_count = 0;
		tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
			
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 8!");
		end
		
		// TEST CASE 9: INCREMENT
		tb_n_rst = 1;
		tb_clear = 0;
		tb_count_enable = 1;
		tb_rollover_val = 14; 
		
		for(integer i = 0; i < 13; i = i + 1)
		begin
			@(posedge tb_clk)

			// Calculate the expected outputs
			tb_expected_count = tb_expected_count + 1;
			tb_expected_rollover_flag = tb_expected_count == tb_rollover_val ? 1'b1 : 1'b0;
		end
		
		#1
		// Check the DUT's Sum output value
		assert({tb_expected_rollover_flag, tb_expected_count} == {tb_rollover_flag, tb_count_out})
		else
		begin 
			$error("Incorrect value for test case 6!");
		end
	end
endmodule