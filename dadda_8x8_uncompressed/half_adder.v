`timescale 1ps/100fs
module half_adder(
	input a, 
	input b,
	output sum,
	output carry
);
	
	assign sum = a ^ b;
	assign carry = a & b;
	

endmodule








