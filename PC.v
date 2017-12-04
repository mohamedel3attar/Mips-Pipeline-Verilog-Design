module PC (nextPC ,outPC ,Reset ,clk, holdPC);

input wire [31:0] nextPC;
input Reset , clk, holdPC;
output reg [31:0] outPC;

always@(posedge Reset) outPC <= 32'hFFFFFFFC;
  

always @(posedge clk)
  begin
	  if (holdPC==0) //to support stalls from hazard detection unit
		  begin
                   outPC <= nextPC;
		  end
  end

endmodule
