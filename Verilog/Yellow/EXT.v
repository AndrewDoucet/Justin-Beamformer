// Andrew Doucet
// Spencer Dugas

// Formats instruction
module EXT (opCode, ZNC_code);

    // I/O
    input [15:0] opCode;
    output [2:0] ZNC_code;

    // Assignmet
    assign ZNC_code [2] = opCode [10];
    assign ZNC_code [1] = opCode [9];
    assign ZNC_code [0] = opCode [8];

endmodule