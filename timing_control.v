`timescale 1ns / 1ps

module timing_control (
    input clk,            
    input button,
    input send,      
    output reg [1:0] dotOrDash //wait = 00, dot = 01, dash = 10, send = 11     
);

    reg [15:0] press_counter = 0;
    reg prev_button = 0;

    parameter DOT_THRESHOLD = 5;  
    parameter  DASH_THRESHOLD = 15; 

    always @(posedge clk) begin
        if (button) begin
            press_counter <= press_counter + 1; 
        end else if (prev_button) begin
            // button released
            if (press_counter < DOT_THRESHOLD) begin
                dotOrDash <= 2'b01;
            end else if (press_counter > DASH_THRESHOLD) begin
                dotOrDash <= 2'b10;
            end 
            press_counter <= 0;
        end else if (send) begin 
            dotOrDash <= 2'b11;
        end else begin 
                dotOrDash <= 2'b00;    
        end 
        
        prev_button <= button; 
    end

endmodule
