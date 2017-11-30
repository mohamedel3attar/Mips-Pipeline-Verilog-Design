module IF_ID_reg(currentPC_in ,nextPC_in ,currentPC_out ,nextPC_out ,instrIn ,instrOut ,clk ,Reset);

input wire [31:0] currentPC_in ,nextPC_in ,instrIn;
input clk ,Reset;
output reg [31:0] currentPC_out ,nextPC_out ,instrOut;

  always @(posedge clk)
    begin
      nextPC_out <= nextPC_in;
      currentPC_out <= currentPC_in;
      instrOut <= instrIn;
    end
  
endmodule
