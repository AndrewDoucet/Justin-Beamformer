// Andrew Doucet

module ROM(address, out);

    input [7:0]address;
    output reg [15:0]out;

    reg [15:0]memory[0:255];

    assign memory[0] = 111;
    assign memory[1] = 222;
    assign memory[2] = 333;
    assign memory[3] = 444;
    assign memory[4] = 555;
    assign memory[5] = 666;
    assign memory[6] = 777;
    assign memory[7] = 888;
    assign memory[8] = 999;
    assign memory[9] = 1010;
    assign memory[10] = 1111;






    always @(address)
        out <= memory[address];

endmodule