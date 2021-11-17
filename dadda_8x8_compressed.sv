`timescale 1ps/100fs

module dadda_8x8_compressed(
  input [7:0] a,
  input [7:0] b,
  output [15:0] P
);

  wire [7:0][7:0] p;


  product_8x8 pro(a, b, p);


  // stage 1
  wire [11:0] s0;
	wire [9:0]  c0;

	wire wh0;
  half_adder 			ha0  (p[4][0], p[3][1], s0[0], wh0);

  wire wc0;
  compressor_4_2 	com0 (p[5][0], p[4][1], p[3][2], p[2][3], wh0, s0[1], c0[0], wc0);

  wire wc1;
	wire wh1;
  compressor_4_2  com1 (p[6][0], p[5][1], p[4][2], p[3][3], wc0, s0[2], c0[1], wc1);
  half_adder 			ha1	 (p[2][4], p[1][5], s0[3], wh1);

  wire wc2;
  wire wc3;
  compressor_4_2  com2 (p[7][0], p[6][1], p[5][2], p[4][3], wc1, s0[4], c0[2], wc2);
  compressor_4_2  com3 (p[3][4], p[2][5], p[1][6], p[0][7], wh1, s0[5], c0[3], wc3);

  wire wc4;
  wire wc5;
  compressor_4_2  com4 (p[7][1], p[6][2], p[5][3], p[4][4], wc2, s0[6], c0[4], wc4);
  compressor_4_2  com5 (p[3][5], p[2][6], p[1][7], 		1'b0, wc3, s0[7], c0[5], wc5);

  wire wc6;
  compressor_4_2  com6 (p[7][2], p[6][3], p[5][4], p[4][5], wc4, s0[8], c0[6], wc6);
  full_adder      fa0  (p[3][6], p[2][7], wc5, s0[9], c0[7]);

  wire wc7;
  compressor_4_2  com7 (p[7][3], p[6][4], p[5][5], p[4][6], wc6, s0[10], c0[8], wc7);

  full_adder      fa1  (wc7, p[7][4], p[6][5], s0[11], c0[9]);


  // stage 2
  wire [11:0] s1;
  wire [10:0] c1;

  wire wh2;
  half_adder      ha2  (p[2][0], p[1][1], s1[0], wh2);

  wire wc8;
  compressor_4_2  com8 (p[3][0], p[2][1], p[1][2], p[0][3], wh2, s1[1], c1[0], wc8);
  
  wire wc9;
  compressor_4_2  com9 (s0[0], p[2][2], p[1][3], p[0][4], wc8, s1[2], c1[1], wc9);
  
  wire wc10;
  compressor_4_2  com10 (s0[1], p[1][4], p[0][5], 1'b0, wc9, s1[3], c1[2], wc10);
  
  wire wc11;
  compressor_4_2  com11 (s0[2], c0[0], s0[3], p[0][6], wc10, s1[4], c1[3], wc11);
  
  wire wc12;
  compressor_4_2  com12 (s0[4], c0[1], s0[5], 1'b0, wc11, s1[5], c1[4], wc12);
  
  wire wc13;
  compressor_4_2  com13 (s0[6], c0[2], s0[7], c0[3], wc12, s1[6], c1[5], wc13);
  
  wire wc14;
  compressor_4_2  com14 (s0[8], c0[4], s0[9], c0[5], wc13, s1[7], c1[6], wc14);
  
  wire wc15;
  compressor_4_2  com15 (s0[10], c0[6], c0[7], p[3][7], wc14, s1[8], c1[7], wc15);
  
  wire wc16;
  compressor_4_2  com16 (s0[11], c0[8], p[5][6], p[4][7], wc15, s1[9], c1[8], wc16);
  
  wire wc17;
  compressor_4_2  com17 (c0[9], p[7][5], p[6][6], p[5][7], wc16, s1[10], c1[9], wc17);

  full_adder      fa2   (p[7][6], p[6][7], wc17, s1[11], c1[10]);

  // cpa
  wire [13:0] pa, pb;

  assign pa[13] = c1[10];
  assign pa[12] = s1[11];
  assign pa[11] = s1[10];
  assign pa[10] = s1[9];
  assign pa[9]  = s1[8];
  assign pa[8]  = s1[7];
  assign pa[7]  = s1[6];
  assign pa[6]  = s1[5];
  assign pa[5]  = s1[4];
  assign pa[4]  = s1[3];
  assign pa[3]  = s1[2];
  assign pa[2]  = s1[1];
  assign pa[1]  = s1[0];
  assign pa[0]  = p[1][0];

  assign pb[13] = p[7][7];
  assign pb[12] = c1[9];
  assign pb[11] = c1[8];
  assign pb[10] = c1[7];
  assign pb[9]  = c1[6];
  assign pb[8]  = c1[5];
  assign pb[7]  = c1[4];
  assign pb[6]  = c1[3];
  assign pb[5]  = c1[2];
  assign pb[4]  = c1[1];
  assign pb[3]  = c1[0];
  assign pb[2]  = 0;
  assign pb[1]  = p[0][2];
  assign pb[0]  = p[0][1];
  
  rca_14b rca(pa, pb, 1'b0, P[14:1], P[15]);
  assign P[0] = p[0][0];

endmodule 

module dadda_8x8_compressed_ld(
  input [7:0] a,
  input [7:0] b,
  output [15:0] P
);

  wire [7:0][7:0] p;


  product_8x8 pro(a, b, p);


  // stage 1
  wire [11:0] s0;
	wire [9:0]  c0;

	wire wh0;
  half_adder 			ha0  (p[4][0], p[3][1], s0[0], wh0);

  wire wc0;
  compressor_4_2_ld 	com0 (p[5][0], p[4][1], p[3][2], p[2][3], wh0, s0[1], c0[0], wc0);

  wire wc1;
	wire wh1;
  compressor_4_2_ld  com1 (p[6][0], p[5][1], p[4][2], p[3][3], wc0, s0[2], c0[1], wc1);
  half_adder 			ha1	 (p[2][4], p[1][5], s0[3], wh1);

  wire wc2;
  wire wc3;
  compressor_4_2_ld  com2 (p[7][0], p[6][1], p[5][2], p[4][3], wc1, s0[4], c0[2], wc2);
  compressor_4_2_ld  com3 (p[3][4], p[2][5], p[1][6], p[0][7], wh1, s0[5], c0[3], wc3);

  wire wc4;
  wire wc5;
  compressor_4_2_ld  com4 (p[7][1], p[6][2], p[5][3], p[4][4], wc2, s0[6], c0[4], wc4);
  compressor_4_2_ld  com5 (p[3][5], p[2][6], p[1][7], 		1'b0, wc3, s0[7], c0[5], wc5);

  wire wc6;
  compressor_4_2_ld  com6 (p[7][2], p[6][3], p[5][4], p[4][5], wc4, s0[8], c0[6], wc6);
  full_adder      fa0  (p[3][6], p[2][7], wc5, s0[9], c0[7]);

  wire wc7;
  compressor_4_2_ld  com7 (p[7][3], p[6][4], p[5][5], p[4][6], wc6, s0[10], c0[8], wc7);

  full_adder      fa1  (wc7, p[7][4], p[6][5], s0[11], c0[9]);


  // stage 2
  wire [11:0] s1;
  wire [10:0] c1;

  wire wh2;
  half_adder      ha2  (p[2][0], p[1][1], s1[0], wh2);

  wire wc8;
  compressor_4_2_ld  com8 (p[3][0], p[2][1], p[1][2], p[0][3], wh2, s1[1], c1[0], wc8);
  
  wire wc9;
  compressor_4_2_ld  com9 (s0[0], p[2][2], p[1][3], p[0][4], wc8, s1[2], c1[1], wc9);
  
  wire wc10;
  compressor_4_2_ld  com10 (s0[1], p[1][4], p[0][5], 1'b0, wc9, s1[3], c1[2], wc10);
  
  wire wc11;
  compressor_4_2_ld  com11 (s0[2], c0[0], s0[3], p[0][6], wc10, s1[4], c1[3], wc11);
  
  wire wc12;
  compressor_4_2_ld  com12 (s0[4], c0[1], s0[5], 1'b0, wc11, s1[5], c1[4], wc12);
  
  wire wc13;
  compressor_4_2_ld  com13 (s0[6], c0[2], s0[7], c0[3], wc12, s1[6], c1[5], wc13);
  
  wire wc14;
  compressor_4_2_ld  com14 (s0[8], c0[4], s0[9], c0[5], wc13, s1[7], c1[6], wc14);
  
  wire wc15;
  compressor_4_2_ld  com15 (s0[10], c0[6], c0[7], p[3][7], wc14, s1[8], c1[7], wc15);
  
  wire wc16;
  compressor_4_2_ld  com16 (s0[11], c0[8], p[5][6], p[4][7], wc15, s1[9], c1[8], wc16);
  
  wire wc17;
  compressor_4_2_ld  com17 (c0[9], p[7][5], p[6][6], p[5][7], wc16, s1[10], c1[9], wc17);

  full_adder      fa2   (p[7][6], p[6][7], wc17, s1[11], c1[10]);

  // cpa
  wire [13:0] pa, pb;

  assign pa[13] = c1[10];
  assign pa[12] = s1[11];
  assign pa[11] = s1[10];
  assign pa[10] = s1[9];
  assign pa[9]  = s1[8];
  assign pa[8]  = s1[7];
  assign pa[7]  = s1[6];
  assign pa[6]  = s1[5];
  assign pa[5]  = s1[4];
  assign pa[4]  = s1[3];
  assign pa[3]  = s1[2];
  assign pa[2]  = s1[1];
  assign pa[1]  = s1[0];
  assign pa[0]  = p[1][0];

  assign pb[13] = p[7][7];
  assign pb[12] = c1[9];
  assign pb[11] = c1[8];
  assign pb[10] = c1[7];
  assign pb[9]  = c1[6];
  assign pb[8]  = c1[5];
  assign pb[7]  = c1[4];
  assign pb[6]  = c1[3];
  assign pb[5]  = c1[2];
  assign pb[4]  = c1[1];
  assign pb[3]  = c1[0];
  assign pb[2]  = 0;
  assign pb[1]  = p[0][2];
  assign pb[0]  = p[0][1];
  
  rca_14b rca(pa, pb, 1'b0, P[14:1], P[15]);
  assign P[0] = p[0][0];

endmodule 
