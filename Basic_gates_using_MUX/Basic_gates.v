//2X1 MUX
`timescale 1ns / 1ps
module MUX2x1(I, s, y);
    input [1:0]I ;//2 inputs 
    input s;     //1 select line
    output y;    //1 output
        assign y = (s)? I[1]:I[0];
endmodule

//realising Basic gates using 2X1 MUX.
module gates(a, b, o);
  input a, b;
  output [3:0] o;
  //o[0] -> and result
  //o[1] -> or result
  //o[2] -> nor result
  //o[3] -> xor result
  
  //And Gate
  MUX2x1 inst1 ({b, 1'b0}, a, o[0]);
  //Or Gate
  MUX2x1 inst2 ({1'b1, b}, a, o[1]);
  //Nor Gate
  MUX2x1 inst3 ({1'b0, ~b}, a, o[2]);
  //Xor Gate
  MUX2x1 inst4 ({~b, b}, a, o[3]);
endmodule
