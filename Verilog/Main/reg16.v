// Andrew Doucet
// Spencer Dugas

// 16-bit registser
module reg16(D,Q,clk);
    // I/O
    input clk;
    input [15:0]D;
    output reg[15:0]Q;

    // Update on clock cycle
    always @(posedge clk) 
        Q <= D; 
endmodule