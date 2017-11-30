module IF_EX_reg(currentPC_in ,nextPC_in ,currentPC_out ,nextPC_out ,instrIn ,instrOut ,clk ,Reset ,WriteEnable);

input wire [31:0] currentPC_in ,nextPC_in ,instrIn;
input clk ,Reset ,WriteEnable;
output reg [31:0] currentPC_out ,nextPC_out ,instrOut;

reg [31:0] currentPC_reg ,nextPC_reg ,instrOut_reg;


always @(Reset)
  begin
    if(Reset == 1)
      begin
        instrOut <= 32'h00000000;
        currentPC_out <= 32'h00000000;
        nextPC_out <= 32'h00000000;
      end
  end

  always @(posedge clk)
    begin
      if(WriteEnable)
        begin
         nextPC_out <= nextPC_reg;
         currentPC_out <= currentPC_reg;
         instrOut <= instrOut_reg;
        end
  end

  always @(negedge clk)
    begin
      nextPC_reg <= nextPC_in;
      currentPC_reg <= currentPC_in;
      instrOut_reg <= instrIn;
    end
  
endmodule
