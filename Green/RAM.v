// Andrew Doucet

module RAM(address, in, out, clk, WE);

    input clk;
    input WE;
    input [7:0]address;
    input [15:0]in;
    output reg [15:0]out;

    reg [15:0]memory[0:255];

    always @(posedge clk)
        if(WE)
            memory[address] <= in;
        else
            out <= memory[address];

endmodule