// Andrew Doucet
// Spencer Dugas

// 3-bit registser
module reg3(D,Q,clk);

    // I/O
    input clk;
    input [2:0]D;
    output reg [2:0]Q;

    // Update on clock cycle
    always @(posedge clk) 
        Q <= D; 
endmodule