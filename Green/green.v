// Andrew Doucet

module green(clk,en,WE,opCode,A_in,B_in,ZNC_in,A_out,B_out,ZNC_out,BR_out);

    // Clock and enable
    input clk;
    input WE;
    input en;

    input [15:0]A_in;
    input [15:0]B_in;
    input [15:0]opCode;
    input [2:0] ZNC_in;

    output [15:0]A_out;
    output [15:0]B_out;
    output BR_out;
    output [2:0] ZNC_out;

    wire [15:0] A_inc;
    wire [15:0] B_inc;
    wire [15:0] LD_out;
    wire BR_in;

    wire [15:0] ram_in;
    wire [15:0] ram_out;
    wire [7:0] address;

    BR BR(opCode,ZNC_in,BR_in);
    INC INC(A_in, B_in, opCode, A_inc, B_inc);
    LD LD(ram_out,opCode,address,LD_out,A_in,B_in);
    ST ST(A_in,B_in,opCode,ram_in,address);
    RAM RAM(address, ram_in, ram_out, ~clk, WE);
    DECOG DECOG(A_in, B_in, A_inc, B_inc, LD_out, BR_in, opCode, A_out, B_out, WE, BR_out);

endmodule