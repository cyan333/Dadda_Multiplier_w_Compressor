`timescale 1ps/100fs

module dadda_16x16_uncompressed2(a,b,final_result);
	input [15:0] a;
	input [15:0] b;
	output [31:0] final_result;

	
 	wire [15:0] [15:0] p;
	wire [209:0] s, c;
	wire [29:0] rca_b, rca_a;


	reg [29:0] sum;
	reg cout;

	//14b adder
	assign rca_a = (p[15][15] << 29) | (s[209:182] << 1) | p[1][0];
	assign rca_b = (c[209:182] << 2) | (p[0][2] << 1) | p[0][1];
	assign final_result = (cout << 31) | (sum << 1) | p[0][0];
	
	product_16x16 P_var(a,b,p);

	//level 1
	half_adder ha0(p[13][0], p[12][1], s[0], c[0]);

	full_adder fa1(p[14][0], p[13][1], p[12][2], s[1], c[1]);
	half_adder ha2(p[11][3], p[10][4], s[2], c[2]);

	full_adder fa3(p[15][0], p[14][1], p[13][2], s[3], c[3]);
	full_adder fa4(p[12][3], p[11][4], p[10][5], s[4], c[4]);
	half_adder ha5(p[6][9], p[8][7], s[5], c[5]);

	full_adder fa6(p[15][1], p[14][2], p[13][3], s[6], c[6]);
	full_adder fa7(p[12][4], p[11][5], p[10][6], s[7], c[7]);
	half_adder ha8(p[9][7], p[8][8], s[8], c[8]);

	full_adder fa9(p[15][2], p[14][3], p[13][4], s[9], c[9]);
	full_adder fa10(p[12][5], p[11][6], p[10][7], s[10], c[10]);

	full_adder fa11(p[15][3], p[14][4], p[13][5], s[11], c[11]);



	//level 2
	half_adder ha12(p[9][0], p[8][1], s[12], c[12]);

	full_adder fa13(p[10][0], p[9][1], p[8][2], s[13], c[13]);
	half_adder ha14(p[7][3], p[6][4], s[14], c[14]);

	full_adder fa15(p[11][0], p[10][1], p[9][2], s[15], c[15]);
	full_adder fa16(p[8][3], p[7][4], p[6][5], s[16], c[16]);
	half_adder ha17(p[5][6],  p[4][7],  s[17], c[17]);

	full_adder fa18(p[12][0], p[11][1], p[10][2], s[18], c[18]);
	full_adder fa19(p[9][3], p[8][4], p[7][5], s[19], c[19]);
	full_adder fa20(p[6][6], p[5][7], p[4][8], s[20], c[20]);
	half_adder ha21(p[3][9],  p[2][10],  s[21], c[21]);

	full_adder fa22(s[0], p[11][2], p[10][3], s[22], c[22]);
	full_adder fa23(p[9][4], p[8][5], p[7][6], s[23], c[23]);
	full_adder fa24(p[6][7], p[5][8], p[4][9], s[24], c[24]);
	full_adder fa25(p[3][10], p[2][11], p[1][12], s[25], c[25]);

	full_adder fa26(s[1], c[0], s[2], s[26], c[26]);
	full_adder fa27(p[9][5], p[8][6], p[7][7], s[27], c[27]);
	full_adder fa28(p[6][8], p[5][9], p[4][10], s[28], c[28]);
	full_adder fa29(p[3][11], p[2][12], p[1][13], s[29], c[29]);


	full_adder fa30(s[3], c[1], s[4], s[30], c[30]);
	full_adder fa31(c[2], s[5], p[7][8], s[31], c[31]);
	full_adder fa32(p[6][9], p[5][10], p[4][11], s[32], c[32]);
	full_adder fa33(p[3][12], p[2][13], p[1][14], s[33], c[33]);


	full_adder fa34(s[6], c[3], s[7], s[34], c[34]);
	full_adder fa35(c[4], s[8], c[5], s[35], c[35]);
	full_adder fa36(p[7][9], p[6][10], p[5][11], s[36], c[36]);
	full_adder fa37(p[4][12], p[3][13], p[2][14], s[37], c[37]);

	full_adder fa38(s[9], c[6], s[10], s[38], c[38]);
	full_adder fa39(c[7], p[9][8], c[8], s[39], c[39]);
	full_adder fa40(p[8][9], p[7][10], p[6][11], s[40], c[40]);
	full_adder fa41(p[5][12], p[4][13], p[3][14], s[41], c[41]);


	full_adder fa42(s[11], c[9], p[12][6], s[42], c[42]);
	full_adder fa43(c[10], p[11][7], p[10][8], s[43], c[43]);
	full_adder fa44(p[9][9], p[8][10], p[7][11], s[44], c[44]);
	full_adder fa45(p[6][12], p[5][13], p[4][14], s[45], c[45]);

	full_adder fa46(p[15][4], c[11], p[14][5], s[46], c[46]);
	full_adder fa47(p[13][6], p[12][7], p[11][8], s[47], c[47]);
	full_adder fa48(p[10][9], p[9][10], p[8][11], s[48], c[48]);
	full_adder fa49(p[7][12], p[6][13], p[5][14], s[49], c[49]);

	full_adder fa50(p[15][5], p[14][6], p[13][7], s[50], c[50]);
	full_adder fa51(p[12][8], p[11][9], p[10][10], s[51], c[51]);
	full_adder fa52(p[9][11], p[8][12], p[7][13], s[52], c[52]);

	full_adder fa53(p[15][6], p[14][7], p[13][8], s[53], c[53]);
	full_adder fa54(p[12][9], p[11][10], p[10][11], s[54], c[54]);

	full_adder fa55(p[15][7], p[14][8], p[13][9], s[55], c[55]);


	//level 3

	half_adder ha56(p[6][0], p[5][1], s[56], c[56]);

	full_adder fa57(p[7][0], p[6][1], p[5][2], s[57], c[57]);
	half_adder ha58(p[4][3], p[3][4], s[58], c[58]);

	full_adder fa59(p[8][0], p[7][1], p[6][2], s[59], c[59]);
	full_adder fa60(p[5][3], p[4][4], p[3][5], s[60], c[60]);
	half_adder ha61(p[2][6], p[1][7], s[61], c[61]);



	full_adder fa62(s[12], p[7][2], p[6][3], s[62], c[62]);
	full_adder fa63(p[5][4], p[4][5], p[3][6], s[63], c[63]);
	full_adder fa64(p[2][7], p[1][8], p[0][9], s[64], c[64]);

	full_adder fa65(s[13], c[12], s[14], s[65], c[65]);
	full_adder fa66(p[5][5], p[4][6], p[3][7], s[66], c[66]);
	full_adder fa67(p[2][8], p[1][9], p[0][10], s[67], c[67]);

	full_adder fa68(s[15], c[13], s[16], s[68], c[68]);
	full_adder fa69(c[14], s[17], p[3][8], s[69], c[69]);
	full_adder fa70(p[2][9], p[1][10], p[0][11], s[70], c[70]);

	full_adder fa71(s[18], c[15], s[19], s[71], c[71]);
	full_adder fa72(c[16], s[20], c[17], s[72], c[72]);
	full_adder fa73(s[21], p[1][11], p[0][12], s[73], c[73]);


	full_adder fa74(s[22], c[18], s[23], s[74], c[74]);
	full_adder fa75(c[19], s[24], c[20], s[75], c[75]);
	full_adder fa76(s[25], c[21], p[0][13], s[76], c[76]);


	full_adder fa77(s[26], c[22], s[27], s[77], c[77]);
	full_adder fa78(c[23], s[28], c[24], s[78], c[78]);
	full_adder fa79(s[29], c[25], p[0][14], s[79], c[79]);

	full_adder fa80(s[30], c[26], s[31], s[80], c[80]);
	full_adder fa81(c[27], s[32], c[28], s[81], c[81]);
	full_adder fa82(s[33], c[29], p[0][15], s[82], c[82]);

	full_adder fa83(s[34], c[30], s[35], s[83], c[83]);
	full_adder fa84(c[31], s[36], c[32], s[84], c[84]);
	full_adder fa85(s[37], c[33], p[1][15], s[85], c[85]);

	full_adder fa86(s[38], c[34], s[39], s[86], c[86]);
	full_adder fa87(c[35], s[40], c[36], s[87], c[87]);
	full_adder fa88(s[41], c[37], p[2][15], s[88], c[88]);

	full_adder fa89(s[42], c[38], s[43], s[89], c[89]);
	full_adder fa90(c[39], s[44], c[40], s[90], c[90]);
	full_adder fa91(s[45], c[41], p[3][15], s[91], c[91]);

	full_adder fa92(s[46], c[42], s[47], s[92], c[92]);
	full_adder fa93(c[43], s[48], c[44], s[93], c[93]);
	full_adder fa94(s[49], c[45], p[4][15], s[94], c[94]);

	full_adder fa95(s[50], c[46], s[51], s[95], c[95]);
	full_adder fa96(c[47], s[52], c[48], s[96], c[96]);
	full_adder fa97(p[6][14], c[49], p[5][15], s[97], c[97]);

	full_adder fa98(s[53], c[50], s[54], s[98], c[98]);
	full_adder fa99(c[51], p[9][12], c[52], s[99], c[99]);
	full_adder fa100(p[8][13], p[7][14], p[6][15], s[100], c[100]);

	full_adder fa101(s[55], c[53], p[12][10], s[101], c[101]);
	full_adder fa102(c[54], p[11][11], p[10][12], s[102], c[102]);
	full_adder fa103(p[9][13], p[8][14], p[7][15], s[103], c[103]);

	
	full_adder fa104(p[15][8], c[55], p[14][9], s[104], c[104]);
	full_adder fa105(p[13][10], p[12][11], p[11][12], s[105], c[105]);
	full_adder fa106(p[10][13], p[9][14], p[8][15], s[106], c[106]);

	full_adder fa107(p[15][9], p[14][10], p[13][11], s[107], c[107]);
	full_adder fa108(p[12][12], p[11][13], p[10][14], s[108], c[108]);

	full_adder fa109(p[15][10], p[14][11], p[13][12], s[109], c[109]);


	//level 4

	half_adder ha110(p[4][0], p[3][1], s[110], c[110]);

	full_adder fa111(p[5][0], p[4][1], p[3][2], s[111], c[111]);
	half_adder ha112(p[2][3], p[1][4], s[112], c[112]);

	full_adder fa113(s[56], p[4][2], p[3][3], s[113], c[113]);
	full_adder fa114(p[2][4], p[1][5], p[0][6], s[114], c[114]);

	full_adder fa115(s[57], c[56], s[58], s[115], c[115]);
	full_adder fa116(p[2][5], p[1][6], p[0][7], s[116], c[116]);

	full_adder fa117(s[59], c[57], s[60], s[117], c[117]);
	full_adder fa118(c[58], s[61], p[0][8], s[118], c[118]);

	full_adder fa119(s[62], c[59], s[63], s[119], c[119]);
	full_adder fa120(c[60], s[64], c[61], s[120], c[120]);

	full_adder fa121(s[65], c[62], s[66], s[121], c[121]);
	full_adder fa122(c[63], s[67], c[64], s[122], c[122]);

	full_adder fa123(s[68], c[65], s[69], s[123], c[123]);
	full_adder fa124(c[66], s[70], c[67], s[124], c[124]);

	full_adder fa125(s[71], c[68], s[72], s[125], c[125]);
	full_adder fa126(c[69], s[73], c[70], s[126], c[126]);

	full_adder fa127(s[74], c[71], s[75], s[127], c[127]);
	full_adder fa128(c[72], s[76], c[73], s[128], c[128]);

	full_adder fa129(s[77], c[74], s[78], s[129], c[129]);
	full_adder fa130(c[75], s[79], c[76], s[130], c[130]);

	full_adder fa131(s[80], c[77], s[81], s[131], c[131]);
	full_adder fa132(c[78], s[82], c[79], s[132], c[132]);

	full_adder fa133(s[83], c[80], s[84], s[133], c[133]);
	full_adder fa134(c[81], s[85], c[82], s[134], c[134]);

	full_adder fa135(s[86], c[83], s[87], s[135], c[135]);
	full_adder fa136(c[84], s[88], c[85], s[136], c[136]);

	full_adder fa137(s[89], c[86], s[90], s[137], c[137]);
	full_adder fa138(c[87], s[91], c[88], s[138], c[138]);

	full_adder fa139(s[92], c[89], s[93], s[139], c[139]);
	full_adder fa140(c[90], s[94], c[91], s[140], c[140]);

	full_adder fa141(s[95], c[92], s[96], s[141], c[141]);
	full_adder fa142(c[93], s[97], c[94], s[142], c[142]);

	full_adder fa143(s[98], c[95], s[99], s[143], c[143]);
	full_adder fa144(c[96], s[100], c[97], s[144], c[144]);

	full_adder fa145(s[101], c[98], s[102], s[145], c[145]);
	full_adder fa146(c[99], s[103], c[100], s[146], c[146]);

	full_adder fa147(s[104], c[101], s[105], s[147], c[147]);
	full_adder fa148(c[102], s[106], c[103], s[148], c[148]);

	full_adder fa149(s[107], c[104], s[108], s[149], c[149]);
	full_adder fa150(c[105], p[9][15], c[106], s[150], c[150]);

	full_adder fa151(s[109], c[107], p[12][13], s[151], c[151]);
	full_adder fa152(c[108], p[11][14], p[10][15], s[152], c[152]);

	full_adder fa153(p[15][11], c[109], p[14][12], s[153], c[153]);
	full_adder fa154(p[13][13], p[12][14], p[11][15], s[154], c[154]);

	full_adder fa155(p[15][12], p[14][13], p[13][14], s[155], c[155]);


	//level 5

	half_adder ha156(p[3][0], p[2][1], s[156], c[156]);

	full_adder fa157(s[110], p[2][2], p[1][3], s[157], c[157]);

	full_adder fa158(s[111], c[110], s[112], s[158], c[158]);

	full_adder fa159(s[113], c[111], s[114], s[159], c[159]);

	full_adder fa160(s[115], c[113], s[116], s[160], c[160]);

	full_adder fa161(s[117], c[115], s[118], s[161], c[161]);

	full_adder fa162(s[119], c[117], s[129], s[162], c[162]);

	full_adder fa163(s[121], c[119], s[122], s[163], c[163]);

	full_adder fa164(s[123], c[121], s[124], s[164], c[164]);

	full_adder fa165(s[125], c[123], s[126], s[165], c[165]);

	full_adder fa166(s[127], c[125], s[128], s[166], c[166]);

	full_adder fa167(s[129], c[127], s[130], s[167], c[167]);

	full_adder fa168(s[131], c[129], s[132], s[168], c[168]);

	full_adder fa169(s[133], c[131], s[134], s[169], c[169]);

	full_adder fa170(s[135], c[133], s[136], s[170], c[170]);

	full_adder fa171(s[137], c[135], s[138], s[171], c[171]);

	full_adder fa172(s[139], c[137], s[140], s[172], c[172]);

	full_adder fa173(s[141], c[139], s[142], s[173], c[173]);

	full_adder fa174(s[143], c[141], s[144], s[174], c[174]);

	full_adder fa175(s[145], c[143], s[146], s[175], c[175]);

	full_adder fa176(s[147], c[145], s[148], s[176], c[176]);

	full_adder fa177(s[149], c[147], s[150], s[177], c[177]);

	full_adder fa178(s[151], c[149], s[152], s[178], c[178]);

	full_adder fa179(s[153], c[151], s[154], s[179], c[179]);

	full_adder fa180(s[155], c[153], p[12][15], s[180], c[180]);

	full_adder fa181(p[15][13], c[155], p[14][14], s[181], c[181]);


	//level 6

	half_adder ha182(p[2][0], p[1][1], s[182], c[182]);

	full_adder fa183(s[156], p[1][2], p[0][3], s[183], c[183]);

	full_adder fa184(s[157], c[156], p[0][4], s[184], c[184]);

	full_adder fa185(s[158], c[157], p[0][5], s[185], c[185]);

	full_adder fa186(s[159], c[158], c[112], s[186], c[186]);

	full_adder fa187(s[160], c[159], c[114], s[187], c[187]);

	full_adder fa188(s[161], c[160], c[116], s[188], c[188]);

	full_adder fa189(s[162], c[161], c[118], s[189], c[189]);

	full_adder fa190(s[163], c[162], c[120], s[190], c[190]);

	full_adder fa191(s[164], c[163], c[122], s[191], c[191]);

	full_adder fa192(s[165], c[164], c[124], s[192], c[192]);

	full_adder fa193(s[166], c[165], c[126], s[193], c[193]);

	full_adder fa194(s[167], c[166], c[128], s[194], c[194]);

	full_adder fa195(s[168], c[167], c[130], s[195], c[195]);

	full_adder fa196(s[169], c[168], c[132], s[196], c[196]);

	full_adder fa197(s[170], c[169], c[134], s[197], c[197]);

	full_adder fa198(s[171], c[170], c[136], s[198], c[198]);

	full_adder fa199(s[172], c[171], c[138], s[199], c[199]);

	full_adder fa200(s[173], c[172], c[140], s[200], c[200]);

	full_adder fa201(s[174], c[173], c[142], s[201], c[201]);

	full_adder fa202(s[175], c[174], c[144], s[202], c[202]);

	full_adder fa203(s[176], c[175], c[146], s[203], c[203]);

	full_adder fa204(s[177], c[176], c[148], s[204], c[204]);

	full_adder fa205(s[178], c[177], c[150], s[205], c[205]);

	full_adder fa206(s[179], c[178], c[152], s[206], c[206]);

	full_adder fa207(s[180], c[179], c[154], s[207], c[207]);

	full_adder fa208(s[181], c[180], p[13][15], s[208], c[208]);

	full_adder fa209(p[15][14], c[181], p[14][15], s[209], c[209]);


	rca_30b rca_uut(rca_a, rca_b, 0, sum, cout);



endmodule






