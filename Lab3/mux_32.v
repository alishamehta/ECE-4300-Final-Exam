`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:26:05 PM
// Design Name: 
// Module Name: mux_32
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


module mux_32(
           input [31:0] a, b,
	       input  wire sel,
	       output reg [31:0] y  
	       );

   always @(a, b, sel)
     begin
        if (sel)
          y = a;
        else
          y = b;
     end
endmodule
