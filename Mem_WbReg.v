module Mem_WbReg (WBreg,ALUresult,clk,readData,writeReg,RegWrite,MemtoReg,readDataOut,ALUresultOut,writeRegOut);
  
  input clk;
  input [1:0] WBreg; //contains RegWrite & MemtoReg
  input [4:0] writeReg;
  input [31:0] ALUresult, readData;
  output reg RegWrite, MemtoReg;
  output reg [31:0] readDataOut,ALUresultOut;
  output reg [4:0] writeRegOut;
  
  always@(posedge clk)
    begin
      RegWrite<=WBreg[0];
      MemtoReg<=WBreg[1];
      readDataOut<=readData;
      ALUresultOut<=ALUresult;
      writeRegOut<=writeReg;
      
    end
  
  
endmodule