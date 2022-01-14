`timescale 1ns / 1ps
module MUX2x1(I, s, y);
    input [1:0]I ;//2 inputs 
    input s;     //1 select line
    output y;    //1 output
        assign y = (s)? I[1]:I[0];
endmodule
