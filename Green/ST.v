// Spencer Dugas

//Store

module ST (RA, RB, ins, data, addr);
    input [15:0] RA, RB, ins;
    output [15:0] data;
    output [7:0] addr;

    assign data = (ins [11])?(RB):(RA);
    assign addr = ins [7:0];

endmodule