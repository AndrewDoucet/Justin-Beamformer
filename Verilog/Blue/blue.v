// Andrew Doucet
// Spencer Dugas

// Blue Circuit
module blue(opCode,A_in,B_in,A_out,B_out,ZNC_out,ZNC_in);

    // I/O
    input [15:0]A_in, B_in, opCode;
    output [15:0]A_out,B_out;

    // ZNC busses
    input [2:0] ZNC_in;
    output [2:0]ZNC_out;
    wire [2:0] ZNC_mid;

    // Instructions
    instruction instruction(A_in,B_in,opCode,A_out,B_out,ZNC_in,ZNC_mid,ZNC_out);

    // ZNC
    zero zero(A_out,ZNC_mid[2]);
    negative negative(A_out,ZNC_mid[1]);
    carry carry(A_in,B_in,A_out,ZNC_mid[0]);
endmodule