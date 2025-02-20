module reisc_tb();
    reg clk, rst;
    top_risc risc_v(.clk(clk), .rst(rst));
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        #2 rst = 1'b1;
        #6 rst = 1'b0;
        #2000 $stop;
    end
    
endmodule
