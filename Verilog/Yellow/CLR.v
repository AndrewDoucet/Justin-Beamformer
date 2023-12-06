// Andrew Doucet
// Spencer Dugas

// CLR instruction
module CLR (ZNC_in, ZNC_code, ZNC_out);

    // I/O
    input [2:0] ZNC_in, ZNC_code;
    output [2:0] ZNC_out;

    // Assignments
    assign ZNC_out [2] = (ZNC_code[2])?(0):(ZNC_in [2]);
    assign ZNC_out [1] = (ZNC_code[1])?(0):(ZNC_in [1]);
    assign ZNC_out [0] = (ZNC_code[0])?(0):(ZNC_in [0]);

endmodule