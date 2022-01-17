//Realising a JK Flip Flop using D Flip flop.
//We need a 4X1 MUX and a d flipflop.
//4X1 mux,
`timescale 1ns / 1ps
module Mux4X1(I, s, y);
    input [3:0] I;
    input [1:0] s;
    output y;
    
    assign y = s[1]?(s[0]?I[3]:I[2]):(s[0]?I[1]:I[0]);    
endmodule
//D flipflop,
module D_FF(input D, set, reset_n, clk, output reg qd, qb);
always @(posedge clk or negedge reset_n)
    begin
        if(reset_n==0)
        begin
            qd<=1'b0;
            qb<=1'b1;
        end
        else if(set)
            begin
                qd<=1'b1;
                qb<=1'b0;
            end
            else
            begin
                qd <= D;
                qb <= ~D;
            end
        end 
endmodule
//JK flipflop,
module JK_FF_using_D_FF(input j, k, clk, set, reset_n, output q, qb);
wire dm;
    Mux4X1 inst1 ({qb, 1'b1, 1'b0, q}, {j, k}, dm);
    D_FF inst2 (.D(dm), .set(set), .reset_n(reset_n), .clk(clk), .qd(q), .qb(qb));
endmodule
