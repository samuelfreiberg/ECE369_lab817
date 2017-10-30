`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 05:19:04 PM
// Design Name: 
// Module Name: EX_MEM_REG
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


module EX_MEM_REG(clk, RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc, Zero, ALUResult, WriteMemData, pc_plus_4, WriteReg, 
                    RegWrite_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, PCSrc_out, Zero_out, 
                    ALUResult_out, WriteMemData_out, pc_plus_4_out, WriteReg_out);
                    
        input clk;
        input RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc;
        input Zero;
        input [63:0] ALUResult;
        input [31:0] WriteMemData, pc_plus_4;
        input [4:0] WriteReg;
        
        output reg RegWrite_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, PCSrc_out;
        output reg Zero_out;
        output reg [63:0] ALUResult_out;
        output reg [31:0] WriteMemData_out, pc_plus_4_out;
        output reg [4:0] WriteReg_out;
        
//        reg PRegWrite, PBranch, PMemWrite, PMemRead, PMemToReg;
        
        initial begin
            RegWrite_out = 0;
            Branch_out = 0;
            MemWrite_out = 0;
            MemRead_out = 0;
            MemToReg_out = 0;        
            pc_plus_4_out = 0;
            Zero_out = 0;
            ALUResult_out = 0;
            WriteMemData_out = 0;
            WriteReg_out = 0;
            PCSrc_out = 0;
        end
        
//        always @(posedge clk)   begin
//        PRegWrite <= RegWrite;
//        PBranch <= Branch;
//        PMemWrite <= MemWrite;
//        PMemRead <= MemRead;
//        PMemToReg <= MemToReg;   
//        end
        
        always @(posedge clk)   begin
            pc_plus_4_out <= pc_plus_4;
            Zero_out <= Zero;
            ALUResult_out <= ALUResult;
            WriteMemData_out <= WriteMemData;
            WriteReg_out <= WriteReg;
            RegWrite_out <= RegWrite;
            Branch_out <= Branch;
            MemWrite_out <= MemWrite;
            MemRead_out <= MemRead;
            MemToReg_out <= MemToReg;
            PCSrc_out <= PCSrc;
        end       
        
endmodule
