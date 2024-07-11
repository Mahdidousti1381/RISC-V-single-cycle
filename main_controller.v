module Main_controller(input [6:0] op, input zero, input b31 , output reg [1:0] result_src, output reg mem_write,
                      output reg [1:0] alu_op, output reg alu_src, output reg [2:0] imm_src, output reg reg_write, 
                      output reg jal, output reg jalr,output reg  branch);
parameter [6:0] R_T = 7'b0110011, I_T = 7'b0010011, S_T = 7'b0100011, B_T = 7'b1100011, U_T = 7'b0110111, J_T = 7'b1101111, LW = 7'b0000011, JALR = 7'b1100111;
    
    always @(op) begin 
        {mem_write, reg_write, alu_src, jal, jalr, branch, imm_src, result_src, alu_op} <= 13'b0;
        case(op)
             R_T:begin
                reg_write <= 1'b1;
                imm_src <= 3'b000;
                alu_src <= 1'b0;
                mem_write <= 1'b0;
                result_src <= 2'b00;
                branch <= 1'b0;
                alu_op <= 2'b10;
                jal <= 1'b0;
                jalr <= 1'b0;
            end

             I_T:begin
                reg_write <= 1'b1;
                imm_src <= 3'b000;
                alu_src <= 1'b1;
                mem_write <= 1'b0;
                result_src <= 2'b00;
                branch <= 1'b0;
                alu_op <= 2'b11;
                jal <= 1'b0;
                jalr <= 1'b0;
            end
            S_T:begin
                reg_write <= 1'b0;
                imm_src <= 3'b001;
                alu_src <= 1'b1;
                mem_write <= 1'b1;
                result_src <= 2'b00;
                branch <= 1'b0;
                alu_op <= 2'b00;
                jal <= 1'b0;
                jalr <= 1'b0;
            end
            B_T:begin
                reg_write <= 1'b0;
                imm_src <= 3'b010;
                alu_src <= 1'b0;
                mem_write <= 1'b0;
                result_src <= 2'b00;
                branch <= 1'b1;
                alu_op <= 2'b01;
                jal <= 1'b0;
                jalr <= 1'b0;
            end
            U_T:begin
                reg_write <= 1'b1;
                imm_src <= 3'b100;
                alu_src <= 1'b0;
                mem_write <= 1'b0;
                result_src <= 2'b11;
                branch <= 1'b0;
                alu_op <= 2'b00;
                jal <= 1'b0;
                jalr <= 1'b0;
            end
            J_T:begin
                reg_write <= 1'b1;
                imm_src <= 3'b011;
                alu_src <= 1'b0;
                mem_write <= 1'b0;
                result_src <= 2'b10;
                branch <= 1'b0;
                alu_op <= 2'b00;
                jal <= 1'b1;
                jalr <= 1'b0;
            end
            
             LW:begin
                reg_write <= 1'b1;
                imm_src <= 3'b000;
                alu_src <= 1'b1;
                mem_write <= 1'b0;
                result_src <= 2'b01;
                branch <= 1'b0;
                alu_op <= 2'b00;
                jal <= 1'b0;
                jalr <= 1'b0;
            end

            JALR:begin
                reg_write <= 1'b1;
                imm_src <= 3'b000;
                alu_src <= 1'b1;
                mem_write <= 1'b0;
                result_src <= 2'b10;
                branch <= 1'b0;
                alu_op <= 2'b00;
                jal <= 1'b0;
                jalr <= 1'b1;
            end
        endcase
    end
endmodule
