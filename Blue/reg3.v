
module reg3(D,clk,en,Q)
    input [2:0]D;
    input clk;
    inout en;
    output [2:0]Q;
    always @(posedge clk) 
        if(en)
            Q <= D; 
endmodule