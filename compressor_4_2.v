module compressor_4_2(
  input a1,
  input a2,
  input a3,
  input a4,
  input cin,
  output sum,
  output carry,
  output cout
);

  wire fs;

  full_adder fa0(a4, a3, a2, fs, cout);
  full_adder fa1(fs, a1, cin, sum, carry);

endmodule
