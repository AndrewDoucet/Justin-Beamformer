`timescale 1ns / 1ps

module testbench ( );

	reg [15:0] RA;
	wire [15:0] out;

	SHR U1 (RA, out);

	initial begin
	
	RA = 000000000000000;
	RB = 000000000000000;
	
	end
endmodule
