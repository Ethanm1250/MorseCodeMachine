`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 02:03:34 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
	input clk,
	input reset,
	output reg divided_clock
    );
	 
	 
parameter toggle_value = 4999999; // TODO: Calculate correct value

	 
reg[32:0] cnt;

always@(posedge clk or posedge reset)
begin
	if (reset==1) begin
		cnt <= 0;
		divided_clock <= 0;
	end
	else begin
		if (cnt==toggle_value) begin
			cnt <= 0;
			divided_clock <= ~divided_clock;
		end
		else begin
			cnt <= cnt +1;
			divided_clock <= divided_clock;		
		end
	end

end


endmodule
