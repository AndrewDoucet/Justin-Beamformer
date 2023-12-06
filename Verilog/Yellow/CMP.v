// Andrew Doucet
// Spencer Dugas

// Compare Function
module CMP (A_in, B_in, ZNC_out);

    // I/O
    input [15:0]A_in, B_in;
    output [2:0]ZNC_out;

    // Subtraction for comparison
    wire [15:0]A_out;
    SUB SUB(A_in,B_in,A_out);

    // ZNC bit handlers
    zero zero(A_out,ZNC_out[2]);
    negative negative(A_out,ZNC_out[1]);
    carry carry(A_in,B_in,A_out,ZNC_out[0]);

endmodule