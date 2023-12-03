// Andrew Doucet

// Big Decoder

module becode (opCode, A_blue,B_blue,ZNC_blue,A_yellow,B_yellow,ZNC_yellow,A_green,B_green,ZNC_green,A_out,B_out,ZNC_out);

    input [15:0] opCode;
    wire [1:0] sel;
    assign sel [1] = opCode [15];
    assign sel [0] = opCode [14];

    input  [15:0] A_blue, B_blue, A_yellow,B_yellow,A_green,B_green;
    output wire[15:0] A_out, B_out;
    input [2:0] ZNC_blue, ZNC_yellow,ZNC_green;
    output wire [2:0] ZNC_out;

    assign A_out =      (sel == 2'b00)?(A_green):
                        (sel == 2'b01)?(A_blue):
                        (sel == 2'b10)?(A_blue):
                        (sel == 2'b11)?(A_yellow):(0);

    assign B_out =      (sel == 2'b00)?(B_green):
                        (sel == 2'b01)?(B_blue):
                        (sel == 2'b10)?(B_blue):
                        (sel == 2'b11)?(B_yellow):(0);

    assign ZNC_out =    (sel == 2'b00)?(ZNC_green):
                        (sel == 2'b01)?(ZNC_blue):
                        (sel == 2'b10)?(ZNC_blue):
                        (sel == 2'b11)?(ZNC_yellow):(0);
endmodule
    