`timescale 1ns / 1ps


/*
    Sets control signals based on OPCode
*/


module Controller(opCode, PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt, ALUOp);

    input [5:0] opCode;
    output reg PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt;
    output reg [3:0] ALUOp;
    
    initial begin
       PCSrc <= 0;
       RegWrite <= 0;
       RegDst <= 0;
       ALUSrc <= 0;
       Branch <= 0; 
       MemWrite<= 0; 
       MemRead<= 0; 
       MemToReg<= 0; 
       zeroExt<= 0;
     end   

    always @(opCode)    begin
        
    case(opCode)
        6'b000000:  begin   //R-Format
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        //HiLowWrite <= 0;
        zeroExt <= 0;
        ALUOp <= 4'b0000;
        end
    6'b001001: begin    //addiu
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 0;
        //HiLowWrite <= 0;
        ALUOp <= 4'b0001;
        end             
    6'b001000: begin    //addi
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 0;
        //HiLowWrite <= 0;
        ALUOp <= 4'b0001;
        end
    6'b011100: begin    //mul or madd or msub
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 0;
        //HiLowWrite <= 0;
        ALUOp <= 4'b0010;    
        end
    6'b001100: begin    //andi
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 1;
        //HiLowWrite <= 0;
        ALUOp <= 4'b0011;    
        end
    6'b001101: begin    //ori
       PCSrc <= 0;
       RegWrite <= 1;
       RegDst <= 0;
       ALUSrc <= 1;
       Branch <= 0;
       MemWrite <= 0;
       MemRead <= 0;
       MemToReg <= 1; //Don't care?
       zeroExt <= 1;
       //HiLowWrite <= 0;
       ALUOp <= 4'b0100;    
       end 
    6'b001110: begin    //xori
       PCSrc <= 0;
       RegWrite <= 1;
       RegDst <= 0;
       ALUSrc <= 1;
       Branch <= 0;
       MemWrite <= 0;
       MemRead <= 0;
       MemToReg <= 1; //Don't care?
       zeroExt <= 1;
       //HiLowWrite <= 0;
       ALUOp <= 4'b0101;    
       end
    6'b011111: begin    //seh or seb
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 0;
        //HiLowWrite <= 0;
        //ALUOp <= 4'b0011;    //dont care
        end   
    6'b001010:  begin   //slti
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 0;
        //HiLowWrite <= 0;
        ALUOp <= 4'b0110;    
        end   
    6'b001011:  begin   //sltiu
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; //Don't care?
        zeroExt <= 0;
        //HiLowWrite <= 0;
        ALUOp <= 4'b0110;    
        end
        endcase    
    end


endmodule
