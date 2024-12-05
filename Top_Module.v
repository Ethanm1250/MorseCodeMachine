`timescale 1ns / 1ps


module Top_Module ( 
  input clk, // 0 for dot, 1 for dash
  input button,
  input send,
  output [7:0] letter, 
  output done 
);
    
    wire [1:0] dotOrDash;
    
    timing_control TIM(.clk(clk), .button(button), .send(send), .dotOrDash(dotOrDash));
    morseFSM FSM(.inputSignal(dotOrDash), .clk(clk), .letter(letter), .done(done));
    
endmodule 
