`timescale 1ns / 1ps

module testbench ( );

	reg [15:0] RA, RB, ins;
	reg [2:0] znc;
	wire [2:0] out;

	yellow U1 (RA, RB, ins, znc, out);

	initial begin
	
	RA = 0000000000000000;
	RB = 0000000000000000;
	ins = 0000000000000000;
	znc = 000;

	//generate pattern
    	
	#10 ;
	end
endmodule
