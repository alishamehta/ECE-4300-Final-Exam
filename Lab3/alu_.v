`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:27:49 PM
// Design Name: 
// Module Name: alu_
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


module alu_(
      input [31:0] a,b, 
      input [2:0] control, 
      output reg [31:0] result, 
      output zero
    );
    
    assign zero = (result == 0);

    always @(*) begin
        case (control)
            3'b000: result = a & b;
            3'b001: result = a | b;
            3'b010: result = a + b;
            3'b110: result = a - b;
            3'b111: result = (a < b) ? 1 : 0;
            default: result = 32'bx;
        endcase
    end

endmodule
