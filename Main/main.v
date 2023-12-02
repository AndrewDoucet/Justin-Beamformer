// Andrew Doucet

module main(clk,A_out,B_out,znc_out,opCode);

    input clk;
    output [15:0]A_out;
    output [15:0]B_out;
    output [2:0]znc_out;
    output [15:0]opCode;



    blue blue();
    yellow yellow();
    green green();
    red red();
endmodule