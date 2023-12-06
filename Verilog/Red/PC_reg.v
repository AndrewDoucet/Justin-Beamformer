// Andrew Doucet
// Spencer Dugas

// Program Counter Register
module PC_reg(D,Q,clk);

    //I/O
    input clk;
    input [15:0]D;
    output reg[15:0]Q;

    // Initialization of PC
    initial
        Q <= 16'hFFFF;

    // Update on clock
    always @(posedge clk) 
        Q <= D; 
endmodule