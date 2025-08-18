`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 01:37:17 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
        input clk, 
        input [31:0] Address,
        input [31:0] WriteData,
        input MemWrite, MemRead,
        output [31:0]ReadData
    );
    
    //has 256 32-bit words
    reg [31:0] memory [0:255];
    
    /* Used in Lab 6
    integer i;
    initial
        begin
        $readmemb("data.txt",memory);
            for(i = 0; i < 6; i=i+1)
                $display(memory[i]); 
        end
   */
   
    always @(posedge clk) begin
    if (MemWrite)
      memory[Address[9:2]] <= WriteData;  
    end
     assign ReadData = MemRead ? memory[Address[9:2]] : 32'b0;
    //end   
endmodule
