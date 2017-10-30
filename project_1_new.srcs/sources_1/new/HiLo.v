`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2017 03:47:26 PM
// Design Name: 
// Module Name: HiLo
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


    module HiLo(ALUOutput, enableHiLoUpdate, HiLowOutput, low_out, high_out);
    
    input [63:0] ALUOutput;
    input enableHiLoUpdate;
    output reg [63:0] HiLowOutput;
    output reg [31:0] low_out, high_out;

       
    initial begin
        HiLowOutput <= 0;
        low_out <= 0;
        high_out <= 0;
    end    
    
    always @(ALUOutput or enableHiLoUpdate)
    begin
        #5;
        if(enableHiLoUpdate == 1) begin
            low_out = ALUOutput[31:0];
            high_out = ALUOutput[63:32];
            //HiLowOutput = $signed(high_out + low_out);
            HiLowOutput[31:0] = low_out;
            HiLowOutput[63:32] = high_out;
        end
    
    end
    

endmodule
