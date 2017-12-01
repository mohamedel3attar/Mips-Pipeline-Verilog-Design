module ID_EX_reg ( currentPC_in ,nextPC_in ,ReadData1_in ,ReadData2_in ,SignExtendResult_in ,instr_in
                  ,currentPC_out ,nextPC_out ,ReadData1_out ,ReadData2_out ,SignExtendResult_out ,instr_out
                  ,rsOut ,rtOut ,rdOut ,clk );

  input wire [31:0] currentPC_in ,nextPC_in ,ReadData1_in ,ReadData2_in ,instr_in ,SignExtendResult_in;
  input wire clk;

  output reg [31:0] currentPC_out ,nextPC_out ,ReadData1_out ,ReadData2_out ,SignExtendResult_out ,instr_out
  ,rsOut ,rtOut ,rdOut;



  always @(posedge clk)
    begin
      currentPC_out <= currentPC_out;
      nextPC_out <= nextPC_out ;
      ReadData1_out <= ReadData1_out;
      ReadData2_out <= ReadData2_out;
      SignExtendResult_out <= SignExtendResult_out;
      instr_out <= instr_in;
      rsOut <= instr_in[25:21];
      rtOut <= instr_in[20:15];
      rdOut <= instr_in[15:11];
    end


endmodule
