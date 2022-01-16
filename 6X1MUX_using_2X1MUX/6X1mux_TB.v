`timescale 1ns / 1ps
module MUX6X1_using_MUX2X1_TB();
    reg [5:0]I;
    reg [2:0]S;
    wire Y;
    //instantiating 6X1 MUX module 
    MUX_6X1_using_MUX_2X1 inst(.I(I), .S(S), .Y(Y));
    //initialising all inputs for 6X1 MUX
    initial
    begin 
        I[0] = 1'b1;
        I[1] = 1'b1;
        I[2] = 1'b1;
        I[3] = 1'b1;
        I[4] = 1'b0;
        I[5] = 1'b0;
    end    
    always
    begin
        S = 3'b000;
        #5 S = 3'b001;
        #5 S = 3'b010;
        #5 S = 3'b011;
        #5 S = 3'b100;
        #5 S = 3'b101;
        #5 $finish;      
    end
endmodule
