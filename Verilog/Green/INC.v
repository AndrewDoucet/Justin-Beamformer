// Andrew Doucet
// Spencer Dugas

// INC instruction
module INC (A_in, B_in, opCode, A_out, B_out);

    // I/O
    input [15:0] A_in,B_in,opCode;
    output [15:0] A_out, B_out;

    // Increments
    assign A_out = A_in + opCode [7:0];
    assign B_out = B_in + opCode [7:0];

endmodule