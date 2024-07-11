module risc_v_controller(input [6:0] op, input [2:0] func3, input func7, input zero, b31, output [1:0] pc_src,output [1:0] result_src, output mem_write, output [2:0] alu_control,output alu_src, output [2:0] imm_src,  output reg_write);

    
    wire [1:0] alu_op;
    wire branch, branch_res, jal, jalr;
    
    
    Alu_controller ac(func3, alu_op,func7,branch, zero, b31, alu_control, branch_res);
    
    Main_controller mc(op, zero, b31, result_src, mem_write, alu_op,alu_src, imm_src, reg_write, jal, jalr, branch);

    assign pc_src =  (jalr) ? 2'b10 : (jal | branch_res) ? 2'b01: 2'b00;

endmodule
