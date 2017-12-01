module PC (nextPC ,outPC ,Reset ,clk);

input wire [31:0] nextPC;
input Reset ,clk;
reg [31:0] currentPC;
output reg [31:0] outPC;

always@(posedge Reset) currentPC <= 32'h00000000;
  
always @(posedge clk)
  begin
        outPC <= currentPC;
	#1
	currentPC <= nextPC;
  end

endmodule
