`timescale 1ns / 1ps


// Percent: Samuel Freiberg - 50%
//          Su Lim - 50%


module TopMod_tb();

    reg clk;
    reg rst;
    wire [31:0] finalData;
    wire [31:0] lowRegister, highRegister, ProgramCounter;
 
    
    TopMod u0( 
              .clk(clk),
              .rst(rst),
              .finalData(finalData),
              .lowRegister(lowRegister),
              .highRegister(highRegister),
              .ProgramCounter(ProgramCounter)
              );
    
               
  initial begin
            clk <= 1'b0;
            forever #10 clk = ~clk;
    end     
    
    initial begin
        rst <= 1;
        
        #20; 
        
        rst <= 0;
        
        end                                 
            
endmodule
