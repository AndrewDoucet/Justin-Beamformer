//Spencer Dugas

// Decoder for the yelow instructions

module DECOY (CMP,SET,CLR,sel,OUT);
    input [2:0] CMP, SET, CLR;
    input [1:0] sel;
    output wire [2:0] OUT;

    assign OUT = (sel == 2'b00)?(CMP):
        (sel == 2'b01)?(SET):
        (sel == 2'b10)?(CLR):(0);
endmodule
    