// Andrew Doucet
// Spencer Dugas

// MOV operatoin
module MOV (A_in, B_out);

    // I/O
    input [15:0] A_in;
    output [15:0] B_out;

    // Moves A to B
    assign B_out = A_in;
    
endmodule
    
