// Andrew Doucet
// Spencer Dugas

// Zero bit handler
module zero(regA,out);

    // I/O
    input [15:0]regA;
    output reg out;

    //Update the zero bit
    always @(regA)
        if(regA==0)
            out = 1;
        else
            out = 0;
endmodule 