module MUX2x1(I, s, y);
    input [1:0]I ;//2 inputs 
    input s;     //1 select line
    output y;    //1 output
        assign y = (s)? I[1]:I[0];
endmodule

module MUX4X1_using2x1(i,s,y);
    input [3:0]i;   // 4 inputs
    input [1:0]s;   // 2 select lines
    output y;       // output
    wire [1:0]w;    
    
        MUX2x1 u1(.I(i[1:0]), .s(s[0]), .y(w[0]));
        MUX2x1 u2(.I(i[3:2]), .s(s[0]), .y(w[1]));
        
        MUX2x1 u3(.I(w[1:0]), .s(s[1]), .y(y));
endmodule
