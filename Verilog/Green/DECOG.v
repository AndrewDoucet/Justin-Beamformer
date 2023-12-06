// Andrew Doucet
// Spencer Dugas

// Decoder for green circuit
module DECOG (A_in, B_in, A_inc, B_inc, LD, BR_in, opCode, A_out, B_out, WE, BR_out,ZNC_in,ZNC_mid,ZNC_out);

    // I/O
    input [15:0] A_in, B_in, A_inc, B_inc, LD, opCode;
    input BR_in;
    output [15:0] A_out, B_out;
    output WE, BR_out;

    // ZNC
    input [2:0] ZNC_in,ZNC_mid;
    output [2:0] ZNC_out;

    // Intermediate Busses
    wire RBB;
    wire [3:0] OPC;
    assign RBB = opCode[11];
    assign OPC = opCode[15:12];

    //Store Data if true 
    assign WE = (OPC == 4'b0001)?(1):(0);
    
    // Branch if true
    assign BR_out = (OPC == 4'b0011)?(BR_in):(0);

    // Assigns the Output of the B register. If load B else if inc B.
    assign A_out = (OPC == 4'b0000)?((!RBB)?(LD):(A_in)):
                (OPC == 4'b0010)?((!RBB)?(A_inc):(A_in)):(A_in);

    // Assigns the Output of the B register. If load B else if inc B.
    assign B_out = (OPC == 4'b0000)?((RBB)?(LD):(B_in)):
                (OPC == 4'b0010)?((RBB)?(B_inc):(B_in)):(B_in);

    // Assigns the Output of the ZNC register.
    assign ZNC_out = (OPC == 4'b0010)?(ZNC_mid):(ZNC_in);

endmodule
            


