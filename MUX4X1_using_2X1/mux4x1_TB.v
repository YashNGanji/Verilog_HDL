`timescale 1ns / 1ps
module MUX4X1_using2x1_TB();
  reg [3:0]i;
  reg [1:0]s;
  wire y;
  MUX4X1_using2x1 UUT(i, s, y);
  initial
      begin
          i[0]=1'b0;
          i[1]=1'b0;
          i[2]=1'b0;
          i[3]=1'b0;
          s[0]=1'b0;
          s[1]=1'b0;
          #200 $finish;
      end
  always #20 i[0] = ~i[0];
  always #15 i[1] = ~i[1];
  always #10 i[2] = ~i[2];
  always #5 i[3] = ~i[3];
  always #10 s[0] = ~s[0];
  always #5 s[1] = ~s[1];
  always @(i[0] or i[1] or i[2] or i[3] or s[0] or s[1]);
endmodule
