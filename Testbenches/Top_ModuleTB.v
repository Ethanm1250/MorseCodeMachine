`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 04:34:55 PM
// Design Name: 
// Module Name: Top_ModuleTB
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


module Top_ModuleTB();
    
    reg clk;
    reg button;
    reg send;
    wire [7:0] letter;
    wire done;
    
    Top_Module DUT(.clk(clk), .button(button), .send(send), .letter(letter), .done(done));
    
    always #1 clk=~clk;
    
    initial begin
        clk = 0;
        button = 0;
        send = 0;
        
        #20 button = 1;  
        #20 button = 0;  //dash
        #20 button = 1;  
        #4 button = 0;  //dot
        #20 button = 1;  
        #20 button = 0; //dash
        #20 send = 1;
                 
        
    end

endmodule
