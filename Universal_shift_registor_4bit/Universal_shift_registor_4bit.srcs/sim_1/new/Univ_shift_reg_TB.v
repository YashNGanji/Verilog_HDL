`timescale 1ns / 1ps
module Univ_shift_reg_TB();

    wire [3:0]q;
    reg [1:0]s;
    reg [3:0]ParIn;
    reg RserIn, LserIn, clk, reset_n;
    
    Univ_shift_reg UUT (ParIn, LserIn, RserIn, s,clk, reset_n, q);
    
    initial
    begin
        clk = 1'b1;
        reset_n = 1'b0;
        RserIn = 1'b0;
        LserIn = 1'b1;
        ParIn = 4'b1101;
        s[0] = 1'b0;
        s[1] = 1'b0;
        #28 reset_n = 1'b1;

    end
    
    initial forever #5 clk = ~clk;
    
    initial
    begin
        //for hold and parellel load operation
        #28 s[0] = 1'b1;
            s[1] = 1'b1;
             ParIn = 4'b1010;
        #20 s[0] = 1'b1;
            s[1] = 1'b0;
        #50 s[0] = 1'b0;
            s[1] = 1'b1;
        #20 s[0] = 1'b1;
            s[1] = 1'b1;
            ParIn = 4'b1110;
        #20 s[0] = 1'b0;
            s[1] = 1'b0;
        #150 $finish;             
    end
endmodule
