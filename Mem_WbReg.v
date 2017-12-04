module Mem_WbReg(RegWrite, MemtoReg,ALUresult,clk,readData,writeReg,RegWriteOut,MemtoRegOut,readDataOut,ALUresultOut,writeRegOut);
  
  input clk;
  input RegWrite, MemtoReg;
  input [4:0] writeReg;
  input [31:0] ALUresult, readData;
  output reg RegWriteOut, MemtoRegOut;
  output reg [31:0] readDataOut,ALUresultOut;
  output reg [4:0] writeRegOut;
  
  always@(posedge clk)
    begin
      RegWriteOut<=RegWrite;
      MemtoRegOut<=MemtoReg;
      readDataOut<=readData;
      ALUresultOut<=ALUresult;
      writeRegOut<=writeReg;
      
    end
  
  
endmodule