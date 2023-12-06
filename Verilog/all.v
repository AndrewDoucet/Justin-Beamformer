// Andrew Doucet
// Spencer Dugas

// This module contains the Smachine
module main(clk,A,B,ZNC,opCode);

    // Clock
    input clk;

    // Register Outpus
    output [15:0] A,B,opCode;
    output [2:0] ZNC;

    // S-machine
    Smachine Smachine(clk,A,B,ZNC,opCode);
endmodule

// S-machine
module Smachine(clk,A_out,B_out,ZNC_out,opCode);

    // CLOCK
    input clk;

    // A register
    output [15:0]A_out;
    wire [15:0]A_blue,A_yellow,A_green,A_in;
    reg16 A(A_in,A_out,~clk);

    // B register
    output [15:0]B_out;
    wire [15:0]B_blue,B_yellow,B_green,B_in;
    reg16 B(B_in,B_out,~clk);

    // ZNC register
    output [2:0]ZNC_out;
    wire [2:0]ZNC_blue,ZNC_yellow,ZNC_green,ZNC_in;
    reg3 ZNC(ZNC_in,ZNC_out,~clk);

    // Red Circuit
    wire BR;
    output [15:0]opCode;
    red red(clk,opCode,BR);

    // Blue, Yellow, Green Circuits
    blue blue(opCode,A_out,B_out,A_blue,B_blue,ZNC_blue,ZNC_out);
    yellow yellow(A_out,B_out,opCode,ZNC_out,ZNC_yellow);
    green green(clk,WE,opCode,A_out,B_out,ZNC_out,A_green,B_green,ZNC_green,BR);

    // Big Decoder
    becode becode(opCode, A_blue,B_blue,ZNC_blue,A_out,B_out,ZNC_yellow,A_green,B_green,ZNC_green,A_in,B_in,ZNC_in);
endmodule

// 16-bit registser
module reg16(D,Q,clk);
    // I/O
    input clk;
    input [15:0]D;
    output reg[15:0]Q;

    // Update on clock cycle
    always @(posedge clk) 
        Q <= D; 
endmodule

// 3-bit registser
module reg3(D,Q,clk);

    // I/O
    input clk;
    input [2:0]D;
    output reg [2:0]Q;

    // Update on clock cycle
    always @(posedge clk) 
        Q <= D; 
endmodule

// Big Decoder
module becode (opCode, A_blue,B_blue,ZNC_blue,A_yellow,B_yellow,ZNC_yellow,A_green,B_green,ZNC_green,A_out,B_out,ZNC_out);

    // Selector comes form opCode
    input [15:0] opCode;
    wire [1:0] sel;
    assign sel [1] = opCode [15];
    assign sel [0] = opCode [14];

    // Decoder Input
    input  [15:0] A_blue, B_blue, A_yellow,B_yellow,A_green,B_green;
    input [2:0] ZNC_blue, ZNC_yellow,ZNC_green;

    // Decoder Ouput
    output wire[15:0] A_out, B_out;
    output wire [2:0] ZNC_out;

    // A register input
    assign A_out =      (sel == 2'b00)?(A_green):
                        (sel == 2'b01)?(A_blue):
                        (sel == 2'b10)?(A_blue):
                        (sel == 2'b11)?(A_yellow):(0);

    // B register Input
    assign B_out =      (sel == 2'b00)?(B_green):
                        (sel == 2'b01)?(B_blue):
                        (sel == 2'b10)?(B_blue):
                        (sel == 2'b11)?(B_yellow):(0);

    // ZNC register input
    assign ZNC_out =    (sel == 2'b00)?(ZNC_green):
                        (sel == 2'b01)?(ZNC_blue):
                        (sel == 2'b10)?(ZNC_blue):
                        (sel == 2'b11)?(ZNC_yellow):(0);
endmodule
    
// Red Circuit
module red(clk,opCode_out,BR);

    // Inputs & Outputs
    input clk;
    input BR;
    output [15:0]opCode_out;

    // Data Busses
    reg [15:0]PC_in;
    wire [15:0]PC_out, increment, opCode_in;
    
    // Registers
    reg16 opCode_reg(opCode_in,opCode_out,clk);
    PC_reg PC_reg(PC_in,PC_out,~clk);

    // Adder to increment program counter
    ADD ADD(PC_out,1,increment);

    // Read Only Instruction Memory
    ROM ROM(PC_out[7:0],opCode_in);

    // Initizliaze the value of PC_in
    initial
        PC_in <= 16'hFFFF;

    // Program counter decoder
    always@(PC_out,opCode_out,BR)
        if (BR == 1)
            PC_in = opCode_out;
        else
            PC_in = increment;
    
endmodule

// Read-Only Program Memory
module ROM(address, out);

    // I/O
    input [7:0]address;
    output reg [15:0]out;

    // Memory Block
    reg [15:0]memory[0:255];

    // Change output depending on address
    always @(address)
        out <= memory[address];

endmodule

// Program Counter Register
module PC_reg(D,Q,clk);

    //I/O
    input clk;
    input [15:0]D;
    output reg[15:0]Q;

    // Initialization of PC
    initial
        Q <= 16'hFFFF;

    // Update on clock
    always @(posedge clk) 
        Q <= D; 
endmodule

// Zero bit handler
module zero(regA,out);

    // I/O
    input [15:0]regA;
    output reg out;

    //Update the zero bit
    always @(regA)
        if(regA==0)
            out = 1;
        else
            out = 0;
endmodule

// Negative bit handler
module negative(A_in,out);

    // I/O
    input [15:0]A_in;
    output reg out;

    // Update the negative bit
    always @(A_in)
        if(A_in[15]==1)
            out = 1;
        else
            out = 0;
endmodule

// Carry bit handler
module carry(A_in,B_in,A_mid,out);

    // Inputs
    input [15:0]A_in,B_in,A_mid;

    // Temporary Array
    reg [2:0]temp;
    assign temp[2] = A_in[15];
    assign temp[1] = B_in[15];
    assign temp[0] = A_mid[15];

    // Output
    output reg out;

    // Update the the carry bit
    always @(temp)
        case(temp)
            0 : out = 0;
            1 : out = 0;
            2 : out = 0;
            3 : out = 1;
            4 : out = 0;
            5 : out = 1;
            6 : out = 1;
            7 : out = 1;
        endcase
endmodule

// Blue Circuit
module blue(opCode,A_in,B_in,A_out,B_out,ZNC_out,ZNC_in);

    // I/O
    input [15:0]A_in, B_in, opCode;
    output [15:0]A_out,B_out;

    // ZNC busses
    input [2:0] ZNC_in;
    output [2:0]ZNC_out;
    wire [2:0] ZNC_mid;

    // Instructions
    instruction instruction(A_in,B_in,opCode,A_out,B_out,ZNC_in,ZNC_mid,ZNC_out);

    // ZNC
    zero zero(A_out,ZNC_mid[2]);
    negative negative(A_out,ZNC_mid[1]);
    carry carry(A_in,B_in,A_out,ZNC_mid[0]);
endmodule

// Contains all the blue instructions
module instruction (A_in, B_in, opCode, A_out, B_out,ZNC_in,ZNC_mid,ZNC_out);

    // A & B registers
    input [15:0] A_in, B_in;
    output [15:0] A_out, B_out;

    // Intermediate busses
    wire [15:0] adda, suba, ora, anda, xora, shra, movb, excha, exchb;

    // ZNC registers
    input [2:0]ZNC_in,ZNC_mid;
    output [2:0]ZNC_out;

    // Isolate three select bits for the decoder
    input [15:0]opCode;
    wire [2:0] sel;
    INST M10(opCode,sel);

    // All instructions
    ADD ADD(A_in,B_in,adda);
    SUB SUB(A_in,B_in,suba);
    OR OR(A_in,B_in,ora);
    AND AND(A_in,B_in,anda);
    XOR XOR(A_in,B_in,xora);
    SHR SHR(A_in,shra);
    MOV MOV(A_in,movb);
    EXCH EXCH(A_in, B_in, excha, exchb);

    //Decode the Output
    DECO M9(A_in,B_in,adda,suba,ora,anda,xora,shra,movb,excha,exchb,sel,A_out,B_out,ZNC_in,ZNC_mid,ZNC_out);

endmodule

// And instruction
module ADD (A_in, B_in, A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// Addition
	assign A_out = A_in + B_in;	

endmodule

// SUB instruction
module SUB (A_in, B_in, A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// Subtraction
	assign A_out = A_in - B_in;
	
endmodule

// Bitwise OR
module OR (A_in,B_in,A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// OR operation
	assign A_out = A_in | B_in;

endmodule 

// Bitwise AND
module AND (A_in,B_in,A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// And operation
	assign A_out = A_in & B_in;
	
endmodule 

// Bitwise XOR
module XOR (A_in,B_in,A_out);

	// I/O
	input [15:0] A_in, B_in;
	output [15:0] A_out;

	// XOR operation
	assign A_out = A_in ^ B_in;
	
endmodule 

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

// MOV operatoin
module MOV (A_in, B_out);

    // I/O
    input [15:0] A_in;
    output [15:0] B_out;

    // Moves A to B
    assign B_out = A_in;
    
endmodule
    
// EXCH operation
module EXCH (A_in, B_in, A_out, B_out);

    // I/O
    input [15:0] A_in, B_in;
    output [15:0] A_out, B_out;

    // Exchanges A & B
    assign A_out = B_in;
    assign B_out = A_in;
    
endmodule
    
// Formats instruction
module INST (ins, sel);

    // I/O
    input [15:0] ins;
    output [2:0] sel;

    // Assignment
    assign sel [2] = ins [14];
    assign sel [1] = ins [13];
    assign sel [0] = ins [12];

endmodule

module DECO (A_in, B_in, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB, sel, A_out, B_out,ZNC_in,ZNC_mid,ZNC_out);

    //Inputs from instruction
    input [15:0] A_in, B_in, ADDA, SUBA, ORA, ANDA, XORA, SHRA, MOVB, EXCHA, EXCHB;

    // Select and outputs
    input [2:0] sel;
    output reg [15:0] A_out, B_out;

    // ZNC bits
    input [2:0]ZNC_in, ZNC_mid;
    output reg [2:0]ZNC_out;

    // Decoder
    always @ (A_in,B_in,sel)  begin

        case(sel)
            //ADD
            3'b100 : begin
                        A_out = ADDA;
                        B_out = B_in;
                        ZNC_out = ZNC_mid;
                    end
            //SUB
            3'b101 : begin
                        A_out = SUBA;
                        B_out = B_in;
                        ZNC_out = ZNC_mid;
                    end
            //OR
            3'b110 : begin
                        A_out = ORA;
                        B_out = B_in;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //AND
            3'b111 : begin
                        A_out = ANDA;
                        B_out = B_in;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //XOR
            3'b000 : begin
                        A_out = XORA;
                        B_out = B_in;
                        ZNC_out[2:1] = ZNC_mid[2:1];
                        ZNC_out[0] = 0;
                    end
            //SHR
            3'b001 : begin
                        A_out = SHRA;
                        B_out = B_in;
                        ZNC_out = ZNC_in;
                    end
            //MOV
            3'b010 : begin
                        A_out = A_in;
                        B_out = MOVB;
                        ZNC_out = ZNC_in;
                    end
            //EXCH
            3'b011 : begin
                        A_out = EXCHA;
                        B_out = EXCHB;
                        ZNC_out = ZNC_in;
                    end
        endcase
    end
endmodule

// Yellow Circuit
module yellow (A_in, B_in, opCode, ZNC_in, ZNC_out);

    // I/O
    input [15:0] A_in, B_in, opCode;
    input [2:0] ZNC_in;
    output [2:0] ZNC_out;

    // Busses
    wire [1:0] sel;
    wire [2:0] CMP_out,CLR_out,SET_out,ZNC_code;

    // Extract the instruction and ZNC from instruction
    INSTY INSTY(opCode,sel);
    EXT EXT(opCode,ZNC_code);

    // Instructions
    CMP CMP(A_in,B_in,CMP_out);
    SET SET(ZNC_in,ZNC_code,SET_out);
    CLR CLR(ZNC_in,ZNC_code,CLR_out);

    // Decoder
    DECOY DECOY(CMP_out,SET_out,CLR_out,sel,ZNC_out);

endmodule

// Compare Function
module CMP (A_in, B_in, ZNC_out);

    // I/O
    input [15:0]A_in, B_in;
    output [2:0]ZNC_out;

    // Subtraction for comparison
    wire [15:0]A_out;
    SUB SUB(A_in,B_in,A_out);

    // ZNC bit handlers
    zero zero(A_out,ZNC_out[2]);
    negative negative(A_out,ZNC_out[1]);
    carry carry(A_in,B_in,A_out,ZNC_out[0]);

endmodule

// CLR instruction
module CLR (ZNC_in, ZNC_code, ZNC_out);

    // I/O
    input [2:0] ZNC_in, ZNC_code;
    output [2:0] ZNC_out;

    // Assignments
    assign ZNC_out [2] = (ZNC_code[2])?(0):(ZNC_in [2]);
    assign ZNC_out [1] = (ZNC_code[1])?(0):(ZNC_in [1]);
    assign ZNC_out [0] = (ZNC_code[0])?(0):(ZNC_in [0]);

endmodule

// SET instruciton
module SET (ZNC_in, ZNC_code, ZNC_out);

    // I/O
    input [2:0] ZNC_in, ZNC_code;
    output [2:0] ZNC_out;

    // Assignments
    assign ZNC_out [2] = (ZNC_code[2])?(1):(ZNC_in [2]);
    assign ZNC_out [1] = (ZNC_code[1])?(1):(ZNC_in [1]);
    assign ZNC_out [0] = (ZNC_code[0])?(1):(ZNC_in [0]);

endmodule

// Formats instruction
module EXT (opCode, ZNC_code);

    // I/O
    input [15:0] opCode;
    output [2:0] ZNC_code;

    // Assignmet
    assign ZNC_code [2] = opCode [10];
    assign ZNC_code [1] = opCode [9];
    assign ZNC_code [0] = opCode [8];

endmodule

// Formats instruction
module INSTY (opCode, sel);

    // I/O
    input [15:0] opCode;
    output [1:0] sel;

    // Assignment
    assign sel [1] = opCode [13];
    assign sel [0] = opCode [12];

endmodule

// Decoder for yellow instruction
module DECOY (CMP,SET,CLR,sel,ZNC_out);

    // I/O
    input [2:0] CMP, SET, CLR;
    input [1:0] sel;
    output wire [2:0] ZNC_out;

    // Assignment
    assign ZNC_out = (sel == 2'b00)?(CMP):
        (sel == 2'b01)?(SET):
        (sel == 2'b10)?(CLR):(0);
endmodule

// Green Circuit
module green(clk,WE,opCode,A_in,B_in,ZNC_in,A_out,B_out,ZNC_out,BR_out);

    // Clock and write enable, & branch
    input clk, WE;
    wire BR_in;
    output BR_out;

    // I/O
    input [15:0]A_in,B_in,opCode;
    output [15:0]A_out,B_out;

    // ZNC
    input [2:0] ZNC_in;
    wire [2:0] ZNC_mid;
    output [2:0] ZNC_out;

    // Intermediate busses
    wire [15:0] A_inc,B_inc,LD_out;

    // RAM
    wire [15:0] ram_in,ram_out;
    wire [7:0] address;
    RAM RAM(address, ram_in, ram_out, ~clk, WE);

    // Instructions
    BR BR(opCode,ZNC_in,BR_in);
    INC INC(A_in, B_in, opCode, A_inc, B_inc);
    LD LD(ram_out,opCode,address,LD_out,A_in,B_in);
    ST ST(A_in,B_in,opCode,ram_in,address);

    // Decoder
    DECOG DECOG(A_in, B_in, A_inc, B_inc, LD_out, BR_in, opCode, A_out, B_out, WE, BR_out,ZNC_in,ZNC_mid,ZNC_out);

    // ZNC
    zero zero(A_out,ZNC_mid[2]);
    negative negative(A_out,ZNC_mid[1]);
    carry carry(A_in,B_in,A_out,ZNC_mid[0]);

endmodule

// Random Access Memoru
module RAM(address, in, out, clk, WE);

    // I/O
    input clk,WE;
    input [7:0]address;

    // Data I/O
    input [15:0]in;
    output reg [15:0]out;

    // Memory Block
    reg [15:0]memory[0:255];

    // Output assynchonously
    always@(address,clk)
        out = memory[address];

    // Input is clock triggered
    always @(posedge clk)
        if(WE)
            memory[address] <= in;
endmodule

// Load 
module LD (data, ins, address, out,A_in,B_in);

    // I/O
    input [15:0] data, ins, A_in,B_in;
    output [7:0] address;
    output reg[15:0] out;
    assign address = ins[7:0];

    // Loads the value depending on opCode
    always@(ins, A_in, B_in, data)
    begin
        if (~ins[11])
            out = A_in;
        else
            out = B_in;
        
        // Load from RAM
        if (~ins[10])
            out = data;
        else
            // Load intermediate
            if (~ins[9])
                out[7:0] = address;
            else
                out[15:8] = address;
    end
endmodule

//Store
module ST (A_in, B_in, opCode, data, address);

    // I/O
    input [15:0] A_in, B_in, opCode;
    output [15:0] data;
    output [7:0] address;

    // Assignment
    assign data = (opCode [11])?(B_in):(A_in);
    assign address = opCode [7:0];
endmodule

// INC instruction
module INC (A_in, B_in, opCode, A_out, B_out);

    // I/O
    input [15:0] A_in,B_in,opCode;
    output [15:0] A_out, B_out;

    // Increments
    assign A_out = A_in + opCode [7:0];
    assign B_out = B_in + opCode [7:0];

endmodule

// Branch instruction
module BR (opCode, ZNC, BR);

  // I/O
  input [15:0] opCode;
  input [2:0] ZNC;
  output reg BR;

  // Updates branch based off of ZNC
  always@(opCode,ZNC)
  begin
    BR = 0;

    if (~opCode[11])
    begin

      // Branch if zero
      if (opCode[10] && ZNC[2])
        BR = 1;

      // Branch if negative
      if (opCode[9] && ZNC[1])
        BR = 1;
      
      // Branch if carry
      if (opCode[8] && ZNC[0])
        BR = 1;

      // Branch always
      if (~opCode[10] && ~opCode[9] && ~opCode[8])
        BR = 1;
    end

    if (opCode[11])
    begin

      // Branch if not zero
      if (opCode[10] && ~ZNC[2])
        BR = 1;

      // Branch if not negative
      if (opCode[9] && ~ZNC[1])
        BR = 1;

      // Branch if not carry
      if (opCode[8] && ~ZNC[0])
        BR = 1;

      // Branch always
      if (opCode[10] && opCode[9] && opCode[8])
        BR = 1;
    end
    
  end

endmodule

// Decoder for green circuit
module DECOG (A_in, B_in, A_inc, B_inc, LD, BR_in, opCode, A_out, B_out, WE, BR_out,ZNC_in,ZNC_mid,ZNC_out);

    // I/O
    input [15:0] A_in, B_in, A_inc, B_inc, LD, opCode;
    input BR_in;
    output [15:0] A_out, B_out;
    output WE, BR_out;

    // ZNC
    input [2:0] ZNC_in,ZNC_mid;
    output [2:0] ZNC_out;

    // Intermediate Busses
    wire RBB;
    wire [3:0] OPC;
    assign RBB = opCode[11];
    assign OPC = opCode[15:12];

    //Store Data if true 
    assign WE = (OPC == 4'b0001)?(1):(0);
    
    // Branch if true
    assign BR_out = (OPC == 4'b0011)?(BR_in):(0);

    // Assigns the Output of the B register. If load B else if inc B.
    assign A_out = (OPC == 4'b0000)?((!RBB)?(LD):(A_in)):
                (OPC == 4'b0010)?((!RBB)?(A_inc):(A_in)):(A_in);

    // Assigns the Output of the B register. If load B else if inc B.
    assign B_out = (OPC == 4'b0000)?((RBB)?(LD):(B_in)):
                (OPC == 4'b0010)?((RBB)?(B_inc):(B_in)):(B_in);

    // Assigns the Output of the ZNC register.
    assign ZNC_out = (OPC == 4'b0010)?(ZNC_mid):(ZNC_in);

endmodule