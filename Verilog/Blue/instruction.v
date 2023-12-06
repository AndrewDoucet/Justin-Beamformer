// Andrew Doucet
// Spencer Dugas

// Contains all the blue instructions
module instruction (A_in, B_in, opCode, A_out, B_out,ZNC_in,ZNC_mid,ZNC_out);

    // A & B registers
    input [15:0] A_in, B_in;
    output [15:0] A_out, B_out;

    // Intermediate busses
    wire [15:0] adda, suba, ora, anda, xora, shra, movb, excha, exchb;

    // ZNC registers
    input [2:0]ZNC_in,ZNC_mid;
    output [2:0]ZNC_out;

    // Isolate three select bits for the decoder
    input [15:0]opCode;
    wire [2:0] sel;
    INST M10(opCode,sel);

    // All instructions
    ADD ADD(A_in,B_in,adda);
    SUB SUB(A_in,B_in,suba);
    OR OR(A_in,B_in,ora);
    AND AND(A_in,B_in,anda);
    XOR XOR(A_in,B_in,xora);
    SHR SHR(A_in,shra);
    MOV MOV(A_in,movb);
    EXCH EXCH(A_in, B_in, excha, exchb);

    //Decode the Output
    DECO M9(A_in,B_in,adda,suba,ora,anda,xora,shra,movb,excha,exchb,sel,A_out,B_out,ZNC_in,ZNC_mid,ZNC_out);

endmodule






