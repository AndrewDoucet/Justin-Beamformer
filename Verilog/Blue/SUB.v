// Andrew Doucet
// Spencer Dugas

// SUB instruction
module SUB (A_in, B_in, A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// Subtraction
	assign A_out = A_in - B_in;
	
endmodule