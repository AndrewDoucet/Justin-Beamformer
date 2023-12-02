//Spencer Dugas

module EXT (ins, sel);
    input [15:0] ins;
    output [2:0] sel;

    assign sel [2] = ins [10];
    assign sel [1] = ins [9];
    assign sel [0] = ins [8];

endmodule