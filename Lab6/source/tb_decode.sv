// $Id: $
// File name:   tb_decode.sv
// Created:     2/18/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: decode testbench

`timescale 1ns / 100ps
module tb_decode
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
	reg tb_sda_in;
	reg [7:0] tb_starting_byte;
	reg tb_rw_mode;
	reg tb_address_match;
	reg tb_stop_found;
	reg tb_start_found;
	
		
	// Declare Test Bench Signals
	reg                  tb_expected_start;
	reg 		     tb_expected_stop;
	reg	  	     tb_expected_rw;
	reg		     tb_expected_addr;  

	// DUT Port Map
	decode DUT(.clk(tb_clk), .n_rst(tb_n_rst), .scl(tb_scl), .sda_in(tb_sda_in), .starting_byte(tb_starting_byte), .rw_mode(tb_rw_mode), .address_match(tb_address_match), .stop_found(tb_stop_found), .start_found(tb_start_found));


	// Test Bench Process
	initial
	begin
		//Initialize Expected Outputs
		tb_expected_start = 0;
		tb_expected_stop = 0;
		tb_starting_byte = 8'b11110001;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 1;
		
		tb_scl = 1;
		tb_sda_in = 1;
		tb_n_rst = 1;
		@(negedge tb_clk)
		tb_n_rst = 0;
		@(posedge tb_clk)
		tb_n_rst = 1;

		// TEST CASE 1: START FOUND && ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 1;
		tb_starting_byte = 8'b11110001;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 0;
		
		@(posedge tb_clk)
		tb_expected_start = 1;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 1;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 1!");
		
		// TEST CASE 2: RESET 
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 1;
		tb_starting_byte = 8'b11110001;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 0;
		tb_n_rst = 0;

		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 1;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 2!");
		
		// TEST CASE 3: STOP FOUND && ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 0;
		tb_starting_byte = 8'b11110000;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 1;
		
		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 1;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 1;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 3!");

		// TEST CASE 9: COVERAGE REPORT CASE
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 0;
		tb_starting_byte = 8'b10101010;
		@(posedge tb_clk)
		tb_scl = 0;
		tb_sda_in = 1;
		
		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 0;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 9!");

		// TEST CASE 4: NO STOP OR START DETECTED && ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 1;
		tb_starting_byte = 8'b11110001;
		@(posedge tb_clk)
		tb_scl = 0;
		tb_sda_in = 0;
		
		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 1;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 4!");

		// TEST CASE 5: START FOUND && NO ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 1;
		tb_starting_byte = 8'b11010001;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 0;
		
		@(posedge tb_clk)
		tb_expected_start = 1;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 0;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 5!");
		
		// TEST CASE 6: STOP FOUND && NO ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 0;
		tb_starting_byte = 8'b01010101;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 1;
			
		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 1;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 0;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 6!");
		
		// TEST CASE 7: NO STOP OR START FOUND && NO ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 0;
		tb_sda_in = 1;
		tb_starting_byte = 8'b10101010;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 0;
		
		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 0;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 7!");

		// TEST CASE 8: RESET && NO ADDR MATCH
		@(posedge tb_clk)
		tb_n_rst = 1;
		tb_scl = 1;
		tb_sda_in = 1;
		tb_starting_byte = 8'b01010101;
		@(posedge tb_clk)
		tb_scl = 1;
		tb_sda_in = 0;
		tb_n_rst = 0;

		@(posedge tb_clk)
		tb_expected_start = 0;
		tb_expected_stop = 0;
		tb_expected_rw = tb_starting_byte[0];
		tb_expected_addr = 0;
		#CHECK_DELAY
		assert((tb_expected_start == tb_start_found) && (tb_expected_stop == tb_stop_found) && (tb_expected_rw == tb_rw_mode) && (tb_expected_addr == tb_address_match))
		else
			$error("Incorrect value for test case 8!");

	end
endmodule