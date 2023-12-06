// Andrew Doucet
// Spencer Dugas

// Shift Right
module SHR (A_in,A_out);

	// I/O
	input [15:0] A_in;
	output [15:0] A_out;
	
	// Shifts all bits right
	assign A_out[15] = A_in[0];
	assign A_out[0] = A_in[1];
	assign A_out[1] = A_in[2];
	assign A_out[2] = A_in[3];
	assign A_out[3] = A_in[4];
	assign A_out[4] = A_in[5];
	assign A_out[5] = A_in[6];
	assign A_out[6] = A_in[7];
	assign A_out[7] = A_in[8];
	assign A_out[8] = A_in[9];
	assign A_out[9] = A_in[10];
	assign A_out[10] = A_in[11];
	assign A_out[11] = A_in[12];
	assign A_out[12] = A_in[13];
	assign A_out[13] = A_in[14];
	assign A_out[14] = A_in[15];
	
endmodule 