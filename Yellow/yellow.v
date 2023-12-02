// Andrew Doucet

module yellow(opCode,A_in,B_in,clk,en,znc_in);
    // Input Wires
    input [15:0]A_in;
    input [15:0]B_in;
    input [15:0]opCode;
    
    // I/O Wires
    output [2:0]znc_in;
    wire [2:0]znc_out;

    // Clock and enable
    input clk;
    input en;

    // Instructions
    CMP CMP(A_in,B_in,znc_out);

    // Registers
    reg3 znc_reg(znc_out,znc_in,clk,en);

endmodule