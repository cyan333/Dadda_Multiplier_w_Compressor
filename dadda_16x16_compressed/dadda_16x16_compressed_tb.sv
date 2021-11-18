`timescale 1ps/100fs

module dadda_16x16_compressed_tb;

  reg [15:0] a, b;
  wire [31:0] p0, p1;

  dadda_16x16_compressed    m0(a, b, p0);
  dadda_16x16_compressed_ld m1(a, b, p1);

  initial
  begin
    $monitor($time, "A = %h --- B = %h --- P0 = %h --- P1 = %h", a, b, p0, p1);
  end

  initial
  begin
    #10 a = 16'hFFFF; b = 16'hFFFF;
    #10 a = 16'h1034; b = 16'h9876;
    #10 a = 16'h45AF; b = 16'hFE7B;
    #10 a = 16'h3807; b = 16'h02AB;
    #10 a = 16'h3B45; b = 16'h8619;
    #10 a = 16'h4CAA; b = 16'h7786;
    #10 a = 16'h1DBD; b = 16'h939D;
    #10 a = 16'hE23A; b = 16'h0065;
    #10 a = 16'hCFED; b = 16'h017E;

    $finish;
  end

endmodule
