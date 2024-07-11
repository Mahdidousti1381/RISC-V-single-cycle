module datapath(input clk, input rst,  input reg_write, input [2:0] alu_control, input mem_write, input [1:0] result_src, input alu_src, input [2:0] imm_src, input [1:0] pc_src, output [6:0] op, output [2:0] func3, output func7, output zero, output b31);




    wire [31:0] alu_result,rd2,rd,pc_next, pc,instr,rd1, result, imm_ext,srcb, srca, pcplus4, pctarget;
                 
               
                

    Register Reg(pc_next,clk,rst, pc);

    Inst_mem inst_mem(pc, instr);

    regfile rf(clk, reg_write,instr[19:15], instr[24:20],instr[11:7] ,result,rd1, rd2);

    Mux1 mux1(alu_src, rd2, imm_ext, srcb);

    Alu alu(srca, srcb,alu_control,alu_result,zero, b31);

    Data_memory data_memory(clk,alu_result, rd2, mem_write, rd);

    Mux2 mux2(result_src, alu_result, rd, pcplus4, imm_ext, result);

    Adder adder1(pc, imm_ext, pctarget);

    Imm_extension imm_extension(imm_src, instr[31:7], imm_ext);

    Adder adder2(pc, 4, pcplus4);

    Mux3 mux3( pcplus4, pctarget,alu_result,pc_src,pc_next);


    assign func3 = instr[14:12];
    assign func7 = instr[30];
    assign srca = rd1;
    assign op = instr[6:0];
    
    
endmodule
    

   

    
    
    

    
    

    

    

    

    

    

    
