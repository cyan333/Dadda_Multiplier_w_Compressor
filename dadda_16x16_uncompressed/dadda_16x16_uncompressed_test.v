module dadda_16x16_uncompressed_tb(); 
	reg [7:0] A; 	
	reg [7:0] B;
	wire [15:0] final_result; 

	dadda_16x16_uncompressed dut(
	.a(A), .b(B), .final_result(final_result)); 
	initial begin
			
		A = 8'h0;
		B = 8'h0;
		#200;
		A = 8'hff;
		B = 8'haa;
		#200;
		B = 8'hff;
		#200;
		B = 8'h01;
		#200;
		B = 8'h00;
		#200;
		B = 8'h02;
	end
endmodule
