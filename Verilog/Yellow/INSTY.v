// Andrew Doucet
// Spencer Dugas

// Formats instruction
module INSTY (opCode, sel);

    // I/O
    input [15:0] opCode;
    output [1:0] sel;

    // Assignment
    assign sel [1] = opCode [13];
    assign sel [0] = opCode [12];

endmodule