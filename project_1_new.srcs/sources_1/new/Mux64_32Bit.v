`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2017 12:07:42 AM
// Design Name: 
// Module Name: Mux64_32Bit
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


module Mux64_32Bit(out, inA, inB, sel);
    
    output reg [31:0] out;
    input [31:0] inA;
    input [63:0] inB;
    input sel;
    
    initial begin   
        out <= 0;
    end    
    
    always @(inA or inB or sel) begin
        if(sel == 0)
            out = inA;
        else
            out = inB[31:0];
     end           

endmodule
