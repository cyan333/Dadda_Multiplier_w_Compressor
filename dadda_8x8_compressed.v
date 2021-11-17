module dadda_8x8_compressed(
  input a[7:0],
  input b[7:0],
  output P[15:0]
);

  wire [7:0][7:0] p;


  product_8x8 pro(a, b, p);

  // stage 1
  wire [11:0] c1, s1
  wire [6: 0] cout1;

  half_adder ha0(p[4][0], p[3][1], s1[0], c1[0]);
  half_adder ha1(p[2][4], p[1][5], s1[3], c1[3]);
  half_adder ha2(p[3][6], p[2][7], s1[9], c1[9]);
  half_adder ha3(p[7][4], p[6][5], s1[11], c1[11]);

  full_adder fa0(p[3][5], p[2][6], p[1][7], 0, s1[7], c1[7]);

  compressor_4_2 com0(p[5][0], p[4][1], p[3][2], p[2][3],        0,  s1[1],  c1[1], cout1[0]);
  compressor_4_2 com1(p[6][0], p[5][1], p[4][2], p[3][3], cout1[0],  s1[2],  c1[1], cout1[1]);
  compressor_4_2 com2(p[7][0], p[6][1], p[5][2], p[4][3], cout1[1],  s1[4],  c1[4], cout1[2]);
  compressor_4_2 com3(p[3][4], p[2][5], p[1][6], p[0][7],        0,  s1[5],  c1[5], cout1[3]);
  compressor_4_2 com4(p[7][1], p[6][2], p[5][3], p[4][4], cout1[2],  s1[6],  c1[6], cout1[4]);
  compressor_4_2 com5(p[7][2], p[6][3], p[5][4], p[4][5], cout1[4],  s1[8],  c1[8], cout1[5]);
  compressor_4_2 com6(p[7][3], p[6][4], p[5][5], p[4][6], cout1[5], s1[10], c1[10], cout1[6]);

  // stage 2

endmodule 
