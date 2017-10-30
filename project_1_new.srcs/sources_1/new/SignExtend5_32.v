`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2017 04:14:09 PM
// Design Name: 
// Module Name: SignExtend5_32
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


module SignExtend5_32(in, out);

    /* A 16-Bit input word */
    input [4:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    
    always @(in) begin
        out = in;
    end

endmodule
