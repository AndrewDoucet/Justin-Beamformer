// Andrew Doucet
// Spencer Dugas

// Bitwise XOR
module XOR (A_in,B_in,A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// XOR operation
	assign A_out = A_in ^ B_in;
	
endmodule 