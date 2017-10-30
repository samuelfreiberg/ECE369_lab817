`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: 4-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU behaviorally, so that it supports addition,  subtraction,
// AND, OR, and set on less than (SLT). The 'ALUResult' will output the 
// corresponding result of the operation based on the 32-Bit inputs, 'A', and 
// 'B'. The 'Zero' flag is high when 'ALUResult' is '0'. The 'ALUControl' signal 
// should determine the function of the ALU based on the table below:-
// Op   | 'ALUControl' value
// ==========================
// ADD  | 0010
// SUB  | 0110
// AND  | 0000
// OR   | 0001
// SLT  | 0111
//
// NOTE:-
// SLT (i.e., set on less than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU64Bit(ALUControl, A, B, regHiLow, ALUResult, Zero, clk);

	input [3:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs
	input [63:0] regHiLow;

	output reg [63:0] ALUResult;
	output reg Zero;	    // Zero=1 if ALUResult == 0
	input clk;
	reg [63:0] temp;
	
	initial begin
	   ALUResult <= 0;
	end   

    /* Please fill in the implementation here... */
    
    //always @(posedge clk or negedge clk)   begin
    always @(A or B or ALUControl)
    begin
    case (ALUControl)
    4'b0000: ALUResult = A + B;     //Adding 2 32 bit inpus = 64 bit output?
    4'b0001: ALUResult = A - B;
    4'b0010: ALUResult = $signed(A * B);
    4'b0011: ALUResult = A & B;
    4'b0100: ALUResult = A | B;
    4'b0101: ALUResult = ~(A | B);
    4'b0110: ALUResult = A ^ B;
    4'b0111: ALUResult = B << A;
    4'b1000: ALUResult =  B >> A;
    4'b1001:    begin 
                if (A < B) ALUResult = 1;  //If A < B, ALUResult = 14
                else ALUResult = 0;
                end
    4'b1010: if(B != 1) ALUResult = A;        //ALUResult = (B != 0) ? A: 64'h00000000; //If B != 0, ALUResult = A
    4'b1011: if(B == 0) ALUResult = A;       //(B == 0) ? A: 64'h00000000; 
    4'b1100: ALUResult = (A >> B) | (A << (32-B));
    4'b1101: begin
                temp = regHiLow + $signed(A*B);
                ALUResult[31:0] = temp[31:0];
                ALUResult[63:32] = temp[63:32];
             end
    4'b1110: begin
                temp = regHiLow - $signed(A*B);
                ALUResult[31:0] = temp[31:0];
                ALUResult[63:32] = temp[63:32];
             end
    4'b1111: ALUResult = A * B;                
    endcase  
    
    if(ALUResult == 0)
        Zero = 1;
    else
        Zero = 0;             
     
    end     
   
endmodule

