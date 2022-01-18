`timescale 1ns / 1ps
module JK_FF(j, k, clk, set, reset_n, q, qb);
    input j, k, clk, set, reset_n; 
    output reg q, qb;
    
  always  @ (posedge clk, negedge reset_n)  //updates q and qb if either positive edge of clock 
                                            // is apeared or negetive edge of reset_n is apeared.
    begin
        if(reset_n==0)  
        begin
            q<=1'b0;
            qb<=1'b1;
        end
        else if(set)
        begin
            q<=1'b1;
            qb=1'b0;
        end        
        else
        begin
            casex({j,k})   // when set is 0 ane reset_n is 1 q and qb are calculated by values of j and k
                2'b00 : begin q<=q; qb<=qb; end
                2'b01 : begin q<=1'b0; qb<=1'b1; end
                2'b10 : begin q<=1'b1; qb<=1'b0; end
                2'b11 : begin q<=qb; qb<= q; end
            endcase
        end
    end
endmodule
