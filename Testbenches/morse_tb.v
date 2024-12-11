`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 10:35:42 PM
// Design Name: 
// Module Name: morse_tb
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


module morse_tb();
 reg [1:0] inputSignal; // dot, dash, or space
  reg reset;
  reg clk;
  wire [7:0] letter0;
  wire [7:0] letter1;
  wire [7:0] letter2;
  wire [7:0] letter3;
  wire [7:0] letter4;
  wire [7:0] letter5;
  wire [7:0] letter6;
  wire [7:0] letter7;
  wire [7:0] letter8;
  wire [7:0] letter9;
  wire done;


 morseFSM mm(.inputSignal(inputSignal), .reset(reset), .clk(clk), .letter0(letter0), .letter1(letter1), .letter2(letter2), .letter3(letter3), .letter4(letter4), .letter5(letter5), .letter6(letter6), .letter7(letter7), .letter8(letter8), .letter9(letter9), .done(done));

    always #10 clk = ~clk;
    
    initial begin
    
            clk = 0;
        inputSignal = 2'b00;
        reset = 0;
        
        #20 inputSignal = 2'b01;  
        #20 inputSignal = 2'b10;  //dash
        #20 inputSignal = 2'b11; 
        #20 inputSignal = 2'b01;  
        #20 inputSignal = 2'b01;  //dash
        #20 inputSignal = 2'b01;  
        #20 inputSignal = 2'b11;  
        #20 inputSignal = 2'b10;  //dash
        #20 inputSignal = 2'b11; 
        #20 reset = 1; 
    
     
    
    
end


endmodule
