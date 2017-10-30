`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 04:25:13 PM
// Design Name: 
// Module Name: ID_EX_REG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ID_EX_REG(clk, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, ALUOp, PCSrc,
                 Data1, Data2, ShiftAmount, Immediate, pc_plus_4, Bit6, Funct, Bit21, RegRt, RegRd, 
                 RegWrite_out, RegDst_out, ALUSrc_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, ALUOp_out, PCSrc_out,
                Data1_out, Data2_out, ShiftAmount_out, Immediate_out, pc_plus_4_out, Bit6_out, 
                Funct_out, Bit21_out, RegRt_out, RegRd_out);
                
      
      input clk;
      input RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg;
      input [3:0] ALUOp;
      input PCSrc;
      input [31:0] Data1, Data2, ShiftAmount, Immediate, pc_plus_4;
      input Bit6;
      input [5:0] Funct;
      input Bit21;
      input [4:0] RegRt, RegRd;
      
      output reg RegWrite_out, RegDst_out, ALUSrc_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out;
      output reg [3:0] ALUOp_out;
      output reg PCSrc_out;
      output reg [31:0] Data1_out, Data2_out, ShiftAmount_out, Immediate_out, pc_plus_4_out;
      output reg Bit6_out;
      output reg [5:0] Funct_out;
      output reg Bit21_out;
      output reg [4:0] RegRt_out, RegRd_out;
      
//      reg PRegWrite, PRegDst, PALUSrc, PBranch, PMemWrite, PMemRead, PMemToReg, PzeroExt;   
//      reg [3:0] PALUOp;
      
      initial begin
        RegWrite_out = 0;
        RegDst_out = 0;
        ALUSrc_out = 0;
        Branch_out = 0;
        MemWrite_out = 0;
        MemRead_out = 0;
        MemToReg_out = 0;
        ALUOp_out = 0;
        pc_plus_4_out = 0;
        Data1_out = 0;
        Data2_out = 0;
        ShiftAmount_out = 0;
        Immediate_out = 0;
        Bit6_out = 0;
        Funct_out = 0;
        Bit21_out = 0;
        RegRt_out = 0;
        RegRd_out = 0;
        PCSrc_out = 0;
       end
       
//       always @(posedge clk)    begin
//        PRegWrite <= RegWrite;
//        PRegDst <= RegDst;
//        PALUSrc <= ALUSrc;
//        PBranch <= Branch;
//        PMemWrite <= MemWrite;
//        PMemRead <= MemRead;
//        PMemToReg <= MemToReg;
//        PALUOp <= ALUOp;
//       end 
       
       always @(posedge clk)    begin
        RegWrite_out <= RegWrite;
        RegDst_out <= RegDst;
        ALUSrc_out <= ALUSrc;
        Branch_out <= Branch;
        MemWrite_out <= MemWrite;
        MemRead_out <= MemRead;
        MemToReg_out <= MemToReg;
        ALUOp_out <= ALUOp;
        pc_plus_4_out <= pc_plus_4;
        Data1_out <= Data1;
        Data2_out <= Data2;
        ShiftAmount_out <= ShiftAmount;
        Immediate_out <= Immediate;
        Bit6_out <= Bit6;
        Funct_out <= Funct;
        Bit21_out <= Bit21;
        RegRt_out <= RegRt;
        RegRd_out <= RegRd; 
        PCSrc_out <= PCSrc;
       end                
endmodule
