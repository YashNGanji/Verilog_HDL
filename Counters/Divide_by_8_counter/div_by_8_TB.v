`timescale 1ns / 1ps
module divide_by_8_TB();
    wire fout;
    reg fin, reset_n;
    
    Divide_by_8 UUT (fin, reset_n, fout);
    
    initial 
    begin 
    fin = 1'b1;
    reset_n = 1'b0;
    #5 reset_n = 1'b1;
    #120 reset_n = 1'b0;
    #30 reset_n = 1'b1;
    #50 $finish;
    end    
    always #5 fin = ~fin;
endmodule
