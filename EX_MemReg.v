module EX_MemReg (clk,WBreg,Mreg,ALUresult,writedata,writeReg,WBregOut,MregOut,ALUresultOut,writedataOut,writeRegOut);
  input clk;
  input [1:0] WBreg;  //contains RegWrite & MemtoReg 
  input [1:0] Mreg;  //contains Memwrite & Memread
  input [31:0] ALUresult,writedata;
  input [4:0] writeReg;
  output reg [1:0] WBregOut,MregOut;
  output reg [31:0] ALUresultOut,writedataOut;
  output reg [4:0] writeRegOut;
  
  always@(posedge clk)
    begin
      WBregOut<=WBreg;
      MregOut<=Mreg;
      ALUresultOut<=ALUresult;
      writedataOut<=writedata;
      writeRegOut<=writeReg;
      
    end
  
  
endmodule