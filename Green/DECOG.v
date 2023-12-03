//Spencer Dugas

// Decoder for green circuit

module DECOG (RA, RB, inca, incb, lda, ldb, ins, RA_OUT, RB_OUT, WE);

    input [15:0] RA, RB, ins;
    output [15:0] RA_OUT, RB_OUT;
    output WE, BR;

    wire RBB;
    wire [3:0] OPC;

    // Grab the important info from the instruction.
    assign RBB = ins[11];
    assign OPC = ins[15:12];

    //Store Data if true 
    assign WE = (OPC == 4'b0001)?(1):(0);

    // assigns the Output of the B register. If load B else if inc B.
    assign RA_OUT = (OPC == 4'b0000)?((!RBB)?(lda):(RA)):
                (OPC == 4'b0010)?((!RBB)?(inca):(RA)):(RA);

    // assigns the Output of the B register. If load B else if inc B.
    assign RB_OUT = (OPC == 4'b0000)?((RBB)?(ldb):(RB)):
                (OPC == 4'b0010)?((RBB)?(incb):(RB)):(RB);

endmodule
            


