// Andrew Doucet

module blue(opCode,A_in,B_in,clk,en,znc_in);
    input [15:0]opCode;

    // I/O Wires
    output [15:0]A_in;
    output [15:0]B_in;
    output [2:0]znc_in;

    // Clock and enable
    input clk;
    input en;

    // Output Wires
    wire [15:0]A_out;
    wire [15:0]B_out;
    wire [2:0]znc_out;

    // Instructions
    ADD ADD(A_in,B_in,A_out);

    // Resgisters
    reg16 A_reg(A_out,A_in,clk,en);
    reg16 B_reg(B_out,B_in,clk,en);

    // ZNC
    reg3 znc_reg(znc_out,znc_in,clk,en);
    zero zero(A_out,znc_out[2]);
    negative negative(A_out,znc_out[1]);
    carry carry(A_in,B_in,A_out,znc_out[0]);

endmodule