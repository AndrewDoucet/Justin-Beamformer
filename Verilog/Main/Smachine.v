// Andrew Doucet
// Spencer Dugas

// S-machine
module Smachine(clk,A_out,B_out,ZNC_out,opCode);

    // CLOCK
    input clk;

    // A register
    output [15:0]A_out;
    wire [15:0]A_blue,A_yellow,A_green,A_in;
    reg16 A(A_in,A_out,~clk);

    // B register
    output [15:0]B_out;
    wire [15:0]B_blue,B_yellow,B_green,B_in;
    reg16 B(B_in,B_out,~clk);

    // ZNC register
    output [2:0]ZNC_out;
    wire [2:0]ZNC_blue,ZNC_yellow,ZNC_green,ZNC_in;
    reg3 ZNC(ZNC_in,ZNC_out,~clk);

    // Red Circuit
    wire BR;
    output [15:0]opCode;
    red red(clk,opCode,BR);

    // Blue, Yellow, Green Circuits
    blue blue(opCode,A_out,B_out,A_blue,B_blue,ZNC_blue,ZNC_out);
    yellow yellow(A_out,B_out,opCode,ZNC_out,ZNC_yellow);
    green green(clk,WE,opCode,A_out,B_out,ZNC_out,A_green,B_green,ZNC_green,BR);

    // Big Decoder
    becode becode(opCode, A_blue,B_blue,ZNC_blue,A_out,B_out,ZNC_yellow,A_green,B_green,ZNC_green,A_in,B_in,ZNC_in);
endmodule