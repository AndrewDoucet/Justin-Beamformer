module negative(regA,out);
    input [15:0]regA;
    output reg out;
    always @(regA)
        if(regA[15]==1)
            out = 1;
        else
            out = 0;
endmodule 