// Andrew Doucet
// Spencer Dugas

// Green Circuit
module green(clk,WE,opCode,A_in,B_in,ZNC_in,A_out,B_out,ZNC_out,BR_out);

    // Clock and write enable, & branch
    input clk, WE;
    wire BR_in;
    output BR_out;

    // I/O
    input [15:0]A_in,B_in,opCode;
    output [15:0]A_out,B_out;

    // ZNC
    input [2:0] ZNC_in;
    wire [2:0] ZNC_mid;
    output [2:0] ZNC_out;

    // Intermediate busses
    wire [15:0] A_inc,B_inc,LD_out;

    // RAM
    wire [15:0] ram_in,ram_out;
    wire [7:0] address;
    RAM RAM(address, ram_in, ram_out, ~clk, WE);

    // Instructions
    BR BR(opCode,ZNC_in,BR_in);
    INC INC(A_in, B_in, opCode, A_inc, B_inc);
    LD LD(ram_out,opCode,address,LD_out,A_in,B_in);
    ST ST(A_in,B_in,opCode,ram_in,address);

    // Decoder
    DECOG DECOG(A_in, B_in, A_inc, B_inc, LD_out, BR_in, opCode, A_out, B_out, WE, BR_out,ZNC_in,ZNC_mid,ZNC_out);

    // ZNC
    zero zero(A_out,ZNC_mid[2]);
    negative negative(A_out,ZNC_mid[1]);
    carry carry(A_in,B_in,A_out,ZNC_mid[0]);

endmodule