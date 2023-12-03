// Spencer Dugas

/*the Green block

module green1 (RA, RB, ZNC, ins, BR, WE, RA_OUT, RB_OUT);
    input [15:0] RA, RB, ins;
    output [15:0] RA_OUT, RB_OUT,
    output BR, WE;

    wire [15:0] inca, incb, lda, ldb;
    wire branch;
    
    INC M1(RA, RB, ins, inca, incb);
    BR M2(ins, znc, branch);
    LD M3(ins, lda, ldb);

    DECOG M4(RA, RB, inca, incb, lda, ldb, branch, ins, RA_OUT, RB_OUT, WE, BR);

endmodule


*/