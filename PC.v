module PC (nextPC ,outPC ,Reset ,clk);

input wire [31:0] nextPC;
input Reset ,clk;
output reg [31:0] outPC;

  always @(posedge Reset)
    begin
       outPC <= 32'h00000000;
    end 
  
always @(posedge clk)
  begin
        outPC <= nextPC;
  end
endmodule
