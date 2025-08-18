`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 06:51:12 PM
// Design Name: 
// Module Name: mips_pipeline
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


module mips_pipeline(
    input clk,rst
    );
    
    //Stage 1: IF Stage
    //IF inputs
     wire [31:0] IF_ID_instr;
     wire [31:0] IF_ID_npc;
     wire [31:0] EX_MEM_PCSrc;
     wire [31:0] EX_MEM_NPC;
     
     I_FETCH uut1(
    .clk(clk),
    .reset(rst),
    .IF_ID_instr(IF_ID_instr),
    .IF_ID_npc(IF_ID_npc),
    .EX_MEM_PCSrc(EX_MEM_PCSrc),
    .EX_MEM_NPC(EX_MEM_NPC)
   );
  
   //Stage 2: Decdoe Stage
   //Decode inputs
    
     wire [4:0] wb_write_reg_location;
     wire [31:0] mem_wb_write_data;
      wire wb_reg_write;
      
    // wire if_id_instr;
     //wire if_id_npc;
     
     //for control component                    
     wire [1:0]   id_ex_wb;
     wire [2:0]   id_ex_mem;
     wire [3:0]   id_ex_execute;
      //for latch component 
      wire [31:0]  id_ex_npc,
      id_ex_readdat1,
      id_ex_readdat2,
      id_ex_sign_ext;
      wire [4:0] id_ex_instr_bits_20_16,
      id_ex_instr_bits_15_11;
   
    decode uut2(
             .clk(clk),
             .if_id_instr(IF_ID_instr),
             .if_id_npc(IF_ID_npc),
             .wb_reg_write(wb_reg_write),
             .wb_write_reg_location(wb_write_reg_location),
             .mem_wb_write_data(mem_wb_write_data),
             .id_ex_wb(id_ex_wb),
             .id_ex_mem(id_ex_mem),
             .id_ex_execute(id_ex_execute),
             . id_ex_npc(id_ex_npc),
              .id_ex_readdat1(id_ex_readdat1),
              .id_ex_readdat2(id_ex_readdat2),
             .id_ex_sign_ext(id_ex_sign_ext),
             .id_ex_instr_bits_20_16(id_ex_instr_bits_20_16),
            .id_ex_instr_bits_15_11(id_ex_instr_bits_15_11)
    );
   //Stage 3:Execute Stage
   //Execute inputs
   assign ctlwb_in = id_ex_wb;
   assign ctlm_in = id_ex_mem;
   assign alu_op = id_ex_execute;
   assign funct = id_ex_sign_ext[5:0];
   assign alusrc = id_ex_mem[2];
   assign regdst= id_ex_execute[3];
   
    wire [1:0] EX_MEM_ctlwb;
    wire [2:0] EX_MEM_ctlm;
    wire [31:0] EX_MEM_adder_out,
     EX_MEM_alu_result_out,
     EX_MEM_rdata2out;
    wire [4:0] EX_MEM_muxout;
    wire EX_MEM_aluzero;
    
    execute uut3(
          .clk(clk),
          .ctlwb_in(ctlwb_in),
          .ctlm_in(ctlm_in),
          .npc(id_ex_npc),
          .rdata1(id_ex_readdat1),
          .rdata2(id_ex_readdat2),
          .s_extend(id_ex_sign_ext),
          .instr_2016(id_ex_instr_bits_20_16), 
          .instr_1511(id_ex_instr_bits_15_11),
          .alu_op(alu_op),
          .funct(funct),
           .alusrc(alusrc),
           .regdst(regdst),
           .ctlwb_out(EX_MEM_ctlwb), 
           .ctlm_out(EX_MEM_ctlm),
           .adder_out(EX_MEM_adder_out), 
           .alu_result_out(EX_MEM_alu_result_out), 
           .rdata2_out(EX_MEM_rdata2out),
           .muxout_out(EX_MEM_muxout)
    );
   //Stage 4: Memory Stage 
   //Mmeory inputs
   
    wire MemWrite, MemRead, Branch;
    
    assign MemWrite = EX_MEM_ctlm[0];
    assign MemRead = EX_MEM_ctlm[1];
    assign Branch = EX_MEM_ctlm[2];
    
    
    wire [31:0] MEM_WB_readdata, MEM_WB_alu_result;
    wire [4:0] MEM_WB_writereg;
    wire [1:0] MEM_WB_control;
    
   memory_stage uut4(
      .clk(clk),
        .ALUResult(EX_MEM_alu_result_out),
        .WriteData(EX_MEM_rdata2_out),
        .WriteReg(EX_MEM_muxout),
        .WBControl(EX_MEM_ctlwb),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Branch(Branch),
        .Zero(EX_MEM_aluzero),
        .ReadData(MEM_WB_readdata),
        .ALUResult_out(MEM_WB_alu_result),
        .WriteReg_out(MEM_WB_writereg),
        .WBControl_out(MEM_WB_control),
        .PCSrc(EX_MEM_PCsrc)
   );
   //Stage 5: WB Stage
   //WB inoputs
   
    wire MemtoReg;
    
    assign MemtoReg = MEM_WB_control[0];
    
    mux_32 uut5(
        .a(MEM_WB_readdata),
        .b(MEM_WB_alu_result),
        .sel(MemtoReg),
        .y(MEMREG_ID_write_data)
   );
   
endmodule
