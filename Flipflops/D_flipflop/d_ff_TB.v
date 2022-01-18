`timescale 1ns / 1ps
module D_FF_TB();

  wire q, qb;
  reg set, reset, clk, D;

  D_FF uut (.D(D), .qd(q), .qb(qb), .clk(clk), .set(set), .reset_n(reset));

  initial
      begin
          clk= 1'b1;
          D= 1'b1;
          reset = 1'b1;
          set = 1'b0;
      end
  always #5 clk = ~clk;
  always
      begin 
          #10 reset = 1'b0;
          D = 0;
          #10 reset = 1'b1;
              set = 1'b1;
          D = 1;
          #10 D = 0;
          #6 set = 0;
          #10 set = 1'b0;
              D = 0;
          #10 D = 1;
          #10 reset = 1'b0;
          #10
          $finish;
      end
endmodule
