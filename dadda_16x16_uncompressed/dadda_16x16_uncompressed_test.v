module dadda_16x16_uncompressed_tb(); 
	reg [15:0] A; 	
	reg [15:0] B;
	wire [31:0] final_result; 

	dadda_16x16_uncompressed3 dut(
	.a(A), .b(B), .final_result(final_result)); 
	initial begin
			
		A = 16'h0;
		B = 16'h0;
		#200;
		A = 16'hff;
		B = 16'haa;
		#200;
		B = 16'hff;
		#200;
		B = 16'h01;
		#200;
		B = 16'h00;
		#200;
		B = 16'h02;
		#200;
		A = 16'hffff;
		B = 16'haaaa;
		#200;
		A = 16'hffff;
		B = 16'hffff;
	end
endmodule
