// Andrew Doucet
// Spencer Dugas

// Random Access Memoru
module RAM(address, in, out, clk, WE);

    // I/O
    input clk,WE;
    input [7:0]address;

    // Data I/O
    input [15:0]in;
    output reg [15:0]out;

    // Memory Block
    reg [15:0]memory[0:255];

    // Output assynchonously
    always@(address,clk)
        out = memory[address];

    // Input is clock triggered
    always @(posedge clk)
        if(WE)
            memory[address] <= in;
endmodule