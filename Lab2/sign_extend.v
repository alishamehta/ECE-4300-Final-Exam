`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: sign_extend
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

//comb. mod recieves 16 bit input and and outputs 32 bit 
//sign extended value 

module sign_extend(
       input [15:0]immediate,
       output signed [31:0] extended
    );
    assign extended = $signed(immediate);
    
endmodule
