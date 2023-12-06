// Andrew Doucet
// Spencer Dugas

// And instruction
module ADD (A_in, B_in, A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// Addition
	assign A_out = A_in + B_in;	

endmodule