`timescale 1ns / 1ps

module top(
    input clk,          // 100MHz on Basys 3
    input button,
    input send,
    input reset,        // btnC on Basys 3
    output hsync,       // to VGA connector
    output vsync,       // to VGA connector
    output [11:0] rgb   // to DAC, to VGA connector
    );
    
    // signals
    wire divided_clock;
    wire [1:0] dotOrDash;
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
    wire [9:0] w_x, w_y;
    wire w_video_on, w_p_tick;
    reg [11:0] rgb_reg;
    wire [11:0] rgb_next;
    
    clk_divider CLCOK(.clk(clk), .reset(reset), .divided_clock(divided_clock));
    
    timing_control TIM(.clk(divided_clock), .button(button), .send(send), .dotOrDash(dotOrDash));
    
    
    morseFSM FSM(.inputSignal(dotOrDash), .reset(reset), .clk(divided_clock), .letter0(letter0), .letter1(letter1), .letter2(letter2), .letter3(letter3), .letter4(letter4), .letter5(letter5), .letter6(letter6), .letter7(letter7), .letter8(letter8), .letter9(letter9), .done(done));
    
    // VGA Controller
    vga_controller vga(.clk_100MHz(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                       .video_on(w_video_on), .p_tick(w_p_tick), .x(w_x), .y(w_y));
    // Text Generation Circuit
    ascii_test at(.clk(clk), .video_on(w_video_on),.letter0(letter0), .letter1(letter1), .letter2(letter2), .letter3(letter3), .letter4(letter4), .letter5(letter5), .letter6(letter6), .letter7(letter7), .letter8(letter8), .letter9(letter9), .x(w_x), .y(w_y), .rgb(rgb_next));
    
    // rgb buffer
    always @(posedge clk)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    // output
    assign rgb = rgb_reg;
      
endmodule