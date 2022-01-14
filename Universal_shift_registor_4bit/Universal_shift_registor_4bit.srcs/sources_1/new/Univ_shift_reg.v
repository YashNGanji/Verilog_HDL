`timescale 1ns / 1ps
module Univ_shift_reg(ParIn, LserIn, RserIn, s, clk, reset_n, q);
    input [3:0]ParIn;
    input [1:0]s;
    input LserIn, RserIn, clk, reset_n;
    output [3:0]q;
    wire d0, d1, d2, d3;
    
    MUX4X1_using2x1 m0 ({ParIn[0], q[1], RserIn, q[0]}, s, d0);
    MUX4X1_using2x1 m1 ({ParIn[1], q[2], q[0], q[1]}, s, d1);
    MUX4X1_using2x1 m2 ({ParIn[2], q[3], q[1], q[2]}, s, d2);
    MUX4X1_using2x1 m3 ({ParIn[3], LserIn, q[2], q[3]}, s, d3);
    
    D_FF D0 (.D(d0), .set(1'b0), .reset_n(reset_n), .clk(clk), .qd(q[0]));
    D_FF D1 (.D(d1), .set(1'b0), .reset_n(reset_n), .clk(clk), .qd(q[1]));
    D_FF D2 (.D(d2), .set(1'b0), .reset_n(reset_n), .clk(clk), .qd(q[2]));
    D_FF D3 (.D(d3), .set(1'b0), .reset_n(reset_n), .clk(clk), .qd(q[3]));    
endmodule
