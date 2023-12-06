// Andrew Doucet
// Spencer Dugas

// Yellow Circuit
module yellow (A_in, B_in, opCode, ZNC_in, ZNC_out);

    // I/O
    input [15:0] A_in, B_in, opCode;
    input [2:0] ZNC_in;
    output [2:0] ZNC_out;

    // Busses
    wire [1:0] sel;
    wire [2:0] CMP_out,CLR_out,SET_out,ZNC_code;

    // Extract the instruction and ZNC from instruction
    INSTY INSTY(opCode,sel);
    EXT EXT(opCode,ZNC_code);

    // Instructions
    CMP CMP(A_in,B_in,CMP_out);
    SET SET(ZNC_in,ZNC_code,SET_out);
    CLR CLR(ZNC_in,ZNC_code,CLR_out);

    // Decoder
    DECOY DECOY(CMP_out,SET_out,CLR_out,sel,ZNC_out);

endmodule

