`timescale 1ps/100fs

module compressor_4_2_ld(
  input a1,
  input a2,
  input a3,
  input a4,
  input cin,
  output cout,
  output carry,
  output sum
);

  wire w0, w0_;
  wire w1, w1_;
  wire w2, w2_;

  xnor_xor x0 (w0_, w0, a1, a2);
  xnor_xor x1 (w1_, w1, a3, a4);
 
  mux21 m0 (cout, a3, a1, w0_);
  xnor_xor x2 (w2_, w2, w0, w1);

  xor xor0 (sum, w2, cin);
  mux21 m1 (carry, cin, a4, w2_);

endmodule

module xnor_xor(
  output y_,
  output y,
  input a,
  input b
);

xnor x0 (y_, a, b);
xor  x1 (y, a, b);

endmodule

module mux21(
  output y, 
  input a,
  input b,
  input s
);

wire t0, t1, s_;

not (s_, s);
and (t0, b, s);
and (t1, a, s_);
or (y, t0, t1);

endmodule
