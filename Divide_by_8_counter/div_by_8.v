`timescale 1ns / 1ps
module T_FF(t, clk, set, reset_n, q, qb);
    input t, clk, set, reset_n;// clk -> clock signal reset_n -> active low reset.
    output reg q, qb;    
  always @ (posedge clk, negedge reset_n) // q will be evaluated at every posedge of clock or negedge of reset_n
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
          casex(t)        //if reset_n=1 and set=0  q and qb will depend on value of t.
                1'b0 : begin q<=q; qb<=qb; end
                1'b1 : begin q<=qb; qb<=q; end
            endcase
        end
    end
endmodule

module Divide_by_8(fin, reset_n, fout);
    input fin, reset_n;
    output fout;
    wire w1,w2,w3;
        assign w3 = w1 & w2;
        T_FF u1 (.t(1'b1), .clk(fin), .set(1'b0), .reset_n(reset_n), .q(w1));
        T_FF u2 (.t(w1), .clk(fin), .set(1'b0), .reset_n(reset_n), .q(w2));
        T_FF u3 (.t(w3), .clk(fin), .set(1'b0), .reset_n(reset_n), .q(fout));
endmodule
