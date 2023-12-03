// Andrew Doucet

module green(clk,en,WE,opCode,A_in,B_in,A_out);

    // Clock and enable
    input clk;
    input WE;
    input en;

    // Write Enable
    assign WE = 1;

    input [15:0]A_in;
    input [15:0]B_in;
    input [15:0]opCode;

    output [15:0]A_out;

    wire [15:0] ram_in;
    wire [15:0] ram_out;
    wire [7:0] address;

    LD LD(ram_out,opCode,address,A_out,A_in,B_in);
    //ST ST(A_in,B_in,opCode,ram_in,address);
    RAM RAM(address, ram_in, ram_out, clk, WE);
endmodule