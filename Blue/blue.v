// Andrew Doucet

module blue(opCode,A_in,B_in,A_out,B_out,ZNC_out);
    input [15:0]opCode;

    // I/O Wires
    input [15:0]A_in;
    input [15:0]B_in;

    // Output Wires
    output [15:0]A_out;
    output [15:0]B_out;
    output [2:0]ZNC_out;

    // Instructions
    instruction INST(A_in,B_in,opCode,A_out,B_out);

    // ZNC
    zero zero(A_out,ZNC_out[2]);
    negative negative(A_out,ZNC_out[1]);
    carry carry(A_in,B_in,A_out,ZNC_out[0]);

endmodule