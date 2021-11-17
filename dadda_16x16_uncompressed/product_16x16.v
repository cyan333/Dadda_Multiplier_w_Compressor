`timescale 1ps/100fs
module product_16x16(
	input [15:0] a,
	input [15:0] b,
	output[15:0] [15:0] p 
);
  assign p[0][0] = a[0] & b[0];
assign p[1][0] = a[1] & b[0];
assign p[2][0] = a[2] & b[0];
assign p[3][0] = a[3] & b[0];
assign p[4][0] = a[4] & b[0];
assign p[5][0] = a[5] & b[0];
assign p[6][0] = a[6] & b[0];
assign p[7][0] = a[7] & b[0];
assign p[8][0] = a[8] & b[0];
assign p[9][0] = a[9] & b[0];
assign p[10][0] = a[10] & b[0];
assign p[11][0] = a[11] & b[0];
assign p[12][0] = a[12] & b[0];
assign p[13][0] = a[13] & b[0];
assign p[14][0] = a[14] & b[0];
assign p[15][0] = a[15] & b[0];
assign p[0][1] = a[0] & b[1];
assign p[1][1] = a[1] & b[1];
assign p[2][1] = a[2] & b[1];
assign p[3][1] = a[3] & b[1];
assign p[4][1] = a[4] & b[1];
assign p[5][1] = a[5] & b[1];
assign p[6][1] = a[6] & b[1];
assign p[7][1] = a[7] & b[1];
assign p[8][1] = a[8] & b[1];
assign p[9][1] = a[9] & b[1];
assign p[10][1] = a[10] & b[1];
assign p[11][1] = a[11] & b[1];
assign p[12][1] = a[12] & b[1];
assign p[13][1] = a[13] & b[1];
assign p[14][1] = a[14] & b[1];
assign p[15][1] = a[15] & b[1];
assign p[0][2] = a[0] & b[2];
assign p[1][2] = a[1] & b[2];
assign p[2][2] = a[2] & b[2];
assign p[3][2] = a[3] & b[2];
assign p[4][2] = a[4] & b[2];
assign p[5][2] = a[5] & b[2];
assign p[6][2] = a[6] & b[2];
assign p[7][2] = a[7] & b[2];
assign p[8][2] = a[8] & b[2];
assign p[9][2] = a[9] & b[2];
assign p[10][2] = a[10] & b[2];
assign p[11][2] = a[11] & b[2];
assign p[12][2] = a[12] & b[2];
assign p[13][2] = a[13] & b[2];
assign p[14][2] = a[14] & b[2];
assign p[15][2] = a[15] & b[2];
assign p[0][3] = a[0] & b[3];
assign p[1][3] = a[1] & b[3];
assign p[2][3] = a[2] & b[3];
assign p[3][3] = a[3] & b[3];
assign p[4][3] = a[4] & b[3];
assign p[5][3] = a[5] & b[3];
assign p[6][3] = a[6] & b[3];
assign p[7][3] = a[7] & b[3];
assign p[8][3] = a[8] & b[3];
assign p[9][3] = a[9] & b[3];
assign p[10][3] = a[10] & b[3];
assign p[11][3] = a[11] & b[3];
assign p[12][3] = a[12] & b[3];
assign p[13][3] = a[13] & b[3];
assign p[14][3] = a[14] & b[3];
assign p[15][3] = a[15] & b[3];
assign p[0][4] = a[0] & b[4];
assign p[1][4] = a[1] & b[4];
assign p[2][4] = a[2] & b[4];
assign p[3][4] = a[3] & b[4];
assign p[4][4] = a[4] & b[4];
assign p[5][4] = a[5] & b[4];
assign p[6][4] = a[6] & b[4];
assign p[7][4] = a[7] & b[4];
assign p[8][4] = a[8] & b[4];
assign p[9][4] = a[9] & b[4];
assign p[10][4] = a[10] & b[4];
assign p[11][4] = a[11] & b[4];
assign p[12][4] = a[12] & b[4];
assign p[13][4] = a[13] & b[4];
assign p[14][4] = a[14] & b[4];
assign p[15][4] = a[15] & b[4];
assign p[0][5] = a[0] & b[5];
assign p[1][5] = a[1] & b[5];
assign p[2][5] = a[2] & b[5];
assign p[3][5] = a[3] & b[5];
assign p[4][5] = a[4] & b[5];
assign p[5][5] = a[5] & b[5];
assign p[6][5] = a[6] & b[5];
assign p[7][5] = a[7] & b[5];
assign p[8][5] = a[8] & b[5];
assign p[9][5] = a[9] & b[5];
assign p[10][5] = a[10] & b[5];
assign p[11][5] = a[11] & b[5];
assign p[12][5] = a[12] & b[5];
assign p[13][5] = a[13] & b[5];
assign p[14][5] = a[14] & b[5];
assign p[15][5] = a[15] & b[5];
assign p[0][6] = a[0] & b[6];
assign p[1][6] = a[1] & b[6];
assign p[2][6] = a[2] & b[6];
assign p[3][6] = a[3] & b[6];
assign p[4][6] = a[4] & b[6];
assign p[5][6] = a[5] & b[6];
assign p[6][6] = a[6] & b[6];
assign p[7][6] = a[7] & b[6];
assign p[8][6] = a[8] & b[6];
assign p[9][6] = a[9] & b[6];
assign p[10][6] = a[10] & b[6];
assign p[11][6] = a[11] & b[6];
assign p[12][6] = a[12] & b[6];
assign p[13][6] = a[13] & b[6];
assign p[14][6] = a[14] & b[6];
assign p[15][6] = a[15] & b[6];
assign p[0][7] = a[0] & b[7];
assign p[1][7] = a[1] & b[7];
assign p[2][7] = a[2] & b[7];
assign p[3][7] = a[3] & b[7];
assign p[4][7] = a[4] & b[7];
assign p[5][7] = a[5] & b[7];
assign p[6][7] = a[6] & b[7];
assign p[7][7] = a[7] & b[7];
assign p[8][7] = a[8] & b[7];
assign p[9][7] = a[9] & b[7];
assign p[10][7] = a[10] & b[7];
assign p[11][7] = a[11] & b[7];
assign p[12][7] = a[12] & b[7];
assign p[13][7] = a[13] & b[7];
assign p[14][7] = a[14] & b[7];
assign p[15][7] = a[15] & b[7];
assign p[0][8] = a[0] & b[8];
assign p[1][8] = a[1] & b[8];
assign p[2][8] = a[2] & b[8];
assign p[3][8] = a[3] & b[8];
assign p[4][8] = a[4] & b[8];
assign p[5][8] = a[5] & b[8];
assign p[6][8] = a[6] & b[8];
assign p[7][8] = a[7] & b[8];
assign p[8][8] = a[8] & b[8];
assign p[9][8] = a[9] & b[8];
assign p[10][8] = a[10] & b[8];
assign p[11][8] = a[11] & b[8];
assign p[12][8] = a[12] & b[8];
assign p[13][8] = a[13] & b[8];
assign p[14][8] = a[14] & b[8];
assign p[15][8] = a[15] & b[8];
assign p[0][9] = a[0] & b[9];
assign p[1][9] = a[1] & b[9];
assign p[2][9] = a[2] & b[9];
assign p[3][9] = a[3] & b[9];
assign p[4][9] = a[4] & b[9];
assign p[5][9] = a[5] & b[9];
assign p[6][9] = a[6] & b[9];
assign p[7][9] = a[7] & b[9];
assign p[8][9] = a[8] & b[9];
assign p[9][9] = a[9] & b[9];
assign p[10][9] = a[10] & b[9];
assign p[11][9] = a[11] & b[9];
assign p[12][9] = a[12] & b[9];
assign p[13][9] = a[13] & b[9];
assign p[14][9] = a[14] & b[9];
assign p[15][9] = a[15] & b[9];
assign p[0][10] = a[0] & b[10];
assign p[1][10] = a[1] & b[10];
assign p[2][10] = a[2] & b[10];
assign p[3][10] = a[3] & b[10];
assign p[4][10] = a[4] & b[10];
assign p[5][10] = a[5] & b[10];
assign p[6][10] = a[6] & b[10];
assign p[7][10] = a[7] & b[10];
assign p[8][10] = a[8] & b[10];
assign p[9][10] = a[9] & b[10];
assign p[10][10] = a[10] & b[10];
assign p[11][10] = a[11] & b[10];
assign p[12][10] = a[12] & b[10];
assign p[13][10] = a[13] & b[10];
assign p[14][10] = a[14] & b[10];
assign p[15][10] = a[15] & b[10];
assign p[0][11] = a[0] & b[11];
assign p[1][11] = a[1] & b[11];
assign p[2][11] = a[2] & b[11];
assign p[3][11] = a[3] & b[11];
assign p[4][11] = a[4] & b[11];
assign p[5][11] = a[5] & b[11];
assign p[6][11] = a[6] & b[11];
assign p[7][11] = a[7] & b[11];
assign p[8][11] = a[8] & b[11];
assign p[9][11] = a[9] & b[11];
assign p[10][11] = a[10] & b[11];
assign p[11][11] = a[11] & b[11];
assign p[12][11] = a[12] & b[11];
assign p[13][11] = a[13] & b[11];
assign p[14][11] = a[14] & b[11];
assign p[15][11] = a[15] & b[11];
assign p[0][12] = a[0] & b[12];
assign p[1][12] = a[1] & b[12];
assign p[2][12] = a[2] & b[12];
assign p[3][12] = a[3] & b[12];
assign p[4][12] = a[4] & b[12];
assign p[5][12] = a[5] & b[12];
assign p[6][12] = a[6] & b[12];
assign p[7][12] = a[7] & b[12];
assign p[8][12] = a[8] & b[12];
assign p[9][12] = a[9] & b[12];
assign p[10][12] = a[10] & b[12];
assign p[11][12] = a[11] & b[12];
assign p[12][12] = a[12] & b[12];
assign p[13][12] = a[13] & b[12];
assign p[14][12] = a[14] & b[12];
assign p[15][12] = a[15] & b[12];
assign p[0][13] = a[0] & b[13];
assign p[1][13] = a[1] & b[13];
assign p[2][13] = a[2] & b[13];
assign p[3][13] = a[3] & b[13];
assign p[4][13] = a[4] & b[13];
assign p[5][13] = a[5] & b[13];
assign p[6][13] = a[6] & b[13];
assign p[7][13] = a[7] & b[13];
assign p[8][13] = a[8] & b[13];
assign p[9][13] = a[9] & b[13];
assign p[10][13] = a[10] & b[13];
assign p[11][13] = a[11] & b[13];
assign p[12][13] = a[12] & b[13];
assign p[13][13] = a[13] & b[13];
assign p[14][13] = a[14] & b[13];
assign p[15][13] = a[15] & b[13];
assign p[0][14] = a[0] & b[14];
assign p[1][14] = a[1] & b[14];
assign p[2][14] = a[2] & b[14];
assign p[3][14] = a[3] & b[14];
assign p[4][14] = a[4] & b[14];
assign p[5][14] = a[5] & b[14];
assign p[6][14] = a[6] & b[14];
assign p[7][14] = a[7] & b[14];
assign p[8][14] = a[8] & b[14];
assign p[9][14] = a[9] & b[14];
assign p[10][14] = a[10] & b[14];
assign p[11][14] = a[11] & b[14];
assign p[12][14] = a[12] & b[14];
assign p[13][14] = a[13] & b[14];
assign p[14][14] = a[14] & b[14];
assign p[15][14] = a[15] & b[14];
assign p[0][15] = a[0] & b[15];
assign p[1][15] = a[1] & b[15];
assign p[2][15] = a[2] & b[15];
assign p[3][15] = a[3] & b[15];
assign p[4][15] = a[4] & b[15];
assign p[5][15] = a[5] & b[15];
assign p[6][15] = a[6] & b[15];
assign p[7][15] = a[7] & b[15];
assign p[8][15] = a[8] & b[15];
assign p[9][15] = a[9] & b[15];
assign p[10][15] = a[10] & b[15];
assign p[11][15] = a[11] & b[15];
assign p[12][15] = a[12] & b[15];
assign p[13][15] = a[13] & b[15];
assign p[14][15] = a[14] & b[15];
assign p[15][15] = a[15] & b[15];
endmodule