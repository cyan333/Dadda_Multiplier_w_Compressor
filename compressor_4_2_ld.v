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

  wire w0, w1, w2;

  assign w0 = ~(a4 ^ a3);
  assign w1 = ~(a2 ^ a1);
  assign w2 = ~(w0 ^ w1);

  assign cout = (w0) ? a4 : a2;
  assign sum = w2 ^ cin;
  assign carry = (w2) ? a1 : cin;

endmodule
