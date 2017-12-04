module DataMemory (MemWrite,Memread,address,writeData,clk,readData);
  reg[31:0] memory [0:31];
  input MemWrite,Memread,clk;
  input [31:0] address,writeData;
  output reg [31:0] readData;
  
  always@(negedge clk) 
    begin
      if(MemWrite==1)
        memory[address]<=writeData;
    end
  
  always@(address or Memread)
    begin
      
      if(Memread==1)
        readData=memory[address];
      
    end
endmodule
