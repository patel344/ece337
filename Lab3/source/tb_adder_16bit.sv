// $Id: $
// File name:   tb_adder_16bit.sv
// Created:     1/24/2017
// Author:      Parth Patel
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Non-exhaustive testbench for 16 bit adder.
`timescale 1ns / 100ps
module tb_adder_16bit
();
	localparam TEST_DELAY					= 10;
	// Declare Design Under Test (DUT) portmap signals
	reg	[15:0] tb_a ;
	reg	[15:0] tb_b;
	reg	tb_carry_in;
	reg	[15:0] tb_sum;
	reg	tb_carry_out;
	reg    no_match;

	reg [16:0] tb_expected_outputs;

	// DUT port map
	adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	

	// Test bench process
	initial
	begin
		no_match = 1'b0;
		// TEST CASE 1
		// Initialize test inputs for DUT
		tb_a = 16'b0000000000000000;
		tb_b = 16'b0000000000000000;
		tb_carry_in = 1'b0; 

		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 1!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 1!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 2
		// Initialize test inputs for DUT
		tb_a = 16'b1111111100110011;
		tb_b = 16'b0000000011011101;
		tb_carry_in = 1'b1; 

		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 2!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 2!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 3
		// Initialize test inputs for DUT
		tb_b = 16'b1111111110010101;
		tb_a = 16'b0000000001111010;
		tb_carry_in = 1'b0; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 3!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 3!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 4
		// Initialize test inputs for DUT
		tb_a = 16'b1111111111111111;
		tb_b = 16'b1111111111111111;
		tb_carry_in = 1'b0; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 4!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 4!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 4.5
		// Initialize test inputs for DUT
		tb_a = 16'b1111111111111111;
		tb_b = 16'b0000000000000000;
		tb_carry_in = 1'b1; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 4.5!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 4.5!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 5
		// Initialize test inputs for DUT
		tb_a = 16'b1111111111111111;
		tb_b = 16'b1111111111111111;
		tb_carry_in = 1'b1; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 5!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 5!");
			no_match = 1'b1;
		end
		#1
		
		//TEST CASE 6
		// Initialize test inputs for DUT
		tb_a = 16'b0000000000000011;
		tb_b = 16'b0000000000000011;
		tb_carry_in = 1'b1; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 6!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 6!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 7
		// Initialize test inputs for DUT
		tb_a = 16'b1010101010101010;
		tb_b = 16'b1010101010101010;
		tb_carry_in = 1'b0; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 6!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 6!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 8
		// Initialize test inputs for DUT
		tb_a = 16'b1010101010101010;
		tb_b = 16'b1010101010101010;
		tb_carry_in = 1'b1; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 8!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 8!");
			no_match = 1'b1;
		end

		//TEST CASE 9
		// Initialize test inputs for DUT
		tb_a = 16'b0101010101010101;
		tb_b = 16'b0101010101010101;
		tb_carry_in = 1'b0; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 6!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 6!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 10
		// Initialize test inputs for DUT
		tb_a = 16'b0101010101010101;
		tb_b = 16'b0101010101010101;
		tb_carry_in = 1'b1; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 8!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 8!");
			no_match = 1'b1;
		end
		//TEST CASE 11
		// Initialize test inputs for DUT
		tb_a = 16'b1010101010101010;
		tb_b = 16'b0101010101010101;
		tb_carry_in = 1'b0; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 6!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 6!");
			no_match = 1'b1;
		end
		#1
		//TEST CASE 12
		// Initialize test inputs for DUT
		tb_a = 16'b1010101010101010;
		tb_b = 16'b0101010101010101;
		tb_carry_in = 1'b1; 


		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
				// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin 
			$error("Incorrect Sum value for test case 8!");
			no_match = 1'b1;
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[16] == tb_carry_out)
		else
		begin 
			$error("Incorrect Carry Out value for test case 8!");
			no_match = 1'b1;
		end
		
	end
endmodule