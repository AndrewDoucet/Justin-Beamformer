//Spencer Dugas

module INSTY (ins, sel);
    input [15:0] ins;
    output [1:0] sel;

    assign sel [1] = ins [13];
    assign sel [0] = ins [12];

endmodule