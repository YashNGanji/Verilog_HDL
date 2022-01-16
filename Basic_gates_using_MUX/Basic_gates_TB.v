`timescale 1ns / 1ps
module code_TB();
 wire [3:0] o;
 reg a, b; 
   gates inst(a, b, o);
   initial
   begin
     a = 1'b0; b = 1'b0;
   end
   always
   begin
     #5 a = 1'b0;
     b = 1'b1;
     #5 a = 1'b1;
     b = 1'b0;
     #5 a = 1'b1;
     b = 1'b1;
     #5 $finish; 
   end
endmodule
