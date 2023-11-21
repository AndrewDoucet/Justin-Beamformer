//Andrew Doucet
//Spencer Dugas

//SHR

module SHR (RA,out);
	input [15:0] RA;
	output [15:0] out;
	 
	assign out = RA + RA;

	
endmodule 