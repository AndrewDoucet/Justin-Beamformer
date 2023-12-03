// Andrew Doucet

module ROM(address, out);

    input [7:0]address;
    output reg [15:0]out;

    reg [15:0]memory[0:255];
    always @(address)
        out <= memory[address];

endmodule