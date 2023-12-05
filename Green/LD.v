// Spencer Dugas

// Load 

module LD (data, ins, addr, out,A_in,B_in);
    input [15:0] data, ins, A_in,B_in;
    output [7:0] addr;
    output reg[15:0] out;

    assign addr = ins[7:0];

    always@(ins, A_in, B_in, data)
    begin
        if (~ins[11])
            out = A_in;
        else
            out = B_in;

        if (~ins[10])
            out = data;
        else
            if (~ins[9])
                out[7:0] = addr;
            else
                out[15:8] = addr;
    end
endmodule