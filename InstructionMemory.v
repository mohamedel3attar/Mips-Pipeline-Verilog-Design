module InstructionMemory(clk,pc,readdata);

input clk;
input  [31:0] pc;
reg [31:0] Imemory [0:1023];
output reg [31:0] readdata;

initial //for testing
	begin
		$readmemh("code.txt",Imemory);
	end


always @ (pc)
	
	begin	 
	readdata <= Imemory[pc>>2];
	end			
		
endmodule	
