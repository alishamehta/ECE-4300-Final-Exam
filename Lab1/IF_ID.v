`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 11:02:21 PM
// Design Name: 
// Module Name: Ex
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


module IF_ID(
    input clk,
    input reset,
    input [31:0] npc, instr,
    output reg [31:0] instrout, npcout 
    );
    
    //initialize output vars
    initial
        begin 
            instrout = 32'b0;
            npcout = 32'b0;
        end
        
     always@(posedge clk or posedge reset)
        if(reset)
            begin
               npcout <= 32'b0;         
               instrout <= 32'b0;
            end
        else
            begin
               npcout <= npc;         
               instrout <= instr;
            end
    /* always@(posedge clk or posedge reset)
        begin
	       npcout <= npc;         
	       instrout <= instr;
        end
    */
endmodule
