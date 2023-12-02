//Spencer Dugas

module INST (ins, sel);
    input [15:0] ins;
    output [2:0] sel;

    assign sel [2] = ins [14];
    assign sel [1] = ins [13];
    assign sel [0] = ins [12];

endmodule