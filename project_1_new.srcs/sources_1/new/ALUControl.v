`timescale 1ns / 1ps

/* 
   Determines the functionaility of the ALU
   &
   Sets the enableHiLowUpdate control
*/


module ALUControl(funct, ALUOp, rBit6, rBit21, ALUControl, HiLowUpdate, ALUSrc2);

    input [5:0] funct;
    input [3:0] ALUOp;
    input rBit6, rBit21;
    output reg [3:0] ALUControl;
    output reg HiLowUpdate, ALUSrc2;
    
    initial begin
        ALUControl <= 0;
    end    
    
    always @(ALUOp or funct) begin
        
        if(ALUOp == 4'b0000)    begin    //R-Format. Check function field
            if(funct == 6'b100000)  begin      //add
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0000;
                end
            else if(funct == 6'b100001) begin //addu
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0000;
                end
            else if(funct == 6'b100010) begin //sub
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0001;
                end
            else if(funct == 6'b011000) begin //mult
                HiLowUpdate <= 1;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0010;
                end
            else if(funct == 6'b011001) begin //multu
                HiLowUpdate <= 1;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1111;
                end
            else if(funct == 6'b100100) begin //and
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0011;
                end
            else if(funct == 6'b100101) begin //or
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0100;
                end
            else if(funct == 6'b100111) begin //nor
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0101;
                end
            else if(funct == 6'b100110) begin //xor
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0110;
                end
            else if(funct == 6'b000000) begin //sll
                HiLowUpdate <= 0;
                ALUSrc2 <= 1;
                ALUControl <= 4'b0111;
                end
            else if(funct == 6'b000010) begin //srl or rotr
                HiLowUpdate <= 0;
                if(rBit21 == 0) begin
                    ALUControl <= 4'b1000;   //srl
                    ALUSrc2 <= 1;   end
                else    begin
                    ALUControl <= 4'b1100;   //rotr
                    ALUSrc2 <= 0;   end
                end    
            else if(funct == 6'b000100) begin //sllv
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0111;
                end
            else if(funct == 6'b000110) begin //srlv or rotrv
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                if(rBit6 == 0) 
                    ALUControl <= 4'b1000;   //srlv
                else
                    ALUControl <= 4'b1100;   //rotrv 
                end    
            else if(funct == 6'b101010) begin //slt
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1001;
                end
            else if(funct == 6'b001011) begin //movn
                HiLowUpdate <= 0;
                ALUControl <= 4'b1010; 
                end
            else if(funct == 6'b001010) begin //movz
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1011;
                end
            else if(funct == 6'b000011) begin //sra 
                HiLowUpdate <= 0;
                ALUSrc2 <= 1;
                ALUControl <= 4'b1000;
                end
            else if(funct == 6'b000111) begin //srav
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1000; 
                end                                                
            else if(funct == 6'b101011) begin //sltu
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1001;     
                end   
//            else if(funct == 6'b000000) begin   //nop
//                HiLowUpdate <= 0;
//                ALUSrc2 <= 0;
//                ALUControl <= 4'b0000;
//            end              
            end                      
        else if(ALUOp == 1) begin //addiu or addi
            HiLowUpdate <= 0;
            ALUSrc2 <= 0;
            ALUControl <= 4'b0000;
            end
        else if(ALUOp == 2) begin //mul or madd or msub
            if(funct == 6'b000010)  begin   //mul
                HiLowUpdate <= 0;
                ALUSrc2 <= 0;
                ALUControl <= 4'b0010;
                end
            else if(funct == 6'b000000) begin   //madd
                HiLowUpdate <= 1;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1101;
                end
            else if(funct == 6'b000100) begin   //msub
                HiLowUpdate <= 1;
                ALUSrc2 <= 0;
                ALUControl <= 4'b1110;
                end    
            end
        else if(ALUOp == 3) begin //andi
            HiLowUpdate <= 0;
            ALUSrc2 <= 0;
            ALUControl <= 4'b0011;
            end
        else if(ALUOp == 4) begin //ori
            HiLowUpdate <= 0;
            ALUSrc2 <= 0;
            ALUControl <= 4'b0100;
            end
        else if(ALUOp == 5) begin //xori 
            HiLowUpdate <= 0;              
            ALUSrc2 <= 0;
            ALUControl <= 4'b0110;
            end
        else if(ALUOp == 6) begin //slt or slti
            HiLowUpdate <= 0;
            ALUSrc2 <= 0;
            ALUControl <= 4'b1001;
            end                            
    end  
endmodule
