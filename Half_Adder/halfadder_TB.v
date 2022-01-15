// Test bench for half adder
`timescale 1ns / 1ps
module Half_adder_TB();
    reg a, b;
    wire s, c;
        
    Half_adder UUT(.a(a), .b(b), .s(s), .c(c));
    initial
        begin
            a=1'b1;
            b=1'b1;
            #30 $finish;
        end
    always #5 a=~a;
    always #10 b=~b;
    
endmodule
