// Andrew Doucet
// Spencer Dugas

// Carry bit handler
module carry(A_in,B_in,A_mid,out);

    // Inputs
    input [15:0]A_in,B_in,A_mid;

    // Temporary Array
    reg [2:0]temp;
    assign temp[2] = A_in[15];
    assign temp[1] = B_in[15];
    assign temp[0] = A_mid[15];

    // Output
    output reg out;

    // Update the the carry bit
    always @(temp)
        case(temp)
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