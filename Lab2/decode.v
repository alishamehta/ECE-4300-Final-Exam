`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: decode
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


module decode(
//decode.v
    input wire          clk,
                        rst,
                        wb_reg_write,
    input wire [4:0]    wb_write_reg_location,
    input wire  [31:0]  mem_wb_write_data,
                        if_id_instr,
                        if_id_npc,
    //for control component                    
    output wire [1:0]   id_ex_wb,
    output wire [2:0]   id_ex_mem,
    output wire [3:0]   id_ex_execute,
   //for latch component 
    output wire [31:0]  id_ex_npc,
                        id_ex_readdat1,
                        id_ex_readdat2,
                        id_ex_sign_ext,
    output wire [4:0]    id_ex_instr_bits_20_16,
                        id_ex_instr_bits_15_11
);

    //internal
    wire [31:0] sign_ext_internal,
                readdat1_internal,
                readdat2_internal;
    wire [1:0] wb_internal;
    wire [2:0] mem_internal;
    wire [3:0] ex_internal;


    sign_extend sE0(
        //COMPLETE PARAMETERS
        .immediate(if_id_instr[15:0]),
        .extended(sign_ext_internal)
    );

    register rf0(
        //COMPLETE PARAMETERS
        .clk(clk),
        .rst(rst),
        .regwrite(wb_reg_write),            
        .rs(if_id_instr[25:21]),
        .rt(if_id_instr[20:16]),
        .rd(wb_write_reg_location), //not sure 
        .writedata(mem_wb_write_data),     //not sure
        .A_readdat1(readdat1_internal),
        .B_readdat2(readdat2_internal)
    );

    control c0(
         //COMPLETE PARAMETERS
        .clk(clk),
        .rst(rst),
        .opcode(if_id_instr[31:26]),
        .wb(wb_internal),
        .mem(mem_internal),
        .ex(ex_internal)
    ); 

    latch iEL0(
         //COMPLETE PARAMETERS
        .clk(clk),                                  //inputs
        .rst(rst),
        .ctl_wb(wb_internal),
        .ctl_mem(mem_internal),
        .ctl_ex(ex_internal),
        .npc(if_id_npc),
        .readdat1(readdat1_internal),
        .readdat2(readdat2_internal),
        .sign_ext(sign_ext_internal),
        .instr_bits_20_16(if_id_instr[20:16]),
        .instr_bits_15_11(if_id_instr[15:11]),
         //outputs
        .wb_out(id_ex_wb),
        .mem_out(id_ex_mem),
        .ctl_out(id_ex_execute),
        .npc_out(id_ex_npc),
        .readdat1_out(id_ex_readdat1),
        .readdat2_out(id_ex_readdat2),
        .sign_ext_out(id_ex_sign_ext),
        .instr_bits_20_16_out(id_ex_instr_bits_20_16),
        .instr_bits_15_11_out(id_ex_instr_bits_15_11)
    );

endmodule
