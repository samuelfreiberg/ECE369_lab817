`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2017 01:59:05 PM
// Design Name: 
// Module Name: Adder
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


module Adder(pc_plus4, shiftleft, out);

    input [31:0] pc_plus4, shiftleft;
    output reg [31:0] out;
    
    initial begin
        out <= 0;
    end    
    
    always @(pc_plus4 or shiftleft) begin
        out <= pc_plus4 + shiftleft;
    end    

endmodule
