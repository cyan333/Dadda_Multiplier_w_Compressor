`timescale 1ps/100fs

module dadda_8x8_uncompressed(a,b,final_result);
	input [7:0] a;
	input [7:0] b;
	output [15:0] final_result;

	
 	wire [7:0] [7:0] p;
	wire [42:0] s, c;
	wire [13:0] rca_b, rca_a;


	reg [13:0] sum;
	reg cout;

	//14b adder
	assign rca_a = (p[7][7] << 13) | (s[42:31] << 1) | p[1][0];
	assign rca_b = (c[42:31] << 2) | p[0][2] << 1 | p[0][1];
	assign final_result = (cout << 15) | (sum << 1) | p[0][0];
	
	product_8x8 P_var(a,b,p);

	//level 1
	half_adder ha0(p[6][0], p[5][1], s[6], c[6]);
	half_adder ha1(p[4][3], p[3][4], s[5], c[5]);
	half_adder ha2(p[4][4], p[3][5], s[4], c[4]);

	full_adder fa0(p[7][0], p[6][1], p[5][2], s[1], c[1]);
	full_adder fa1(p[7][1], p[6][2], p[5][3], s[2], c[2]);
	full_adder fa2(p[7][2], p[6][3], p[5][4], s[3], c[3]);

	//level 2
	half_adder ha3(	p[4][0], p[3][1], s[7], c[7]);
	half_adder ha4(	p[2][3], p[1][4], s[20], c[20]);
	
	full_adder fa3(	p[5][0], p[4][1], p[3][2], s[8], c[8]);
	full_adder fa4(	s[6], 	p[4][2], p[3][3], s[9], c[9]);
	full_adder fa5(	s[1], 	c[6], 	 p[2][5], s[10], c[10]);

	full_adder fa6(	s[2], 	c[1], 	 p[2][6], s[11], c[11]);
	full_adder fa7(	s[3], 	c[2], 	 p[4][5], s[12], c[12]);
	full_adder fa8(	p[7][3], p[6][4], p[5][5], s[13], c[13]);

	full_adder fa9(	p[7][4], p[6][5], p[5][6], s[14], c[14]);
	full_adder fa10(p[4][6], p[3][7], c[3], s[15], c[15]);
	full_adder fa11(p[3][6], p[2][7], c[4], s[16], c[16]);

	full_adder fa12(s[4], 	c[5], 	 p[1][7], s[17], c[17]);
	full_adder fa13(s[5], 	p[1][6], p[0][7], s[18], c[18]);
	full_adder fa14(p[2][4],p[1][5], p[0][6], s[19], c[19]);

	//level 2
	half_adder ha5(	p[3][0], p[2][1], s[21], c[21]);

	full_adder fa15(s[7], p[2][2], p[1][3], s[22], c[22]);
	full_adder fa16(s[8], c[7],    s[20],   s[23], c[23]);
	full_adder fa17(s[9], c[8],    s[19],   s[24], c[24]);

	full_adder fa18(s[10], c[9],   s[18],   s[25], c[25]);
	full_adder fa19(s[11], c[10],  s[17],   s[26], c[26]);
	full_adder fa20(s[12], c[11],  s[16],   s[27], c[27]);

	full_adder fa21(s[13], c[12],  s[15],   s[28], c[28]);
	full_adder fa22(s[14], c[13],  p[4][7], s[29], c[29]);
	full_adder fa23(p[7][5], c[14],  p[6][6],   s[30], c[30]);

	//level 2
	half_adder ha6(	p[2][0], p[1][1], s[31], c[31]);

	full_adder fa24(s[21], p[1][2], p[0][3], s[32], c[32]);
	full_adder fa25(s[22], c[21],   p[0][4], s[33], c[33]);
	full_adder fa26(s[23], c[22],   p[0][5], s[34], c[34]);

	full_adder fa27(s[24], c[23],   c[20],   s[35], c[35]);
	full_adder fa28(s[25], c[24],   c[19],   s[36], c[36]);
	full_adder fa29(s[26], c[25],   c[18],   s[37], c[37]);

	full_adder fa30(s[27], c[26],   c[17],   s[38], c[38]);
	full_adder fa31(s[28], c[27],   c[16],   s[39], c[39]);
	full_adder fa32(s[29], c[28],   c[15],   s[40], c[40]);

	full_adder fa33(s[30], c[29],   p[5][7], s[41], c[41]);
	full_adder fa34(p[7][6], c[30], p[6][7], s[42], c[42]);

	
	
	rca_14b rca_uut(rca_a, rca_b, 0, sum, cout);



endmodule







