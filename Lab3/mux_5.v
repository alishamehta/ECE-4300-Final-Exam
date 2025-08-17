`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:24:02 PM
// Design Name: 
// Module Name: mux_5
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


module mux_5(
           input [4:0] a, b,
	       input  wire sel,
	       output reg [4:0] y  
	       );

   always @(a, b, sel)
     begin
	if (sel)
	  y = a;
	else
	  y = b;
     end
endmodule
