//spencer dugas

//This makes sure the yellow circuit works

module yellow (RA, RB, ins, znc, out);
    input [15:0] RA, RB, ins;
    input [2:0] znc;
    output [2:0] out;

    wire [1:0] sel;
    wire [2:0] cmp,clr,set,znc1;

    //Extract the instruction and ZNC from instruction
    INSTY M1(ins,sel);
    EXT M2(ins,znc1);

    //do the instructions
    CMP M3(RA,RB,cmp);
    SET M4(znc,znc1,set);
    CLR M5(znc,znc1,clr);

    //Decode the Output
    DECOY M6(cmp,set,clr,sel,out);

endmodule

