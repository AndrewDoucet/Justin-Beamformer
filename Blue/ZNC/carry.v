module carry(regA,regB,newRegA,out);
    input [15:0]regA;
    input [15:0]regB;
    input [15:0]newRegA;
    reg [2:0]mid;

    assign mid[2] = regA[15];
    assign mid[1] = regB[15];
    assign mid[0] = newRegA[15];

    output reg out;

    always @(mid)
        case(mid)
            0 : out = 0;
            1 : out = 0;
            2 : out = 0;
            3 : out = 1;
            4 : out = 0;
            5 : out = 1;
            6 : out = 1;
            7 : out = 1;
        endcase
endmodule 