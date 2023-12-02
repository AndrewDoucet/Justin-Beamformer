//Spencer Dugas

//SET
module SET (ZNC, ins, set_out);
    input [2:0] ZNC, ins;
    output [2:0] set_out;

    assign set_out [2] = (ins[2])?(1):(ZNC [2]);
    assign set_out [1] = (ins[1])?(1):(ZNC [1]);
    assign set_out [0] = (ins[0])?(1):(ZNC [0]);

endmodule