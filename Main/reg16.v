
module reg16(D,Q,clk,en);
    input [15:0]D;
    input clk;
    input en;
    output reg[15:0]Q;
    always @(posedge clk) 
        if(en)
            Q <= D; 
endmodule