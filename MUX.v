`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 11:05:37 PM
// Design Name: 
// Module Name: MUX
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
module MUX(
  	       input [31:0] in0, in1,
	       input  wire sel,
	       output reg [31:0] out  
	       );

   always @(in0, in1, sel)
     begin
	if (sel)
	  out = in0;
	else
	  out = in1;
     end
   
endmodule 
