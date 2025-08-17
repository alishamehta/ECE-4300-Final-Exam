`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: register
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

    //register: The register file REG
    //, which has 32 general purpose registers, and has 
    //input the rs and rt fields of IF ID instr, MEM WB Writereg,
    // MEM WB Writedata, and RegWrite (for the time being it can be from anywhere).
    // Outputs are the contents of register rs and register rt. 

module register(
        input clk,rst,regwrite,
        input [4:0] rs,
        input [4:0] rt,
        input [4:0] rd,
        input [31:0] writedata,
        output [31:0] A_readdat1,
        output [31:0] B_readdat2
    );
     reg [31:0] regs [0:31];
    
    integer i;
    initial 
    begin
        for (i = 0; i < 32; i = i + 1)
            regs[i] = 0;
    end
    
    assign A_readdat1 = regs[rs];  
    assign B_readdat2 = regs[rt];  
  
    always @(posedge clk) 
    begin
        if (regwrite && rd != 0) 
        begin
            regs[rd] <= writedata;
        end
    end 
    
endmodule
