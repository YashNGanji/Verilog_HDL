`timescale 1ns / 1ps
module MOd5_counter_TB();

reg clk, reset_n;
wire [2:0]q;

MOd5_counter UUT (clk, reset_n, q);

initial 
begin
clk = 1'b0;
reset_n = 1'b0;
end

always #5 clk = ~clk;

always
begin 
    #25 reset_n = 1'b1;
    #200 $stop;  
end
endmodule
