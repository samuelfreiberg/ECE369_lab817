`timescale 1ns / 1ps


module PCAdder(PCResult, PCAddResult, clk, rst);

    input   [31:0]  PCResult;
    output reg [31:0] PCAddResult;
    input clk, rst;

    initial begin
        PCAddResult <= 0;
    end    

    //always @(posedge clk)
    always @(PCResult)
    begin
    	PCAddResult <= PCResult + 4;
    end       
    
endmodule
