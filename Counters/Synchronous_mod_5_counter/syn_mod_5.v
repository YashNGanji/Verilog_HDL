`timescale 1ns / 1ps
module MOd5_counter(input clk, reset_n, output reg [2:0]q);

    always @ (posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
        begin
            q<=3'b000;
        end
        else
        begin
            casex(q)
                3'b000 : q<=3'b001;
                3'b001 : q<=3'b010;
                3'b010 : q<=3'b011;
                3'b011 : q<=3'b100;
                3'b100 : q<=3'b000;
                default: q<=3'b000;
            endcase
        end
    end  
endmodule
