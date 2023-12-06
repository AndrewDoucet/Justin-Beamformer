// Andrew Doucet
// Spencer Dugas

// Decoder for yellow instruction
module DECOY (CMP,SET,CLR,sel,ZNC_out);

    // I/O
    input [2:0] CMP, SET, CLR;
    input [1:0] sel;
    output wire [2:0] ZNC_out;

    // Assignment
    assign ZNC_out = (sel == 2'b00)?(CMP):
        (sel == 2'b01)?(SET):
        (sel == 2'b10)?(CLR):(0);
endmodule
    