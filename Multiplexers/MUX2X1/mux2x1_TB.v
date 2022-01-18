`timescale 1ns / 1ps
module MUX2x1_TB();
  reg [1:0]I;
  reg s;
  wire y;
  MUX2x1 UUT(.I(I), .s(s), .y(y));
  initial
      begin
        I[0]=1'b0;
        I[1]=1'b0;
        s=1'b0;
        #100 $finish;        
      end
  always #40 I[0] = ~I[0];
  always #30 I[1] = ~I[1];
  always #10 s = ~s;
  always @ ( I[0], I[1], s);
endmodule
