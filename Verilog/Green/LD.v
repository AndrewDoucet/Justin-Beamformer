// Andrew Doucet
// Spencer Dugas

// Load 
module LD (data, ins, address, out,A_in,B_in);

    // I/O
    input [15:0] data, ins, A_in,B_in;
    output [7:0] address;
    output reg[15:0] out;
    assign address = ins[7:0];

    // Loads the value depending on opCode
    always@(ins, A_in, B_in, data)
    begin
        if (~ins[11])
            out = A_in;
        else
            out = B_in;
        
        // Load from RAM
        if (~ins[10])
            out = data;
        else
            // Load intermediate
            if (~ins[9])
                out[7:0] = address;
            else
                out[15:8] = address;
    end
endmodule