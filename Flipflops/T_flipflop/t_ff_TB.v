`timescale 1ns / 1ps
module T_FF_TB();
    
    reg t, clk, set, reset_n;
    wire q, qb;
    //instantiating module of t FF 
    T_FF inst (.t(t), .clk(clk), .set(set), .reset_n(reset_n), .q(q), .qb(qb));
    initial
    begin
        reset_n = 1'b0;
        set = 1'b1;
        clk = 1'b1;
        t = 1'b0;
    end
    //generating clock signal.
    always #5 clk = ~clk;
    
    always
    begin
        #12 reset_n = 1'b1;
            set = 1'b1;
            t = 1'b1;
        #10 t = 1'b0;
        #1 reset_n = 1'b0;
        #3 reset_n = 1'b1;
        #10 set = 1'b0;
        #5 t = 1'b0;
        #5 reset_n = 1'b0;
        #2 reset_n = 1'b1;
           t = 1'b1;
        #30 reset_n = 1'b0;
        #15 $finish;
    end
endmodule
