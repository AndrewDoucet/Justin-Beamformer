// Andrew Doucet
// Spencer Dugas

// Negative bit handler
module negative(A_in,out);

    // I/O
    input [15:0]A_in;
    output reg out;

    // Update the negative bit
    always @(A_in)
        if(A_in[15]==1)
            out = 1;
        else
            out = 0;
endmodule 