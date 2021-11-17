module gen_part_products(
	input [7:0] A,
	input [7:0] B,
	output[7:0][7:0] P); 	//portlist can be 2D array in verilog 
	genvar i;
	generate
		for(i = 0; i < 8; i = i +1) begin:part_product
			assign P[i][0] = A[0] & B[i] ;
			assign P[i][1] = A[1] & B[i] ;
			assign P[i][2] = A[2] & B[i] ;
			assign P[i][3] = A[3] & B[i] ;
			assign P[i][4] = A[4] & B[i] ;
			assign P[i][5] = A[5] & B[i] ;
			assign P[i][6] = A[6] & B[i] ;
			assign P[i][7] = A[7] & B[i] ;
		end
	endgenerate
endmodule







