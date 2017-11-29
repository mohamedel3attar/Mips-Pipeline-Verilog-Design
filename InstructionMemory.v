module InstructionMemory (clk,pc,branch,branchamount,readdata);
input clk,branch;
input [5:0] branchamount;
input  [31:0] pc;
 reg [31:0] Imemory [0:1023];
output reg [31:0] readdata;
always @ (posedge clk)
	
	begin
	if (branch==1)
		readdata <= Imemory[( (pc+4)>>2 )+branchamount];	 
	else if (branch==0)
		readdata<= Imemory[pc>>2];
		
	end			
		
endmodule	
		
		
		
		
	

	






