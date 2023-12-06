// Andrew Doucet
// Spencer Dugas

//Store
module ST (A_in, B_in, opCode, data, address);

    // I/O
    input [15:0] A_in, B_in, opCode;
    output [15:0] data;
    output [7:0] address;

    // Assignment
    assign data = (opCode [11])?(B_in):(A_in);
    assign address = opCode [7:0];
endmodule