`timescale 1ps/100fs
module dadda_16x16_compressed(
  input [15:0] a,
  input [15:0] b,
  output [31:0] P
);
  
  wire [15:0][15:0] p;

  product_16x16 pro (a, b, p);

  // level 1
  wire [39:0] s0;
  wire [35:0] c0;

  wire wh0;
  half_adder     ha0  (p[8][0], p[7][1], s0[0], wh0);

  wire wc0;
  compressor_4_2 com0 (p[9][0], p[8][1], p[7][2], p[6][3], wh0, s0[1], c0[0], wc0);

  wire wc1, wh1;
  compressor_4_2 com1 (p[10][0], p[9][1], p[8][2], p[7][3], wc0, s0[2], c0[1], wc1);
  half_adder     ha1  (p[6][4], p[5][5], s0[3], wh1);

  wire wc2, wc3; 
  compressor_4_2 com2 (p[11][0], p[10][1], p[9][2], p[8][3], wc1, s0[4], c0[2], wc2);
  compressor_4_2 com3 (p[7][4], p[6][5], p[5][6], p[4][7], wh1, s0[5], c0[3], wc3);

  wire wc4, wc5, wh2;
  compressor_4_2 com4 (p[12][0], p[11][1], p[10][2], p[9][3], wc2, s0[6], c0[4], wc4);
  compressor_4_2 com5 (p[8][4], p[7][5], p[6][6], p[5][7], wc3, s0[7], c0[5], wc5);
  half_adder     ha2  (p[4][8], p[3][9], s0[8], wh2);

  wire wc6, wc7, wc8;
  compressor_4_2 com6 (p[13][0], p[12][1], p[11][2], p[10][3], wc4, s0[9], c0[6], wc6);
  compressor_4_2 com7 (p[9][4], p[8][5], p[7][6], p[6][7], wc5, s0[10], c0[7], wc7);
  compressor_4_2 com8 (p[5][8], p[4][9], p[3][10], p[2][11], wh2, s0[11], c0[8], wc8);

  wire wc9, wc10, wc11, wh3;
  compressor_4_2 com9  (p[14][0], p[13][1], p[12][2], p[11][3], wc6, s0[12], c0[9], wc9);
  compressor_4_2 com10 (p[10][4], p[9][5], p[8][6], p[7][7], wc7, s0[13], c0[10], wc10);
  compressor_4_2 com11 (p[6][8], p[5][9], p[4][10], p[3][11], wc8, s0[14], c0[11], wc11);
  half_adder     ha3   (p[2][12], p[1][13], s0[15], wh3);

  wire wc12, wc13, wc14, wc15;
  compressor_4_2 com12 (p[15][0], p[14][1], p[13][2], p[12][3], wc9, s0[16], c0[12], wc12);
  compressor_4_2 com13 (p[11][4], p[10][5], p[9][6], p[8][7], wc10, s0[17], c0[13], wc13);
  compressor_4_2 com14 (p[7][8], p[6][9], p[5][10], p[4][11], wc11, s0[18], c0[14], wc14);
  compressor_4_2 com15 (p[3][12], p[2][13], p[1][14], p[0][15], wh3, s0[19], c0[15], wc15);

  wire wc16, wc17, wc18, wc19;
  compressor_4_2 com16 (p[15][1], p[14][2], p[13][3], p[12][4], wc12, s0[20], c0[16], wc16);
  compressor_4_2 com17 (p[11][5], p[10][6], p[9][7], p[8][8], wc13, s0[21], c0[17], wc17);
  compressor_4_2 com18 (p[7][9], p[6][10], p[5][11], p[4][12], wc14, s0[22], c0[18], wc18);
  compressor_4_2 com19 (p[3][13], p[2][14], p[1][15], 1'b0, wc15, s0[23], c0[19], wc19);

  wire wc20, wc21, wc22;
  compressor_4_2 com20 (p[15][2], p[14][3], p[13][4], p[12][5], wc16, s0[24], c0[20], wc20);
  compressor_4_2 com21 (p[11][6], p[10][7], p[9][8], p[8][9], wc17, s0[25], c0[21], wc21);
  compressor_4_2 com22 (p[7][10], p[6][11], p[5][12], p[4][13], wc18, s0[26], c0[22], wc22);
  full_adder     fa0   (p[3][14], p[2][15], wc19, s0[27], c0[23]);

  wire wc23, wc24, wc25;
  compressor_4_2 com23 (p[15][3], p[14][4], p[13][5], p[12][6], wc20, s0[28], c0[24], wc23);
  compressor_4_2 com24 (p[11][7], p[10][8], p[9][9], p[8][10], wc21, s0[29], c0[25], wc24);
  compressor_4_2 com25 (p[7][11], p[6][12], p[5][13], p[4][14], wc22, s0[30], c0[26], wc25);

  wire wc26, wc27;
  compressor_4_2 com26 (p[15][4], p[14][5], p[13][6], p[12][7], wc23, s0[31], c0[27], wc26);
  compressor_4_2 com27 (p[11][8], p[10][9], p[9][10], p[8][11], wc24, s0[32], c0[28], wc27);
  full_adder     fa1   (p[7][12], p[6][13], wc25, s0[33], c0[29]);

  wire wc28, wc29;
  compressor_4_2 com28 (p[15][5], p[14][6], p[13][7], p[12][8], wc26, s0[34], c0[30], wc28);
  compressor_4_2 com29 (p[11][9], p[10][10], p[9][11], p[8][12], wc27, s0[35], c0[31], wc29);

  wire wc30;
  compressor_4_2 com30 (p[15][6], p[14][7], p[13][8], p[12][9], wc28, s0[36], c0[32], wc30);
  full_adder     fa2   (p[11][10], p[10][11], wc29, s0[37], c0[33]);

  wire wc31;
  compressor_4_2 com31 (p[15][7], p[14][8], p[13][9], p[12][10], wc30, s0[38], c0[34], wc31);

  full_adder     fa3   (p[15][8], p[14][9], wc31, s0[39], c0[35]);

  // level 2
  wire [43:0] s1;
  wire [41:0] c1;

  wire wh4;
  half_adder     ha4   (p[4][0], p[3][1], s1[0], wh4);

  wire wc32;
  compressor_4_2 com32 (p[5][0], p[4][1], p[3][2], p[2][3], wh4, s1[1], c1[0], wc32);

  wire wc33, wh5;
  compressor_4_2 com33 (p[6][0], p[5][1], p[4][2], p[3][3], wc32, s1[2], c1[1], wc33);
  half_adder     ha5   (p[2][4], p[1][5], s1[3], wh5);

  wire wc34, wc35;
  compressor_4_2 com34 (p[7][0], p[6][1], p[5][2], p[4][3], wc33, s1[4], c1[2], wc34);
  compressor_4_2 com35 (p[3][4], p[2][5], p[1][6], p[0][7], wh5, s1[5], c1[3], wc35);

  wire wc36, wc37;
  compressor_4_2 com36 (s0[0], p[6][2], p[5][3], p[4][4], wc34, s1[6], c1[4], wc36);
  compressor_4_2 com37 (p[3][5], p[2][6], p[1][7], p[0][8], wc35, s1[7], c1[5], wc37);
  
  wire wc38, wc39;
  compressor_4_2 com38 (s0[1], p[5][4], p[4][5], p[3][6], wc36, s1[8], c1[6], wc38);
  compressor_4_2 com39 (p[2][7], p[1][8], p[0][9], 1'b0, wc37, s1[9], c1[7], wc39);

  wire wc40, wc41;
  compressor_4_2 com40 (s0[2], c0[0], s0[3], p[4][6], wc38, s1[10], c1[8], wc40);
  compressor_4_2 com41 (p[3][7], p[2][8], p[1][9], p[0][10], wc39, s1[11], c1[9], wc41);

  wire wc42, wc43;
  compressor_4_2 com42 (s0[4], c0[1], s0[5], p[3][8], wc40, s1[12], c1[10], wc42);
  compressor_4_2 com43 (p[2][9], p[1][10], p[0][11], 1'b0, wc41, s1[13], c1[11], wc43);
  
  wire wc44, wc45;
  compressor_4_2 com44 (s0[6], c0[2], s0[7], c0[3], wc42, s1[14], c1[12], wc44);
  compressor_4_2 com45 (s0[8], p[2][10], p[1][11], p[0][12], wc43, s1[15], c1[13], wc45);
 
  wire wc46, wc47;
  compressor_4_2 com46 (s0[9], c0[4], s0[10], c0[5], wc44, s1[16], c1[14], wc46);
  compressor_4_2 com47 (s0[11], p[1][12], p[0][13], 1'b0, wc45, s1[17], c1[15], wc47);
  
  wire wc48, wc49;
  compressor_4_2 com48 (s0[12], c0[6], s0[13], c0[7], wc46, s1[18], c1[16], wc48);
  compressor_4_2 com49 (s0[14], c0[8], s0[15], p[0][14], wc47, s1[19], c1[17], wc49);
 
  wire wc50, wc51;
  compressor_4_2 com50 (s0[16], c0[9], s0[17], c0[10], wc48, s1[20], c1[18], wc50);
  compressor_4_2 com51 (s0[18], c0[11], s0[19], 1'b0, wc49, s1[21], c1[19], wc51);
  
  wire wc52, wc53;
  compressor_4_2 com52 (s0[20], c0[12], s0[21], c0[13], wc50, s1[22], c1[20], wc52);
  compressor_4_2 com53 (s0[22], c0[14], s0[23], c0[15], wc51, s1[23], c1[21], wc53);
  
  wire wc54, wc55;
  compressor_4_2 com54 (s0[24], c0[16], s0[25], c0[17], wc52, s1[24], c1[22], wc54);
  compressor_4_2 com55 (s0[26], c0[18], s0[27], c0[19], wc53, s1[25], c1[23], wc55);
  
  wire wc56, wc57;
  compressor_4_2 com56 (s0[28], c0[20], s0[29], c0[21], wc54, s1[26], c1[24], wc56);
  compressor_4_2 com57 (s0[30], c0[22], p[3][15], c0[23], wc55, s1[27], c1[25], wc57);

  wire wc58, wc59;
  compressor_4_2 com58 (s0[31], c0[24], s0[32], c0[25], wc56, s1[28], c1[26], wc58);
  compressor_4_2 com59 (s0[33], c0[26], p[5][14], p[4][15], wc57, s1[29], c1[27], wc59);
  
  wire wc60, wc61;
  compressor_4_2 com60 (s0[34], c0[27], s0[35], c0[28], wc58, s1[30], c1[28], wc60);
  compressor_4_2 com61 (c0[29], p[7][13], p[6][14], p[5][15], wc59, s1[31], c1[29], wc61);
  
  wire wc62, wc63;
  compressor_4_2 com62 (s0[36], c0[30], s0[37], c0[31], wc60, s1[32], c1[30], wc62);
  compressor_4_2 com63 (p[9][12], p[8][13], p[7][14], p[6][15], wc61, s1[33], c1[31], wc63);
  
  wire wc64, wc65;
  compressor_4_2 com64 (s0[38], c0[32], c0[33], p[11][11], wc62, s1[34], c1[32], wc64);
  compressor_4_2 com65 (p[10][12], p[9][13], p[8][14], p[7][15], wc63, s1[35], c1[33], wc65);
  
  wire wc66, wc67;
  compressor_4_2 com66 (s0[39], c0[34], p[13][10], p[12][11], wc64, s1[36], c1[34], wc66);
  compressor_4_2 com67 (p[11][12], p[10][13], p[9][14], p[8][15], wc65, s1[37], c1[35], wc67);
  
  wire wc68, wc69;
  compressor_4_2 com68 (c0[35], p[15][9], p[14][10], p[13][11], wc66, s1[38], c1[36], wc68);
  compressor_4_2 com69 (p[12][12], p[11][13], p[10][14], p[9][15], wc67, s1[39], c1[37], wc69);

  wire wc70;
  compressor_4_2 com70 (p[15][10], p[14][11], p[13][12], p[12][13], wc68, s1[40], c1[38], wc70);
  full_adder     fa4   (p[11][14], p[10][15], wc69, s1[41], c1[39]);

  wire wc71;
  compressor_4_2 com71 (p[15][11], p[14][12], p[13][13], p[12][14], wc70, s1[42], c1[40], wc71);

  full_adder     fa5   (p[15][12], p[14][13], wc71, s1[43], c1[41]);

  // level 3
  wire [27:0] s2;
  wire [26:0] c2;

  wire wh6;
  half_adder     ha6   (p[2][0], p[1][1], s2[0], wh6);

  wire wc72;
  compressor_4_2 com72 (p[3][0], p[2][1], p[1][2], p[0][3], wh6, s2[1], c2[0], wc72);
  
  wire wc73;
  compressor_4_2 com73 (s1[0], p[2][2], p[1][3], p[0][4], wc72, s2[2], c2[1], wc73);
  
  wire wc74;
  compressor_4_2 com74 (s1[1], p[1][4], p[0][5], 1'b0, wc73, s2[3], c2[2], wc74);
  
  wire wc75;
  compressor_4_2 com75 (s1[2], c1[0], s1[3], p[0][6], wc74, s2[4], c2[3], wc75);
  
  wire wc76;
  compressor_4_2 com76 (s1[4], c1[1], s1[5], 1'b0, wc75, s2[5], c2[4], wc76);

  wire wc77;
  compressor_4_2 com77 (s1[6], c1[2], s1[7], c1[3], wc76, s2[6], c2[5], wc77);

  wire wc78;
  compressor_4_2 com78 (s1[8], c1[4], s1[9], c1[5], wc77, s2[7], c2[6], wc78);

  wire wc79;
  compressor_4_2 com79 (s1[10], c1[6], s1[11], c1[7], wc78, s2[8], c2[7], wc79);
  
  wire wc80;
  compressor_4_2 com80 (s1[12], c1[8], s1[13], c1[9], wc79, s2[9], c2[8], wc80);

  wire wc81;
  compressor_4_2 com81 (s1[14], c1[10], s1[15], c1[11], wc80, s2[10], c2[9], wc81);
  
  wire wc82;
  compressor_4_2 com82 (s1[16], c1[12], s1[17], c1[13], wc81, s2[11], c2[10], wc82);

  wire wc83;
  compressor_4_2 com83 (s1[18], c1[14], s1[19], c1[15], wc82, s2[12], c2[11], wc83);
  
  wire wc84;
  compressor_4_2 com84 (s1[20], c1[16], s1[21], c1[17], wc83, s2[13], c2[12], wc84);
  
  wire wc85;
  compressor_4_2 com85 (s1[22], c1[18], s1[23], c1[19], wc84, s2[14], c2[13], wc85);
  
  wire wc86;
  compressor_4_2 com86 (s1[24], c1[20], s1[25], c1[21], wc85, s2[15], c2[14], wc86);
  
  wire wc87;
  compressor_4_2 com87 (s1[26], c1[22], s1[27], c1[23], wc86, s2[16], c2[15], wc87);
  
  wire wc88;
  compressor_4_2 com88 (s1[28], c1[24], s1[29], c1[25], wc87, s2[17], c2[16], wc88);
  
  wire wc89;
  compressor_4_2 com89 (s1[30], c1[26], s1[31], c1[27], wc88, s2[18], c2[17], wc89);
  
  wire wc90;
  compressor_4_2 com90 (s1[32], c1[28], s1[33], c1[29], wc89, s2[19], c2[18], wc90);
  
  wire wc91;
  compressor_4_2 com91 (s1[34], c1[30], s1[35], c1[31], wc90, s2[20], c2[19], wc91);
  
  wire wc92;
  compressor_4_2 com92 (s1[36], c1[32], s1[37], c1[33], wc91, s2[21], c2[20], wc92);
  
  wire wc93;
  compressor_4_2 com93 (s1[38], c1[34], s1[39], c1[35], wc92, s2[22], c2[21], wc93);
  
  wire wc94;
  compressor_4_2 com94 (s1[40], c1[36], s1[41], c1[37], wc93, s2[23], c2[22], wc94);
  
  wire wc95;
  compressor_4_2 com95 (s1[42], c1[38], c1[39], p[11][15], wc94, s2[24], c2[23], wc95);
  
  wire wc96;
  compressor_4_2 com96 (s1[43], c1[40], p[13][14], p[12][15], wc95, s2[25], c2[24], wc96);
  
  wire wc97;
  compressor_4_2 com97 (c1[41], p[15][13], p[14][14], p[13][15], wc96, s2[26], c2[25], wc97);

  full_adder     fa6   (p[15][14], p[15][14], wc97, s2[27], c2[26]);

  // cpa
  wire [29:0] pa, pb;

  assign pa[29]   = c2[26];
  assign pa[28:1] = s2[27:0];
  assign pa[0]    = p[1][0];

  assign pb[29]   = p[15][15];
  assign pb[28:3] = c2[25:0];
  assign pb[2]    = 1'b0;
  assign pb[1]    = p[0][2];
  assign pb[0]    = p[0][1];

  rca_30b rca(pa, pb, 1'b0, P[30:1], P[31]);
  assign P[0] = p[0][0];

endmodule

module dadda_16x16_compressed_ld(
  input [15:0] a,
  input [15:0] b,
  output [31:0] P
);
  
  wire [15:0][15:0] p;

  product_16x16 pro (a, b, p);

  // level 1
  wire [39:0] s0;
  wire [35:0] c0;

  wire wh0;
  half_adder     ha0  (p[8][0], p[7][1], s0[0], wh0);

  wire wc0;
  compressor_4_2_ld com0 (p[9][0], p[8][1], p[7][2], p[6][3], wh0, s0[1], c0[0], wc0);

  wire wc1, wh1;
  compressor_4_2_ld com1 (p[10][0], p[9][1], p[8][2], p[7][3], wc0, s0[2], c0[1], wc1);
  half_adder     ha1  (p[6][4], p[5][5], s0[3], wh1);

  wire wc2, wc3; 
  compressor_4_2_ld com2 (p[11][0], p[10][1], p[9][2], p[8][3], wc1, s0[4], c0[2], wc2);
  compressor_4_2_ld com3 (p[7][4], p[6][5], p[5][6], p[4][7], wh1, s0[5], c0[3], wc3);

  wire wc4, wc5, wh2;
  compressor_4_2_ld com4 (p[12][0], p[11][1], p[10][2], p[9][3], wc2, s0[6], c0[4], wc4);
  compressor_4_2_ld com5 (p[8][4], p[7][5], p[6][6], p[5][7], wc3, s0[7], c0[5], wc5);
  half_adder     ha2  (p[4][8], p[3][9], s0[8], wh2);

  wire wc6, wc7, wc8;
  compressor_4_2_ld com6 (p[13][0], p[12][1], p[11][2], p[10][3], wc4, s0[9], c0[6], wc6);
  compressor_4_2_ld com7 (p[9][4], p[8][5], p[7][6], p[6][7], wc5, s0[10], c0[7], wc7);
  compressor_4_2_ld com8 (p[5][8], p[4][9], p[3][10], p[2][11], wh2, s0[11], c0[8], wc8);

  wire wc9, wc10, wc11, wh3;
  compressor_4_2_ld com9  (p[14][0], p[13][1], p[12][2], p[11][3], wc6, s0[12], c0[9], wc9);
  compressor_4_2_ld com10 (p[10][4], p[9][5], p[8][6], p[7][7], wc7, s0[13], c0[10], wc10);
  compressor_4_2_ld com11 (p[6][8], p[5][9], p[4][10], p[3][11], wc8, s0[14], c0[11], wc11);
  half_adder     ha3   (p[2][12], p[1][13], s0[15], wh3);

  wire wc12, wc13, wc14, wc15;
  compressor_4_2_ld com12 (p[15][0], p[14][1], p[13][2], p[12][3], wc9, s0[16], c0[12], wc12);
  compressor_4_2_ld com13 (p[11][4], p[10][5], p[9][6], p[8][7], wc10, s0[17], c0[13], wc13);
  compressor_4_2_ld com14 (p[7][8], p[6][9], p[5][10], p[4][11], wc11, s0[18], c0[14], wc14);
  compressor_4_2_ld com15 (p[3][12], p[2][13], p[1][14], p[0][15], wh3, s0[19], c0[15], wc15);

  wire wc16, wc17, wc18, wc19;
  compressor_4_2_ld com16 (p[15][1], p[14][2], p[13][3], p[12][4], wc12, s0[20], c0[16], wc16);
  compressor_4_2_ld com17 (p[11][5], p[10][6], p[9][7], p[8][8], wc13, s0[21], c0[17], wc17);
  compressor_4_2_ld com18 (p[7][9], p[6][10], p[5][11], p[4][12], wc14, s0[22], c0[18], wc18);
  compressor_4_2_ld com19 (p[3][13], p[2][14], p[1][15], 1'b0, wc15, s0[23], c0[19], wc19);

  wire wc20, wc21, wc22;
  compressor_4_2_ld com20 (p[15][2], p[14][3], p[13][4], p[12][5], wc16, s0[24], c0[20], wc20);
  compressor_4_2_ld com21 (p[11][6], p[10][7], p[9][8], p[8][9], wc17, s0[25], c0[21], wc21);
  compressor_4_2_ld com22 (p[7][10], p[6][11], p[5][12], p[4][13], wc18, s0[26], c0[22], wc22);
  full_adder     fa0   (p[3][14], p[2][15], wc19, s0[27], c0[23]);

  wire wc23, wc24, wc25;
  compressor_4_2_ld com23 (p[15][3], p[14][4], p[13][5], p[12][6], wc20, s0[28], c0[24], wc23);
  compressor_4_2_ld com24 (p[11][7], p[10][8], p[9][9], p[8][10], wc21, s0[29], c0[25], wc24);
  compressor_4_2_ld com25 (p[7][11], p[6][12], p[5][13], p[4][14], wc22, s0[30], c0[26], wc25);

  wire wc26, wc27;
  compressor_4_2_ld com26 (p[15][4], p[14][5], p[13][6], p[12][7], wc23, s0[31], c0[27], wc26);
  compressor_4_2_ld com27 (p[11][8], p[10][9], p[9][10], p[8][11], wc24, s0[32], c0[28], wc27);
  full_adder     fa1   (p[7][12], p[6][13], wc25, s0[33], c0[29]);

  wire wc28, wc29;
  compressor_4_2_ld com28 (p[15][5], p[14][6], p[13][7], p[12][8], wc26, s0[34], c0[30], wc28);
  compressor_4_2_ld com29 (p[11][9], p[10][10], p[9][11], p[8][12], wc27, s0[35], c0[31], wc29);

  wire wc30;
  compressor_4_2_ld com30 (p[15][6], p[14][7], p[13][8], p[12][9], wc28, s0[36], c0[32], wc30);
  full_adder     fa2   (p[11][10], p[10][11], wc29, s0[37], c0[33]);

  wire wc31;
  compressor_4_2_ld com31 (p[15][7], p[14][8], p[13][9], p[12][10], wc30, s0[38], c0[34], wc31);

  full_adder     fa3   (p[15][8], p[14][9], wc31, s0[39], c0[35]);

  // level 2
  wire [43:0] s1;
  wire [41:0] c1;

  wire wh4;
  half_adder     ha4   (p[4][0], p[3][1], s1[0], wh4);

  wire wc32;
  compressor_4_2_ld com32 (p[5][0], p[4][1], p[3][2], p[2][3], wh4, s1[1], c1[0], wc32);

  wire wc33, wh5;
  compressor_4_2_ld com33 (p[6][0], p[5][1], p[4][2], p[3][3], wc32, s1[2], c1[1], wc33);
  half_adder     ha5   (p[2][4], p[1][5], s1[3], wh5);

  wire wc34, wc35;
  compressor_4_2_ld com34 (p[7][0], p[6][1], p[5][2], p[4][3], wc33, s1[4], c1[2], wc34);
  compressor_4_2_ld com35 (p[3][4], p[2][5], p[1][6], p[0][7], wh5, s1[5], c1[3], wc35);

  wire wc36, wc37;
  compressor_4_2_ld com36 (s0[0], p[6][2], p[5][3], p[4][4], wc34, s1[6], c1[4], wc36);
  compressor_4_2_ld com37 (p[3][5], p[2][6], p[1][7], p[0][8], wc35, s1[7], c1[5], wc37);
  
  wire wc38, wc39;
  compressor_4_2_ld com38 (s0[1], p[5][4], p[4][5], p[3][6], wc36, s1[8], c1[6], wc38);
  compressor_4_2_ld com39 (p[2][7], p[1][8], p[0][9], 1'b0, wc37, s1[9], c1[7], wc39);

  wire wc40, wc41;
  compressor_4_2_ld com40 (s0[2], c0[0], s0[3], p[4][6], wc38, s1[10], c1[8], wc40);
  compressor_4_2_ld com41 (p[3][7], p[2][8], p[1][9], p[0][10], wc39, s1[11], c1[9], wc41);

  wire wc42, wc43;
  compressor_4_2_ld com42 (s0[4], c0[1], s0[5], p[3][8], wc40, s1[12], c1[10], wc42);
  compressor_4_2_ld com43 (p[2][9], p[1][10], p[0][11], 1'b0, wc41, s1[13], c1[11], wc43);
  
  wire wc44, wc45;
  compressor_4_2_ld com44 (s0[6], c0[2], s0[7], c0[3], wc42, s1[14], c1[12], wc44);
  compressor_4_2_ld com45 (s0[8], p[2][10], p[1][11], p[0][12], wc43, s1[15], c1[13], wc45);
 
  wire wc46, wc47;
  compressor_4_2_ld com46 (s0[9], c0[4], s0[10], c0[5], wc44, s1[16], c1[14], wc46);
  compressor_4_2_ld com47 (s0[11], p[1][12], p[0][13], 1'b0, wc45, s1[17], c1[15], wc47);
  
  wire wc48, wc49;
  compressor_4_2_ld com48 (s0[12], c0[6], s0[13], c0[7], wc46, s1[18], c1[16], wc48);
  compressor_4_2_ld com49 (s0[14], c0[8], s0[15], p[0][14], wc47, s1[19], c1[17], wc49);
 
  wire wc50, wc51;
  compressor_4_2_ld com50 (s0[16], c0[9], s0[17], c0[10], wc48, s1[20], c1[18], wc50);
  compressor_4_2_ld com51 (s0[18], c0[11], s0[19], 1'b0, wc49, s1[21], c1[19], wc51);
  
  wire wc52, wc53;
  compressor_4_2_ld com52 (s0[20], c0[12], s0[21], c0[13], wc50, s1[22], c1[20], wc52);
  compressor_4_2_ld com53 (s0[22], c0[14], s0[23], c0[15], wc51, s1[23], c1[21], wc53);
  
  wire wc54, wc55;
  compressor_4_2_ld com54 (s0[24], c0[16], s0[25], c0[17], wc52, s1[24], c1[22], wc54);
  compressor_4_2_ld com55 (s0[26], c0[18], s0[27], c0[19], wc53, s1[25], c1[23], wc55);
  
  wire wc56, wc57;
  compressor_4_2_ld com56 (s0[28], c0[20], s0[29], c0[21], wc54, s1[26], c1[24], wc56);
  compressor_4_2_ld com57 (s0[30], c0[22], p[3][15], c0[23], wc55, s1[27], c1[25], wc57);

  wire wc58, wc59;
  compressor_4_2_ld com58 (s0[31], c0[24], s0[32], c0[25], wc56, s1[28], c1[26], wc58);
  compressor_4_2_ld com59 (s0[33], c0[26], p[5][14], p[4][15], wc57, s1[29], c1[27], wc59);
  
  wire wc60, wc61;
  compressor_4_2_ld com60 (s0[34], c0[27], s0[35], c0[28], wc58, s1[30], c1[28], wc60);
  compressor_4_2_ld com61 (c0[29], p[7][13], p[6][14], p[5][15], wc59, s1[31], c1[29], wc61);
  
  wire wc62, wc63;
  compressor_4_2_ld com62 (s0[36], c0[30], s0[37], c0[31], wc60, s1[32], c1[30], wc62);
  compressor_4_2_ld com63 (p[9][12], p[8][13], p[7][14], p[6][15], wc61, s1[33], c1[31], wc63);
  
  wire wc64, wc65;
  compressor_4_2_ld com64 (s0[38], c0[32], c0[33], p[11][11], wc62, s1[34], c1[32], wc64);
  compressor_4_2_ld com65 (p[10][12], p[9][13], p[8][14], p[7][15], wc63, s1[35], c1[33], wc65);
  
  wire wc66, wc67;
  compressor_4_2_ld com66 (s0[39], c0[34], p[13][10], p[12][11], wc64, s1[36], c1[34], wc66);
  compressor_4_2_ld com67 (p[11][12], p[10][13], p[9][14], p[8][15], wc65, s1[37], c1[35], wc67);
  
  wire wc68, wc69;
  compressor_4_2_ld com68 (c0[35], p[15][9], p[14][10], p[13][11], wc66, s1[38], c1[36], wc68);
  compressor_4_2_ld com69 (p[12][12], p[11][13], p[10][14], p[9][15], wc67, s1[39], c1[37], wc69);

  wire wc70;
  compressor_4_2_ld com70 (p[15][10], p[14][11], p[13][12], p[12][13], wc68, s1[40], c1[38], wc70);
  full_adder     fa4   (p[11][14], p[10][15], wc69, s1[41], c1[39]);

  wire wc71;
  compressor_4_2_ld com71 (p[15][11], p[14][12], p[13][13], p[12][14], wc70, s1[42], c1[40], wc71);

  full_adder     fa5   (p[15][12], p[14][13], wc71, s1[43], c1[41]);

  // level 3
  wire [27:0] s2;
  wire [26:0] c2;

  wire wh6;
  half_adder     ha6   (p[2][0], p[1][1], s2[0], wh6);

  wire wc72;
  compressor_4_2_ld com72 (p[3][0], p[2][1], p[1][2], p[0][3], wh6, s2[1], c2[0], wc72);
  
  wire wc73;
  compressor_4_2_ld com73 (s1[0], p[2][2], p[1][3], p[0][4], wc72, s2[2], c2[1], wc73);
  
  wire wc74;
  compressor_4_2_ld com74 (s1[1], p[1][4], p[0][5], 1'b0, wc73, s2[3], c2[2], wc74);
  
  wire wc75;
  compressor_4_2_ld com75 (s1[2], c1[0], s1[3], p[0][6], wc74, s2[4], c2[3], wc75);
  
  wire wc76;
  compressor_4_2_ld com76 (s1[4], c1[1], s1[5], 1'b0, wc75, s2[5], c2[4], wc76);

  wire wc77;
  compressor_4_2_ld com77 (s1[6], c1[2], s1[7], c1[3], wc76, s2[6], c2[5], wc77);

  wire wc78;
  compressor_4_2_ld com78 (s1[8], c1[4], s1[9], c1[5], wc77, s2[7], c2[6], wc78);

  wire wc79;
  compressor_4_2_ld com79 (s1[10], c1[6], s1[11], c1[7], wc78, s2[8], c2[7], wc79);
  
  wire wc80;
  compressor_4_2_ld com80 (s1[12], c1[8], s1[13], c1[9], wc79, s2[9], c2[8], wc80);

  wire wc81;
  compressor_4_2_ld com81 (s1[14], c1[10], s1[15], c1[11], wc80, s2[10], c2[9], wc81);
  
  wire wc82;
  compressor_4_2_ld com82 (s1[16], c1[12], s1[17], c1[13], wc81, s2[11], c2[10], wc82);

  wire wc83;
  compressor_4_2_ld com83 (s1[18], c1[14], s1[19], c1[15], wc82, s2[12], c2[11], wc83);
  
  wire wc84;
  compressor_4_2_ld com84 (s1[20], c1[16], s1[21], c1[17], wc83, s2[13], c2[12], wc84);
  
  wire wc85;
  compressor_4_2_ld com85 (s1[22], c1[18], s1[23], c1[19], wc84, s2[14], c2[13], wc85);
  
  wire wc86;
  compressor_4_2_ld com86 (s1[24], c1[20], s1[25], c1[21], wc85, s2[15], c2[14], wc86);
  
  wire wc87;
  compressor_4_2_ld com87 (s1[26], c1[22], s1[27], c1[23], wc86, s2[16], c2[15], wc87);
  
  wire wc88;
  compressor_4_2_ld com88 (s1[28], c1[24], s1[29], c1[25], wc87, s2[17], c2[16], wc88);
  
  wire wc89;
  compressor_4_2_ld com89 (s1[30], c1[26], s1[31], c1[27], wc88, s2[18], c2[17], wc89);
  
  wire wc90;
  compressor_4_2_ld com90 (s1[32], c1[28], s1[33], c1[29], wc89, s2[19], c2[18], wc90);
  
  wire wc91;
  compressor_4_2_ld com91 (s1[34], c1[30], s1[35], c1[31], wc90, s2[20], c2[19], wc91);
  
  wire wc92;
  compressor_4_2_ld com92 (s1[36], c1[32], s1[37], c1[33], wc91, s2[21], c2[20], wc92);
  
  wire wc93;
  compressor_4_2_ld com93 (s1[38], c1[34], s1[39], c1[35], wc92, s2[22], c2[21], wc93);
  
  wire wc94;
  compressor_4_2_ld com94 (s1[40], c1[36], s1[41], c1[37], wc93, s2[23], c2[22], wc94);
  
  wire wc95;
  compressor_4_2_ld com95 (s1[42], c1[38], c1[39], p[11][15], wc94, s2[24], c2[23], wc95);
  
  wire wc96;
  compressor_4_2_ld com96 (s1[43], c1[40], p[13][14], p[12][15], wc95, s2[25], c2[24], wc96);
  
  wire wc97;
  compressor_4_2_ld com97 (c1[41], p[15][13], p[14][14], p[13][15], wc96, s2[26], c2[25], wc97);

  full_adder     fa6   (p[15][14], p[15][14], wc97, s2[27], c2[26]);

  // cpa
  wire [29:0] pa, pb;

  assign pa[29]   = c2[26];
  assign pa[28:1] = s2[27:0];
  assign pa[0]    = p[1][0];

  assign pb[29]   = p[15][15];
  assign pb[28:3] = c2[25:0];
  assign pb[2]    = 1'b0;
  assign pb[1]    = p[0][2];
  assign pb[0]    = p[0][1];

  rca_30b rca(pa, pb, 1'b0, P[30:1], P[31]);
  assign P[0] = p[0][0];

endmodule
