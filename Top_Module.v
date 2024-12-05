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
    //morseDecoder2 DEC(.clk(clk), .dotOrDash(dotOrDash), .inputSignal(inputSignal));
    morseFSM FSM(.inputSignal(dotOrDash), .clk(clk), .letter(letter), .done(done));
    
endmodule 