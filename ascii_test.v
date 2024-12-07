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
    input [7:0] letter0, 
    input [7:0] letter1,
    input  [7:0] letter2,
    input  [7:0] letter3,
    input [7:0] letter4,
    input [7:0] letter5,
    input [7:0] letter6,
    input [7:0] letter7,
    input [7:0] letter8,
    input [7:0] letter9,
    input [9:0] x, y,
    output reg [11:0] rgb
    );
    
    // signal declarations
    reg [10:0] rom_addr;           // 11-bit text ROM address
    wire [6:0] ascii_char;          // 7-bit ASCII character code
    wire [3:0] char_row;            // 4-bit row of ASCII character
    wire [2:0] bit_addr;            // column number of ROM data
    wire [7:0] rom_data;            // 8-bit row data from text ROM
    wire ascii_bit, ascii_bit_on;     // ROM bit and status signal
    
    reg [7:0] letters [9:0];
  
  always @(*) begin
  letters[0] = letter0;
  letters[1] = letter1;
  letters[2] = letter2;
  letters[3] = letter3;
  letters[4] = letter4;
  letters[5] = letter5;
  letters[6] = letter6;
  letters[7] = letter7;
  letters[8] = letter8;
  letters[9] = letter9;
  end
    // instantiate ASCII ROM
    ascii_rom rom(.clk(clk), .addr(rom_addr), .data(rom_data));
      
    // ASCII ROM interface
    always @(ascii_char) begin
        rom_addr = {ascii_char, char_row};   // ROM address is ascii code + row
    end
    assign ascii_bit = rom_data[~bit_addr];     // reverse bit order

    assign ascii_char =  ((x >= 200 && x < 208) ? letters[0] : 
                         (x >= 208 && x < 216) ? letters [1] : 
                         (x >= 216 && x < 224) ? letters[2] :
                         (x >= 224 && x < 232) ? letters[3] :
                         (x >= 232 && x < 240) ? letters[4] :
                         (x >= 240 && x < 248) ? letters[5] :
                         (x >= 248 && x < 256) ? letters[6] :
                         (x >= 256 && x < 264) ? letters[7] :
                         (x >= 264 && x < 272) ? letters[8] :
                         (x >= 272 && x < 280) ? letters[9] : 7'b0000000);
                            
    
    
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