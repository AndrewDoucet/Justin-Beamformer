`timescale 1ns / 1ps

module Mux_2 (
	input [0:1] in,
	input sel,
	output out);
	
	wire sel_bar;
	wire [0:1] andsel;
	
	assign sel_bar = ~sel;
	assign andsel[0] = sel_bar & in[0];
	assign andsel[1] = sel & in[1];
	assign out = andsel[1] | andsel[0];
	
endmodule 

module Mux_4 (
	input [0:3] in,
	input [0:1] sel,
	output out);

	wire [0:1] sel_bar;
	wire [0:1] internalMuxOut;
	
	assign sel_bar = ~sel;
	Mux_2 M1(in[0:1],sel_bar[1],internalMuxOut[0]);
	Mux_2 M2(in[2:3],sel_bar[1],internalMuxOut[1]);
	Mux_2 M3(internalMuxOut,sel_bar[0],out);
endmodule 