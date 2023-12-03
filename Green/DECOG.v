//Spencer Dugas

// Decoder for green circuit

module DECOG (RA, RB, inca, incb, ld, BR_in, ins, RA_OUT, RB_OUT, WE, BR_out);

    input [15:0] RA, RB, inca, incb, ld, ins;
    input BR_in;
    output [15:0] RA_OUT, RB_OUT;
    output WE, BR_out;

    wire RBB;
    wire [3:0] OPC;

    // Grab the important info from the instruction.
    assign RBB = ins[11];
    assign OPC = ins[15:12];

    //Store Data if true 
    assign WE = (OPC == 4'b0001)?(1):(0);
    
    //branch if true
    assign BR_out = (OPC == 4'b0011)?(BR_in):(0);
    // assigns the Output of the B register. If load B else if inc B.
    assign RA_OUT = (OPC == 4'b0000)?((!RBB)?(ld):(RA)):
                (OPC == 4'b0010)?((!RBB)?(inca):(RA)):(RA);

    // assigns the Output of the B register. If load B else if inc B.
    assign RB_OUT = (OPC == 4'b0000)?((RBB)?(ld):(RB)):
                (OPC == 4'b0010)?((RBB)?(incb):(RB)):(RB);

endmodule
            


