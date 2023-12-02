// Andrew Doucet

module green(clk,eb,opCode,A_in,B_in);


    // Clock and enable
    input clk;
    input en;

    output [15:0]A_in;
    output [15:0]B_in;
    input [15:0]opCode;


    // Resgisters
    reg16 A_reg(A_out,A_in,clk,en);
    reg16 B_reg(B_out,B_in,clk,en);

    LD LD(opCode);
    ST ST(opCode,A_in,B_in,out,address);
    RAM RAM(address, ram_in, ram_out, clk, WE);
endmodule