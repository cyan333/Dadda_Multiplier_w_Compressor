module full_adder_test();

	reg a, b, c_in;
	wire sum, carry;

	initial begin
	a = 0;
	b = 0;
	c_in = 0;

	#100
	a = 0;
	b = 0;
	c_in = 1;

	#100
	a = 1;
	b = 0;
	c_in = 0;

	#100
	a = 1;
	b = 1;
	c_in = 1;

	
	end



full_adder full_adder_uut(.a(a), .b(b), .c_in(c_in), .sum(sum), .carry(carry));



endmodule
