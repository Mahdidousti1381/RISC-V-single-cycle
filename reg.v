module Register(input [31:0] par, input clk, input rst, output reg [31:0] reg_res);
    
    
    
    always @(posedge clk , posedge rst) begin
        if(rst)
            reg_res <= {32{1'b0}};
        else
            reg_res <= par;
    end

endmodule
