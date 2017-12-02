module ID_EX_reg (WBreg,Mreg,EXreg, PCplus4 ,ReadData1_in ,ReadData2_in, ,SignExtendResult_in ,instr_in ,PCplus4out ,ReadData1_out ,ReadData2_out ,SignExtendResult_out ,rsOut ,rtOut ,rdOut,WBregOut,MregOut,EXregOut ,clk );
  
  input wire [1:0] WBreg; //contains RegWrite & MemtoReg 
  input wire [1:0] Mreg; //contains Memwrite & Memread
  input wire [3:0] EXreg; //contains ALUSrc, ALUOp & RegDst
  output reg [1:0] WBregOut;
  output reg [1:0] MregOut;
  output reg [3:0] EXregOut;

  input wire [31:0] PCplus4 ,ReadData1_in ,ReadData2_in ,instr_in ,SignExtendResult_in;
  input wire clk;

  output reg [31:0] PCplus4out ,ReadData1_out ,ReadData2_out ,SignExtendResult_out
  ,rsOut ,rtOut ,rdOut;
  

  
  always @(posedge clk)
    begin
      PCplus4out <= PCplus4;
      ReadData1_out <= ReadData1_in;
      ReadData2_out <= ReadData2_in;
      SignExtendResult_out <= SignExtendResult_in;
      rsOut <= instr_in[25:21];
      rtOut <= instr_in[20:15];
      rdOut <= instr_in[15:11];
      WBregOut<=WBreg;
      MregOut<=Mreg;
      EXregOut<=EXreg;
    end
  
endmodule
