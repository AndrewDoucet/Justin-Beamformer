module PC(clk,out,BR,opCode);
    
    reg [7:0]in;
    input BR;
    output reg [7:0]out;
    input clk;
    input [15:0]opCode;

    always@(BR || out || opCode)
    if (BR == 0)
        in = out + 1;
    else
        in = opCode[7:0];

    always@(posedge clk)
        out = in;
endmodule