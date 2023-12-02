// Andrew Doucet

module main(clk,A_out,B_out,ZNC_out,opCode);

    input clk;
    reg en;
    reg BR;
    assign BR = 0;
    assign en = 1;

    // System Outputs
    wire [15:0]A_in;
    wire [15:0]B_in;
    wire [2:0]ZNC_in;

    output [15:0]A_out;
    output [15:0]B_out;

    output [2:0]ZNC_out;
    output [15:0]opCode;

    red red(clk,en,opCode,BR);
    blue blue(opCode,A_out,B_out,A_in,B_in,ZNC_in);
    reg16 A(A_in,A_out,clk,en);
    reg16 B(B_in,B_out,clk,en);
    reg3 ZNC(ZNC_in,ZNC_out,clk,en);
endmodule