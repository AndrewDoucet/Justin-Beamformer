// Andrew Doucet

module ROM(address, out);

    input [7:0]address;
    output reg [15:0]out;

    reg [15:0]memory[0:255];

    // 0 LD
    // 1 ST
    // 2 INC
    // 3 BR
    // 4 ADD
    // 5 SUB
    // 6 OR
    // 7 AND
    // 8 XOR
    // 9 SHR
    // A MOV
    // B EXCH
    // C CMP
    // D SET
    // E CLR

    assign memory[0] = 16'h4000;
    assign memory[1] = 16'h4000;
    assign memory[2] = 16'h5000;
    assign memory[3] = 16'h5000;
    assign memory[4] = 16'hFFFF;
    assign memory[5] = 16'hFFFF;
    assign memory[6] = 16'hFFFF;
    assign memory[7] = 16'hFFFF;
    assign memory[8] = 16'hFFFF;
    assign memory[9] = 16'hFFFF;
    assign memory[10] = 16'hFFFF;
    assign memory[11] = 16'hFFFF;
    assign memory[12] = 16'hFFFF;
    assign memory[13] = 16'hFFFF;
    assign memory[14] = 16'hFFFF;
    assign memory[15] = 16'hFFFF;

    always @(address)
        out <= memory[address];

endmodule