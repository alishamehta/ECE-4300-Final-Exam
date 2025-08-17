`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 11:28:11 PM
// Design Name: 
// Module Name: I_FETCH
// Project Name: 
// Target Devices: 
// Tool Versions: 

// Description: 
// Code for lab 1 (.v) files:
//latch - the IF/ID Pipirline register (latch)
//memory - done
//pc - done 
//mux - done 
//adder or incrementer -done 
//final IF stage

// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module I_FETCH(
    input clk,
    input reset,
    output wire [31:0] IF_ID_instr,
    output wire [31:0] IF_ID_npc,
    input wire EX_MEM_PCSrc,
    input wire [31:0] EX_MEM_NPC
    );
    //signals 
    wire [31:0]PC,
    dataout,
    npcout,
    npc_mux;
    
    //isntantiations 
   MUX mux1(
            .in0(EX_MEM_NPC),
            .in1(npcout),
	       .sel(EX_MEM_PCSrc),
	       .out(npc_mux)  
   );
   
   pc_counter pc_counter1(
           .clk(clk), 
           .reset(reset),
            .npc(npc_mux),
            .PC(PC)
   );
   
   memory memory1(
              .addr(PC),
              .data(dataout)
   );
   
   IF_ID if_id1(
           .clk(clk),
           .reset(reset),
           .npc(npcout),   
           .instr(dataout),
           .instrout(IF_ID_instr), 
           .npcout(IF_ID_npc) 
   );
   
   INCR inc(
     .in0(PC),
	.out(npcout)  
   );
endmodule
