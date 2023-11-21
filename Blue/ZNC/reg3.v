
module reg3(D,Q,clk,en);
    input [2:0]D;
    input clk;
    input en;
    output reg [2:0]Q;
    always @(posedge clk) 
        if(en)
            Q <= D; 
endmodule