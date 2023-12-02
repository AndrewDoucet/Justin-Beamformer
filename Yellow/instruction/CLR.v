//Spencer Dugas

//SET
module CLR (ZNC, ins, clr_out);
    input [2:0] ZNC, ins;
    output reg [2:0] clr_out;

    assign clr_out [2] = (ins[2])?(0):(ZNC [2]);
    assign clr_out [1] = (ins[1])?(0):(ZNC [1]);
    assign clr_out [0] = (ins[0])?(0):(ZNC [0]);
    
endmodule