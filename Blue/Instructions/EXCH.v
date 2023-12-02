//Spencer Dugas

//Exchanger to exchange register A with register B

module EXCH (RA, RB, RA_new, RB_new);
    input [15:0] RA, RB;
    output [15:0] RA_new, RB_new;

    assign RA_new = RB;
    assign RB_new = RA;
    
endmodule
    
