//Andrew Doucet
//Spencer Dugas

//SHR

module SHR (RA,out);
	input [15:0] RA;
	output [15:0] out;
	
	
	assign out[15] = RA[0];
	assign out[0] = RA[1];
	assign out[1] = RA[2];
	assign out[2] = RA[3];
	assign out[3] = RA[4];
	assign out[4] = RA[5];
	assign out[5] = RA[6];
	assign out[6] = RA[7];
	assign out[7] = RA[8];
	assign out[8] = RA[9];
	assign out[9] = RA[10];
	assign out[10] = RA[11];
	assign out[11] = RA[12];
	assign out[12] = RA[13];
	assign out[13] = RA[14];
	assign out[14] = RA[15];
	
endmodule 