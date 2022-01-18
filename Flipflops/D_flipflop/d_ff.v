`timescale 1ns / 1ps
module D_FF(D, set, reset_n, clk, qd, qb);

  input D, set, reset_n, clk;
  output reg qd, qb;
  always @(posedge clk or negedge reset_n)
    begin
        if(reset_n==0)
        begin
            qd<=1'b0;
            qb<=1'b1;
        end
        else if(set)
            begin
                qd<=1'b1;
                qb<=1'b0;
            end
            else
            begin
                qd <= D;
                qb <= ~D;
            end
        end 
endmodule
