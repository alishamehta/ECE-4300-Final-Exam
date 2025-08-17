`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 11:23:37 PM
// Design Name: 
// Module Name: INCR
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
module INCR(
    input wire [31:0] in0,
    //input [3:0] inc,
	output wire [31:0] out  
	);
    //increaments by 1
   // always@ (in0)
     //begin
    assign out = in0 + 32'd1;
     //end
endmodule

