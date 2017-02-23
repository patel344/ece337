// $Id: $
// File name:   tb_sda_sel.sv
// Created:     2/16/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sda testbench


`timescale 1ns / 100ps
module tb_sda_sel
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
	reg tb_tx_out;
	reg [1:0] tb_sda_mode;
	reg tb_sda_out;

	// Declare Test Bench Signals
	reg                  tb_expected_sda_out;  

	// DUT Port Map
	sda_sel DUT(.tx_out(tb_tx_out), .sda_mode(tb_sda_mode), .sda_out(tb_sda_out));

	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		tb_expected_sda_out = 1;
		
		// TEST CASE 1:
		@(posedge tb_clk)
		tb_sda_mode = 2'b00;
		tb_tx_out = 0;
		@(posedge tb_clk)
		tb_expected_sda_out = 1;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_sda_out == tb_sda_out)
		else
		begin 
			$error("Incorrect value for test case 1!");
		end

		// TEST CASE 6:
		@(posedge tb_clk)
		tb_sda_mode = 2'b00;
		tb_tx_out = 1;
		@(posedge tb_clk)
		tb_expected_sda_out = 1;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_sda_out == tb_sda_out)
		else
		begin 
			$error("Incorrect value for test case 6!");
		end

		// TEST CASE 5:	
		@(posedge tb_clk)
		tb_sda_mode = 2'b11;
		tb_tx_out = 1;
		@(posedge tb_clk)

		tb_expected_sda_out = tb_tx_out;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_sda_out == tb_sda_out)
		else
		begin 
			$error("Incorrect value for test case 5!");
		end
		
		// TEST CASE 2:
		@(posedge tb_clk)
		tb_sda_mode = 2'b01;
		tb_tx_out = 1;
		@(posedge tb_clk)
		tb_expected_sda_out = 0;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_sda_out == tb_sda_out)
		else
		begin 
			$error("Incorrect value for test case 2!");
		end
		
		
		// TEST CASE 3:
		@(posedge tb_clk)
		tb_sda_mode = 2'b10;
		tb_tx_out = 0;
		@(posedge tb_clk)

		tb_expected_sda_out = 1;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_sda_out == tb_sda_out)
		else
		begin 
			$error("Incorrect value for test case 3!");
		end
		
		
		// TEST CASE 4:
		@(posedge tb_clk)
		tb_sda_mode = 2'b11;
		tb_tx_out = 0;
		@(posedge tb_clk)
		tb_expected_sda_out = tb_tx_out;
			
		#CHECK_DELAY
		// Check the DUT's Sum output value
		assert(tb_expected_sda_out == tb_sda_out)
		else
		begin 
			$error("Incorrect value for test case 4!");
		end
	
		
		

	end
endmodule