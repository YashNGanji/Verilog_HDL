`timescale 1ns / 1ps
module JK_FF_TB();
    reg j, k, clk, set, reset_n;
    wire q, qb;
    //instantiating functional block for JK FF.
    JK_FF_using_D_FF inst (.j(j), .k(k), .clk(clk), .set(set), .reset_n(reset_n), .q(q), .qb(qb));
    
    initial clk = 1'b1;
  
    always #5 clk = ~clk;   // generating clock signal
    
    initial
    begin
         reset_n = 1'b1;
            set = 1'b1;
            j = 1'b0;
            k = 1'b1;
        #10 reset_n = 1'b0;
            set = 1'b1;
        #10 reset_n = 1'b1;
            set = 1'b1;
            j = 1'b0;
            k = 1'b1;
        #10 set = 1'b0;
            j = 1'b1;
            k = 1'b0;
        #12 j = 1'b0;
            k = 1'b0;
        #10 j = 1'b0;
            k = 1'b1;
        #10 j = 1'b1;
            k = 1'b1;
        #10 j =1'b1;
            k =1'b1;
        #5  j =1'b1;
            k =1'b1;
        #2 reset_n = 1'b0;
           set =1'b1;
        #1 reset_n = 1'b1;
        #8 reset_n = 1'b0;
        #1 reset_n = 1'b1;
        #10 set = 1'b0;
        #50 $finish;
    end
endmodule
