//2X1 Mux
`timescale 1ns / 1ps
module MUX2x1(I, s, y);
    input [1:0]I ;//2 inputs 
    input s;     //1 select line
    output y;    //1 output
        assign y = (s)? I[1]:I[0];
endmodule
//6X1 Mux
module MUX_6X1_using_MUX_2X1(I, S, Y);

    input [5:0]I;   //6 inputs 
    input [2:0]S;   //3 select lines
    output Y;       //1 output
    wire w1, w2, w3, w4;
    //using 2X1 MUXes 
    MUX2x1 inst1({I[1], I[0]}, S[0], w1); // { , } concatination 
    MUX2x1 inst2({I[3], I[2]}, S[0], w2);
    MUX2x1 inst3({I[5], I[4]}, S[0], w3);
    MUX2x1 inst4({w2, w1}, S[1], w4);
    MUX2x1 inst5({w3, w4}, S[2], Y);
    
endmodule
