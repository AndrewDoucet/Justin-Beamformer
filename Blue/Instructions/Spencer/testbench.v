`timescale 1ns / 1ps

module testbench ( );

	reg [15:0] RA, RB, ins;
	wire [15:0] RA_OUT, RB_OUT;

	blue1 U1 (RA, RB, ins, RA_OUT, RB_OUT);

	initial begin
	
	RA = 000000000000000;
	RB = 000000000000000;
	ins = 000000000000000;

	//generate pattern
    	
	#10 ;
	end
endmodule
