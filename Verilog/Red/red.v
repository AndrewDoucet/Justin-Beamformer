// Andrew Doucet
// Spencer Dugas

// Red Circuit
module red(clk,opCode_out,BR);

    // Inputs & Outputs
    input clk;
    input BR;
    output [15:0]opCode_out;

    // Data Busses
    reg [15:0]PC_in;
    wire [15:0]PC_out, increment, opCode_in;
    
    // Registers
    reg16 opCode_reg(opCode_in,opCode_out,clk);
    PC_reg PC_reg(PC_in,PC_out,~clk);

    // Adder to increment program counter
    ADD ADD(PC_out,1,increment);

    // Read Only Instruction Memory
    ROM ROM(PC_out[7:0],opCode_in);

    // Initizliaze the value of PC_in
    initial
        PC_in <= 16'hFFFF;

    // Program counter decoder
    always@(PC_out,opCode_out,BR)
        if (BR == 1)
            PC_in = opCode_out;
        else
            PC_in = increment;
    
endmodule