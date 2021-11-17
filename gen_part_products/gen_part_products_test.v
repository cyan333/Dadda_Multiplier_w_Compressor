module gen_part_products_tb(); //testbench doesnt have any inputs or outputs
	reg [7:0] A; 	//inputs are takens as reqisters ( they need to hold the value)
	reg [7:0] B;
	wire [7:0][7:0] P; //outputs are takens as wires in tb .
	gen_part_products dut(.A(A), .B(B), .P(P)); //since all the inputs to the dut are the wires of same name
	initial begin
			//first argument is the level of debugging
									//level 0 will log all the variable even in 
		//sub modules 
		//whereas level 1 will log only the ones in the top module 
		A = 8'h0;
		B = 8'h0;
		#200;
		A = 8'hff;
		B = 8'haa;
		#200;
		B = 8'hff;
		#200;
	end
endmodule
