// Spencer Dugas
// Andrew Doucet

//Adder Module to Add RB to RA

module ADD (RA, RB, out);
	input [15:0] RA, RB;
	output [15:0] out;
	wire [7:0] s, c
	
	half_adder M0(RA[0],RB[0],c[0],s[0]);
	full_adder M1(RA[1],RB[1],c[0],c[1],s[1]);
	full_adder M2(RA[2],RB[2],c[1],c[2],s[2]);
	full_adder M3(RA[3],RB[3],c[2],c[3],s[3]);
	full_adder M4(RA[4],RB[4],c[3],c[4],s[4]);
	full_adder M5(RA[5],RB[5],c[4],c[5],s[5]);
	full_adder M6(RA[6],RB[6],c[5],c[6],s[6]);
	full_adder M7(RA[7],RB[7],c[6],c[7],s[7]);
	
	assign out[0] = s[0];
	assign out[1] = s[1];
	assign out[2] = s[2];
	assign out[3] = s[3];
	assign out[4] = s[4];
	assign out[5] = s[5];
	assign out[6] = s[6];
	assign out[7] = s[7];


	
endmodule