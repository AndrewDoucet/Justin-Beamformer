// Andrew Doucet
// Spencer Dugas

// This module contains the Smachine
module main(clk,A,B,ZNC,opCode);

    // Clock
    input clk;

    // Register Outpus
    output [15:0] A,B,opCode;
    output [2:0] ZNC;

    // S-machine
    Smachine Smachine(clk,A,B,ZNC,opCode);
endmodule