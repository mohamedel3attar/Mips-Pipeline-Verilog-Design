module PC (nextPC ,outPC ,Reset ,clk);

input wire [31:0] nextPC;
input Reset ,clk;
output reg [31:0] outPC;

always @(posedge clk)
  begin
    if(Reset == 1)
      begin
        outPC <= 32'h00000000;
      end
    else
      begin
        outPC <= nextPC;
      end
  end
endmodule
