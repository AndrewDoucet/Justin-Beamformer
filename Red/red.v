// Andrew Doucet

module red(clk,en,opCode_out,BR);
    // Clock and enable
    input clk;
    input en;
    input BR;

    reg [15:0]PC_in;
    wire [15:0]PC_out;
    wire [15:0]increment;
    wire [15:0]opCode_in;
    output [15:0]opCode_out;
    
    // Resgisters
    reg16 opCode_reg(opCode_in,opCode_out,clk,en);
    PC_reg PC_reg(PC_in,PC_out,~clk,en);
    ROM ROM(PC_out[7:0],opCode_in);
    ADD ADD(PC_out,1,increment);

    initial
        PC_in <= 16'hFFFF;

    always@(PC_out or opCode_out)
        if (BR == 1)
            PC_in = opCode_out;
        else
            PC_in = increment;
    
endmodule