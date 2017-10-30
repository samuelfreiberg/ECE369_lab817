`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 05:35:38 PM
// Design Name: 
// Module Name: MEM_WB_REG
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


module MEM_WB_REG(clk, RegWrite, MemToReg, MemData, ALUResult, WriteReg, RegWrite_out, 
                    MemToReg_out, MemData_out, ALUResult_out, WriteReg_out);

    input clk, RegWrite, MemToReg;

    input [31:0] MemData;
    input [63:0] ALUResult;
    input [4:0] WriteReg;
    
    output reg RegWrite_out, MemToReg_out;
    output reg [31:0] MemData_out;
    output reg [63:0] ALUResult_out;
    output reg [4:0] WriteReg_out;
    
//    reg PRegWrite, PMemToReg;
    
    initial begin
        RegWrite_out = 0;
        MemToReg_out = 0;
        MemData_out = 0;
        ALUResult_out = 0;
        WriteReg_out = 0;
    end
    
//    always @(posedge clk)   begin
//        PRegWrite <= RegWrite;
//        PMemToReg <= MemToReg;
//    end    
    
    
    always @(posedge clk)   begin
        MemData_out <= MemData;
        ALUResult_out <= ALUResult;
        WriteReg_out <= WriteReg;
        RegWrite_out <= RegWrite;
        MemToReg_out <= MemToReg;
    end       
endmodule