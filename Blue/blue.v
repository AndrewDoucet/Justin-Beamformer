module blue(opCode,A_out,B_out,clk,en,znc_out);
    input [15:0]opCode;

    // Output Wires
    output [15:0]A_out;
    output [15:0]B_out;
    output [2:0]znc_out;

    // Clock and enable
    input clk;
    input en;

    // Middle Wires
    wire [15:0]A_mid;
    wire [15:0]B_mid;
    wire [2:0]znc_mid;

    // Instructions
    ADD ADD(A_out,B_out,A_mid);

    // Resgisters
    reg16 A_reg(A_mid,A_out,clk,en);
    reg16 B_reg(B_mid,B_out,clk,en);

    // ZNC
    reg3 znc_reg(znc_mid,znc_out,clk,en);
    zero zero(A_mid,znc_mid[2]);
    negative negative(A_mid,znc_mid[1]);
    carry carry(A_out,B_out,A_mid,znc_mid[0]);

endmodule