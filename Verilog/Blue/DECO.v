// Andrew Doucet
// Spencer Dugas

// Decoder to figure out what is going on

module DECO (A_in, B_in, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB, sel, A_out, B_out,ZNC_in,ZNC_mid,ZNC_out);

    //Inputs from instruction
    input [15:0] A_in, B_in, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB;

    // Select and outputs
    input [2:0] sel;
    output reg [15:0] A_out, B_out;

    // ZNC bits
    input [2:0]ZNC_in, ZNC_mid;
    output reg [2:0]ZNC_out;

    // Decoder
    always @ (A_in,B_in,sel)  begin

        case(sel)
            //ADD
            3'b100 : begin
                        A_out = ADDA;
                        B_out = B_in;
                        ZNC_out = ZNC_mid;
                    end
            //SUB
            3'b101 : begin
                        A_out = SUBA;
                        B_out = B_in;
                        ZNC_out = ZNC_mid;
                    end
            //OR
            3'b110 : begin
                        A_out = ORA;
                        B_out = B_in;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //AND
            3'b111 : begin
                        A_out = ANDA;
                        B_out = B_in;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //XOR
            3'b000 : begin
                        A_out = XORA;
                        B_out = B_in;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //SHR
            3'b001 : begin
                        A_out = SHRA;
                        B_out = B_in;
                        ZNC_out = ZNC_in;
                    end
            //MOV
            3'b010 : begin
                        A_out = A_in;
                        B_out = MOVB;
                        ZNC_out = ZNC_in;
                    end
            //EXCH
            3'b011 : begin
                        A_out = EXCHA;
                        B_out = EXCHB;
                        ZNC_out = ZNC_in;
                    end
        endcase
    end
endmodule