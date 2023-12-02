`timescale 1ns / 1ps

module testbench ( );

	reg [15:0] RA, RB, ADDA, SUBA,ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB;
	reg [2:0] sel;
	wire [15:0] outA, outB;

	DECO U1 (RA, RB, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB, sel, outA, outB);

	initial begin
	
	RA = 000000000000000;
	RB = 000000000000000;
	ADDA = 000000000000000;
	SUBA = 000000000000000;
	ORA = 000000000000000;
	ANDA = 000000000000000;
	XORA = 000000000000000;
	SHRA = 000000000000000;
	MOVB = 000000000000000;
	EXCHA = 000000000000000;
	EXCHB = 000000000000000;
	ins = 000000000000000;

	//generate pattern
    	
	#10 ;
	end
endmodule