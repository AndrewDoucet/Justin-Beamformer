//Spencer Dugas

//Branch Function

module BR (ins, znc, br);
    input [15:0] ins;
    input [2:0] znc;
    output br;

      assign br = (!ins [11])?(((ins[10] == !znc [2]) || (ins[9] == !znc [1]) || (ins [8] == !znc[0]))?(1):((!ins[10] && !ins [9] && !ins [8])?(1):(0))):((ins[10] && znc [2]) || (ins[9] && znc [1]) || (ins[8] && znc [0]))?(1):((ins [10] && ins[9] && ins[8])?(1):(0));

endmodule
