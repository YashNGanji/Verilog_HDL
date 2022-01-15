// Test bench for full adder using half adder.
`timescale 1ns / 1ps
module Full_adder_using_halfadder_TB();
    reg a, b, cin;
    wire s, cout;
    Full_adder_using_halfadder UUT(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));
    initial
        begin
            a = 1'b0;
            b = 1'b0;
            cin = 1'b0;
            #80 $finish;
        end
    always #5 a = ~a;
    always #10 b = ~b;
    always #15 cin = ~cin;
    
endmodule
