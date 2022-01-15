//Half adder 
`timescale 1ns / 1ps
module Half_adder(a,b,s,c);
    input a, b; // 1 Bit input 
    output s, c;// s -> Sum,  c -> Carry
        
        assign s = a^b;
        assign c = a&b;    
endmodule
