`timescale 1ns / 1ps
module T_FF(t, clk, set, reset_n, q, qb);
    input t, clk, set, reset_n;// clk -> clock signal reset_n -> active low reset.
    output reg q, qb;
    
    always @ (posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
        begin
            q<=1'b0;
            qb<=1'b1;
        end
        else if(set)
        begin
            q<=1'b1;
            qb<=1'b0;
        end
        else
        begin
            casex(t)        //if reset_n=1 and set=0  q and qb will be calculated with value of t.
                1'b0 : begin q<=q; qb<=qb; end
                1'b1 : begin q<=qb; qb<=q; end
            endcase
        end
    end
endmodule
