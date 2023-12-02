// Spencer Dugas

//Adder Module to Add RB to RA

module SUB (RA, RB, out);
	input [15:0] RA, RB;
	output [15:0] out;

	assign out = RA - RB;
	
endmodule