`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 11:22:39 PM
// Design Name: 
// Module Name: memory
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


module memory(
    //the instruction memory block:
    //intializa first 10 words to given hex values
    input [31:0] addr,  //address
    output reg [31:0] data
    );
     reg [31:0] memory [0:127];  // 128 x 32-bit memory
   integer i;
    initial 
        begin
            memory[0] = 32'hA00000AA;
            memory[1] = 32'h10000011;
            memory[2] = 32'h20000022;
            memory[3] = 32'h30000033;
            memory[4] = 32'h40000044;
            memory[5] = 32'h50000055;
            memory[6] = 32'h60000066;
            memory[7] = 32'h70000077;
            memory[8] = 32'h80000088;
            memory[9] = 32'h90000099;
                  
    end
    initial
         begin
    // Zero-fill the rest
        for (i = 10; i < 128; i = i + 1) begin
            memory[i] = 32'b0;
        end
    end
        
         always @(*) 
             begin
        data = memory[addr[8:2]];  // Use the 7 LSBs for addressing
            end
endmodule
