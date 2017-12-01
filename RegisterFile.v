module RegisterFile(ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite, Clk, ReadData1, ReadData2);


	input [4:0] ReadReg1 ,ReadReg2 ,WriteReg;
	input [31:0] WriteData;
	input RegWrite ,Clk;
	output reg [31:0] ReadData1 ,ReadData2;

	reg [31:0] memory[0:31];

	always @(posedge Clk)
	begin
		if (RegWrite == 1)
		begin
			memory[WriteReg] <= WriteData;
		end
	end

	always @(negedge Clk)
  	begin
  		ReadData1 <= memory[ReadReg1];
  		ReadData2 <= memory[ReadReg2];
  	end



endmodule
