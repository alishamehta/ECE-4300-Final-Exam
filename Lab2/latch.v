`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: latch
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


module latch(
       input clk,rst,
       input [1:0] ctl_wb,
       input [2:0]ctl_mem,
       input [3:0]ctl_ex,
       input [31:0] npc,
       input [31:0] readdat1,
       input [31:0] readdat2,
       input [31:0] sign_ext,
       input [4:0] instr_bits_20_16,
       input [4:0] instr_bits_15_11,                                     
        output reg [1:0] wb_out,
        output reg [2:0] mem_out,
        output reg [3:0] ctl_out,
        output reg [31:0] npc_out,
        output reg [31:0]readdat1_out,
        output reg [31:0]readdat2_out,
        output reg [31:0] sign_ext_out,
        output reg [4:0]instr_bits_20_16_out,
        output reg [4:0]instr_bits_15_11_out
    );
    
    always @(posedge clk or rst) 
    begin
             wb_out <= ctl_wb;
             mem_out <=  ctl_mem;
             ctl_out   <=  ctl_ex;
             npc_out <=  npc;
             readdat1_out <=  readdat1;
             readdat2_out <=  readdat2;
             sign_ext_out <=  sign_ext;
             instr_bits_20_16_out <=  instr_bits_20_16;
             instr_bits_15_11_out <=  instr_bits_15_11; 
    end 
    
    
endmodule
