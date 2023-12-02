// Andrew Doucet

module CMP (A_in, B_in, znc_out);
    input [15:0]A_in;
    input [15:0]B_in;
    wire [15:0]A_out;
    SUB SUB(A_in,B_in,A_out);

    output [2:0]znc_out;
    zero zero(A_out,znc_out[2]);
    negative negative(A_out,znc_out[1]);
    carry carry(A_in,B_in,A_out,znc_out[0]);
endmodule