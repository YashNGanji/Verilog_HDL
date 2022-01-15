`timescale 1ns / 1ps
//module for half adder.
module Half_adder(a,b,s,c);
    input a, b;
    output s, c;
  
        assign s = a^b;
        assign c = a&b;    

endmodule
//module for full adder.
module Full_adder_using_halfadder(a, b, cin, s, cout);
    input a, b, cin;
    output s, cout;
    wire w1, w2, w3;
        
        Half_adder u1(.a(a), .b(b), .s(w1), .c(w2));
        Half_adder u2(.a(w1), .b(cin), .s(s), .c(w3));
        assign cout = w2|w3;
        
endmodule
