module RegisterFile(ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite, Clk, ReadData1, ReadData2, reset);


	input [4:0] ReadReg1 ,ReadReg2 ,WriteReg;
	input [31:0] WriteData;
	input RegWrite ,Clk, reset;
	output reg [31:0] ReadData1 ,ReadData2;

	reg [31:0] memory[0:31];

	always @(posedge reset) 
		begin
		memory[0] <= 32'h00000000;
		memory[8] <= 32'h00000001;
		memory[9] <= 32'h00000002;
		memory[10] <= 32'h00000000;
		memory[11] <= 32'h00000000;
		memory[12] <= 32'h00000000;
		memory[13] <= 32'h00000000;
		memory[14] <= 32'h00000000;
		memory[15] <= 32'h00000000;
		memory[16] <= 32'h00000000;
		memory[17] <= 32'h00000000;
		memory[18] <= 32'h00000003;
		memory[19] <= 32'h00000003;
		memory[20] <= 32'h00000004;
		memory[21] <= 32'h00000000;
		memory[22] <= 32'h00000008;
		memory[23] <= 32'h00000000;
		memory[24] <= 32'h00000000;
		memory[25] <= 32'h00000000;
		memory[31] <= 32'h00000000;
		end

	always @(ReadReg1, ReadReg2)
	begin
		ReadData1 <= memory[ReadReg1];
  		ReadData2 <= memory[ReadReg2];
	end

	always @(negedge Clk)
  	begin
  		if (RegWrite == 1)
		begin
			 memory[WriteReg] <= WriteData;
      		end
  	end



endmodule
