// Andrew Doucet

module main(clk,A,B,ZNC,opCode);
    input clk;
    output [15:0] A,B,opCode;
    output [2:0] ZNC;

   Smachine Smachine(clk,A,B,ZNC,opCode);
endmodule