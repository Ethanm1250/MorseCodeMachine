`timescale 1ns / 1ps
// Reference book: "FPGA Prototyping by Verilog Examples"
//                    "Xilinx Spartan-3 Version"
// Authored by: Pong P. Chu
// Published by: Wiley, 2008
// Adapted for use on Basys 3 FPGA with Xilinx Artix-7
// by: David J. Marion aka FPGA Dude

module ascii_test(
    input clk,
    input video_on,
    input [7:0] letter,
    input [9:0] x, y,
    input send,
    output reg [11:0] rgb
    );
    
    // signal declarations
    reg [10:0] rom_addr;           // 11-bit text ROM address
    wire [6:0] ascii_char;          // 7-bit ASCII character code
    reg [10:0] counter = 0;
    wire [3:0] char_row;            // 4-bit row of ASCII character
    wire [2:0] bit_addr;            // column number of ROM data
    wire [7:0] rom_data;            // 8-bit row data from text ROM
    wire ascii_bit, ascii_bit_on;     // ROM bit and status signal
    
    wire done; // DELETE LATER
    
    
    // instantiate ASCII ROM
    ascii_rom rom(.clk(clk), .addr(rom_addr), .data(rom_data));
      
    // ASCII ROM interface
    always @(ascii_char) begin
        rom_addr = {ascii_char, char_row};   // ROM address is ascii code + row
    end
    assign ascii_bit = rom_data[~bit_addr];     // reverse bit order

    //morseFSM fsm(.inputSignal(morse_signal), .clk(clk), .letter(letter), .done(done));
    always @(*)
    begin
    if (send) begin
   //if (counter < 248) begin
     ascii_char =    // 7-bit ascii code
        ((x >= 200 && x < 208) ? letter : 7'b0000000);
    end
    end
    
    assign char_row = y[3:0];               // row number of ascii character rom
    assign bit_addr = x[2:0];               // column number of ascii character rom
    // "on" region in center of screen
    assign ascii_bit_on = ((x >= 192 && x < 448) && (y >= 224 && y < 240)) ? ascii_bit : 1'b0;
    
    // rgb multiplexing circuit
    always @*
        if(~video_on)
            rgb = 12'h000;      // blank
        else
            if(ascii_bit_on)
                rgb = 12'h00F;  // blue letters
            else
                rgb = 12'hFFF;  // white background
   
endmodule
