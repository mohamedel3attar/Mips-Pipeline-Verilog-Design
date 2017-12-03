module PC (nextPC ,outPC ,Reset ,clk,holdPC);

input wire [31:0] nextPC;
input Reset ,clk,holdPC;
reg [31:0] currentPC;
output reg [31:0] outPC;

always@(posedge Reset) currentPC <= 32'h00000000;
  
always @(posedge clk)
  begin
	  if (holdPC==0) //to support stalls from hazard detection unit
		  begin
                   outPC <= currentPC;
	            #1
	           currentPC <= nextPC;
		  end
  end

endmodule
