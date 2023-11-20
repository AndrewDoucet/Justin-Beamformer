//Andrew Doucet
//Spencer Dugas

//OR 

module OR (RA,RB,out);
	input [15:0] RA, RB;
	output [15:0] out);
	
	assign out[0] = RA[0] | RB[0];
	assign out[1] = RA[1] | RB[1];
	assign out[2] = RA[2] | RB[2];
	assign out[3] = RA[3] | RB[3];
	assign out[4] = RA[4] | RB[4];
	assign out[5] = RA[5] | RB[5];
	assign out[6] = RA[6] | RB[6];
	
endmodule 