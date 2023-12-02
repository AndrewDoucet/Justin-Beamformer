//Spencer Dugas

// Decoder to figure out what is going on

module DECO (RA, RB, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB, sel, outA, outB);

    input [15:0] RA, RB, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB;
    input [2:0] sel;
    output reg [15:0] outA, outB;

    always @ (sel || RA || RB) begin

        case(sel)
            //ADD
            3'b100 : begin
                        outA = ADDA;
                        outB = RB;
                    end
            //SUB
            3'b101 : begin
                        outA = SUBA;
                        outB = RB;
                    end
            //OR
            3'b110 : begin
                        outA = ORA;
                        outB = RB;
                    end
            //AND
            3'b111 : begin
                        outA = ANDA;
                        outB = RB;
                    end
            //XOR
            3'b000 : begin
                        outA = XORA;
                        outB = RB;
                    end
            //SHR
            3'b001 : begin
                        outA = SHRA;
                        outB = RB;
                    end
            //MOV
            3'b010 : begin
                        outA = RA;
                        outB = MOVB;
                    end
            //EXCH
            3'b011 : begin
                        outA = EXCHA;
                        outB = EXCHB;
                    end
        endcase
    end
endmodule