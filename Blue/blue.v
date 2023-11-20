module blue(I,A,B,ZNC)
    input [15:0]I;
    output [15:0]A;
    output [15:0]B;
    output [15:0]ZNC;
    reg [15:0]midA;
    reg [15:0]midB;

    negative negative()
    zero zero()
    carry carry()
    reg16 regA();
    reg16 regB();
    reg3 znc();
endmodule