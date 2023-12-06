// Andrew Doucet
// Spencer Dugas

// Formats instruction
module INST (ins, sel);

    // I/O
    input [15:0] ins;
    output [2:0] sel;

    // Assignment
    assign sel [2] = ins [14];
    assign sel [1] = ins [13];
    assign sel [0] = ins [12];

endmodule