//Andrew Doucet
//Spencer Dugas

//XOR 

module XOR (RA,RB,out);
	input [15:0] RA, RB;
	output [15:0] out;

	assign out = RA ^ RB;
	
endmodule 