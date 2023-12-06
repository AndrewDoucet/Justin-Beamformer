// Andrew Doucet
// Spencer Dugas

// EXCH operation
module EXCH (A_in, B_in, A_out, B_out);

    // I/O
    input [15:0] A_in, B_in;
    output [15:0] A_out, B_out;

    // Exchanges A & B
    assign A_out = B_in;
    assign B_out = A_in;
    
endmodule
    
