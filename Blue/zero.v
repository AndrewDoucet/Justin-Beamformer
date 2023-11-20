module zero(regA,out)
    input [15:0]regA;
    output out;

    always @(regA)
        if(regA==0)
            out = 1;
        else
            out = 0;
endmodule 