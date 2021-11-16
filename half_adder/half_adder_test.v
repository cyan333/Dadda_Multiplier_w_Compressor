module half_adder_test();

	reg a, b;
	wire sum, carry;

	initial begin
	a = 0;
	b = 0;


	#100
	a = 0;
	b = 0;


	#100
	a = 1;
	b = 0;


	#100
	a = 1;
	b = 1;


	
	end



half_adder half_adder_uut(.a(a), .b(b), .sum(sum), .carry(carry));



endmodule
