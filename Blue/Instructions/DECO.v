//Spencer Dugas

// Decoder to figure out what is going on

module DECO (RA, RB, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB, sel, outA, outB,ZNC_in,ZNC_mid,ZNC_out);

    input [15:0] RA, RB, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB;
    input [2:0] sel;
    output reg [15:0] outA, outB;

    input [2:0]ZNC_mid;
    input [2:0]ZNC_in;
    output reg [2:0]ZNC_out;

    always @ (RA or RB or sel)  begin

        case(sel)
            //ADD
            3'b100 : begin
                        outA = ADDA;
                        outB = RB;
                        ZNC_out = ZNC_mid;
                    end
            //SUB
            3'b101 : begin
                        outA = SUBA;
                        outB = RB;
                        ZNC_out = ZNC_mid;
                    end
            //OR
            3'b110 : begin
                        outA = ORA;
                        outB = RB;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //AND
            3'b111 : begin
                        outA = ANDA;
                        outB = RB;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //XOR
            3'b000 : begin
                        outA = XORA;
                        outB = RB;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //SHR
            3'b001 : begin
                        outA = SHRA;
                        outB = RB;
                        ZNC_out = ZNC_in;
                    end
            //MOV
            3'b010 : begin
                        outA = RA;
                        outB = MOVB;
                        ZNC_out = ZNC_in;
                    end
            //EXCH
            3'b011 : begin
                        outA = EXCHA;
                        outB = EXCHB;
                        ZNC_out = ZNC_in;
                    end
        endcase
    end
endmodule