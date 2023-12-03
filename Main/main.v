// Andrew Doucet

module main(clk,A_out,B_out,ZNC_out,opCode);

    input clk;
    reg en;
    reg BR;
    assign BR = 0;
    assign en = 1;

    // Blue Outpus
    wire [15:0]A_blue;
    wire [15:0]B_blue;
    wire [2:0]ZNC_blue;

    // Yellow Outpus
    wire [15:0]A_yellow;
    wire [15:0]B_yellow;
    wire [2:0]ZNC_yellow;

    // Green Outputs
    wire [15:0]A_green;
    wire [15:0]B_green;
    wire [2:0]ZNC_green;

    // Register Inputs
    wire [15:0]A_in;
    wire [15:0]B_in;
    wire [2:0]ZNC_in;

    // Register Outputs
    output [15:0]A_out;
    output [15:0]B_out;
    output [2:0]ZNC_out;

    // OpCode
    output [15:0]opCode;

    red red(clk,en,opCode,BR);
    blue blue(opCode,A_out,B_out,A_blue,B_blue,ZNC_blue);
    yellow yellow(A_out,B_out,opCode,ZNC_out,ZNC_yellow);
    green green(clk,en,WE,opCode,A_out,B_out,A_green);
    becode becode(opCode, A_blue,B_blue,ZNC_blue,A_out,B_out,ZNC_yellow,A_green,B_green,ZNC_green,A_in,B_in,ZNC_in);

    reg16 A(A_in,A_out,~clk,en);
    reg16 B(B_in,B_out,~clk,en);
    reg3 ZNC(ZNC_in,ZNC_out,~clk,en);

endmodule