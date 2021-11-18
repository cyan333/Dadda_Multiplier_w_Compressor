
module product_8x8(
	input [7:0] a,
	input [7:0] b,
	output[7:0][7:0] p
);
  assign p[0][0] = a[0] & b[0] ;
  assign p[0][1] = a[0] & b[1] ;
  assign p[0][2] = a[0] & b[2] ;
  assign p[0][3] = a[0] & b[3] ;
  assign p[0][4] = a[0] & b[4] ;
  assign p[0][5] = a[0] & b[5] ;
  assign p[0][6] = a[0] & b[6] ;
  assign p[0][7] = a[0] & b[7] ;

  assign p[1][0] = a[1] & b[0] ;
  assign p[1][1] = a[1] & b[1] ;
  assign p[1][2] = a[1] & b[2] ;
  assign p[1][3] = a[1] & b[3] ;
  assign p[1][4] = a[1] & b[4] ;
  assign p[1][5] = a[1] & b[5] ;
  assign p[1][6] = a[1] & b[6] ;
  assign p[1][7] = a[1] & b[7] ;

  assign p[2][0] = a[2] & b[0] ;
  assign p[2][1] = a[2] & b[1] ;
  assign p[2][2] = a[2] & b[2] ;
  assign p[2][3] = a[2] & b[3] ;
  assign p[2][4] = a[2] & b[4] ;
  assign p[2][5] = a[2] & b[5] ;
  assign p[2][6] = a[2] & b[6] ;
  assign p[2][7] = a[2] & b[7] ;
  
  assign p[3][0] = a[3] & b[0] ;
  assign p[3][1] = a[3] & b[1] ;
  assign p[3][2] = a[3] & b[2] ;
  assign p[3][3] = a[3] & b[3] ;
  assign p[3][4] = a[3] & b[4] ;
  assign p[3][5] = a[3] & b[5] ;
  assign p[3][6] = a[3] & b[6] ;
  assign p[3][7] = a[3] & b[7] ;
  
  assign p[4][0] = a[4] & b[0] ;
  assign p[4][1] = a[4] & b[1] ;
  assign p[4][2] = a[4] & b[2] ;
  assign p[4][3] = a[4] & b[3] ;
  assign p[4][4] = a[4] & b[4] ;
  assign p[4][5] = a[4] & b[5] ;
  assign p[4][6] = a[4] & b[6] ;
  assign p[4][7] = a[4] & b[7] ;

  assign p[5][0] = a[5] & b[0] ;
  assign p[5][1] = a[5] & b[1] ;
  assign p[5][2] = a[5] & b[2] ;
  assign p[5][3] = a[5] & b[3] ;
  assign p[5][4] = a[5] & b[4] ;
  assign p[5][5] = a[5] & b[5] ;
  assign p[5][6] = a[5] & b[6] ;
  assign p[5][7] = a[5] & b[7] ;

  assign p[6][0] = a[6] & b[0] ;
  assign p[6][1] = a[6] & b[1] ;
  assign p[6][2] = a[6] & b[2] ;
  assign p[6][3] = a[6] & b[3] ;
  assign p[6][4] = a[6] & b[4] ;
  assign p[6][5] = a[6] & b[5] ;
  assign p[6][6] = a[6] & b[6] ;
  assign p[6][7] = a[6] & b[7] ;
  
  assign p[7][0] = a[7] & b[0] ;
  assign p[7][1] = a[7] & b[1] ;
  assign p[7][2] = a[7] & b[2] ;
  assign p[7][3] = a[7] & b[3] ;
  assign p[7][4] = a[7] & b[4] ;
  assign p[7][5] = a[7] & b[5] ;
  assign p[7][6] = a[7] & b[6] ;
  assign p[7][7] = a[7] & b[7] ;
endmodule
