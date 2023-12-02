`timescale 1ns / 1ps

module Mux_2 (
	input [1:0] in,
	input sel,
	output out);
	
	wire sel_bar;
	wire [1:0] andsel;
	
	assign sel_bar = ~sel;
	assign andsel[0] = sel_bar & in[0];
	assign andsel[1] = sel & in[1];
	assign out = andsel[1] | andsel[0];
	
endmodule 