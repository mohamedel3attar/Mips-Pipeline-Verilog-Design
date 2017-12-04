module EX_MemReg (clk,RegWrite, MemtoReg,MemWrite, MemRead,ALUresult,writedata,writeReg,RegWriteOut, MemtoRegOut,MemWriteOut
			,MemReadOut,ALUresultOut,writedataOut,writeRegOut);
  
  input clk;
  input RegWrite, MemtoReg;
  input MemWrite, MemRead; 
  input [31:0] ALUresult,writedata;
  input [4:0] writeReg;
  output reg RegWriteOut, MemtoRegOut ,MemWriteOut, MemReadOut;
  output reg [31:0] ALUresultOut,writedataOut;
  output reg [4:0] writeRegOut;
  
  always@(posedge clk)
    begin
      RegWriteOut <= RegWrite;
      MemtoRegOut <= MemtoReg;
      MemWriteOut <= MemWrite;
      MemReadOut <= MemRead;
      ALUresultOut<=ALUresult;
      writedataOut<=writedata;
      writeRegOut<=writeReg;
      
    end
  
  
endmodule