
module PC_reg(D,Q,clk,en);
    input [15:0]D;
    input clk;
    input en;
    
    output reg[15:0]Q;


    initial
        Q <= 16'hFFFF;

    always @(posedge clk) 
        if(en)
            Q <= D; 
endmodule