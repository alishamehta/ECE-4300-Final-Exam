`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 11:09:44 PM
// Design Name: 
// Module Name: pc_counter
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


module pc_counter(
    //
    input clk,reset, 
    input [31:0] npc,
    output reg [31:0] PC
    );       
    initial
    begin 
         PC = 32'b0;
    end
    
    always@(posedge clk or posedge reset)
    if(reset)
        begin
            PC <= 32'b0;
        end
     else
        begin
            PC <= npc;
        end
endmodule
