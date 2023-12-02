//Spencer Dugas

//testing instructions and ther decoded output

module blue1 (RA, RB, ins, RA_OUT, RB_OUT);
    input [15:0] RA, RB, ins;
    output [15:0] RA_OUT, RB_OUT;

    wire [15:0] adda, suba, ora, anda, xora, shra, movb, excha, exchb;
    wire [2:0] sel;

    // Isolate three select bits for the decoder
    INST M10(ins,sel);

    //Do the instructions
    ADD M1(RA,RB,adda);
    SUB M2(RA,RB,suba);
    OR M3(RA,RB,ora);
    AND M4(RA,RB,anda);
    XOR M5(RA,RB,xora);
    SHR M6(RA,shra);
    MOV M7(RA,movb);
    EXCH M8(RA, RB, excha, exchb);

    //Decode the Output
    DECO M9(RA,RB,adda,suba,ora,anda,xora,shra,movb,excha,exchb,sel,RA_OUT,RB_OUT);

endmodule






