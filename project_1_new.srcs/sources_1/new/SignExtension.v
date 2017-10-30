`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, out, zeroExt);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    
    input zeroExt;
    
    always @(in, zeroExt) begin
    
    if(zeroExt == 1)    begin
        out <= {{16'b0},in};
    end    
    else begin
        out <= {{16{in[15]}}, in};
    end    
    end
    
endmodule
