// Andrew Doucet
// Spencer Dugas

// Read-Only Program Memory
module ROM(address, out);

    // I/O
    input [7:0]address;
    output reg [15:0]out;

    // Memory Block
    reg [15:0]memory[0:255];

    // Change output depending on address
    always @(address)
        out <= memory[address];

endmodule