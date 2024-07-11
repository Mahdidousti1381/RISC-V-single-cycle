module top_risc(input clk, rst);
    
    wire reg_write, mem_write, alu_src;
    wire [1:0] result_src, pc_src;
    wire [2:0] alu_control, imm_src, func3;
    wire [6:0] op;
    wire zero, b31, func7;
    
    risc_v_controller cu(op, func3, func7,zero, b31,
                                        pc_src,result_src, mem_write, alu_control, 
                                        alu_src,imm_src,  reg_write);

    datapath dp(clk, rst, reg_write,alu_control,
                      mem_write,result_src,alu_src, 
                      imm_src,pc_src,op,func3,
                      func7,  zero, b31);
    
endmodule
