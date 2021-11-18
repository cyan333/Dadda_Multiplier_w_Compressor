`timescale 1ps/100fs

module dadda_8x8_compressed_tb;

  reg [7:0] a, b;
  wire [15:0] p0, p1;

  dadda_8x8_compressed    m0(a, b, p0);
  dadda_8x8_compressed_ld m1(a, b, p1);

  initial
  begin
    $monitor($time, "A = %h --- B = %h --- P0 = %h --- P1 = %h", a, b, p0, p1);
  end

  initial
  begin
    #10 a = 8'hFF; b = 8'hFF;
    #10 a = 8'h10; b = 8'h98;
    #10 a = 8'h45; b = 8'hFE;
    #10 a = 8'h38; b = 8'h0A;
    #10 a = 8'h3B; b = 8'h86;
    #10 a = 8'h4C; b = 8'h77;
    #10 a = 8'h1D; b = 8'h93;
    #10 a = 8'hE2; b = 8'h00;
    #10 a = 8'hCF; b = 8'h01;

    $finish;
  end

endmodule
