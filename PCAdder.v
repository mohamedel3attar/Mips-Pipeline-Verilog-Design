module PCAdder (currentPC ,nextPC ,clk);

input clk;
input wire [31:0] currentPC;
output reg [31:0] nextPC;

always @(posedge clk)
    begin
    	nextPC <= currentPC + 32'h00000004;
    end

endmodule
