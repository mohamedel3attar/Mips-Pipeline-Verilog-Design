module MipsTestBench();

reg clk, reset;
wire [31:0] nextPC, readPC, instruction, PCPlus4, regWriteData, registerData1, registerData2,
		signExtendOut, ALUData2MuxOut, ALUResult, memReadData, shiftOut, branchNewPC;
wire [4:0] writeRegister;
wire [3:0] ALUControl;
wire [3:0] ALUOp;

//modules instances
PC PCRegister(nextPC ,readPC ,reset , clk);
InstructionMemory instructionMemory(clk, readPC, instruction);
Adder pcAdder(PCPlus4, readPC, 32'h00000004);
ControlUnit controlUnit(instruction[31:26], regDst, branch, memRead, memToReg, ALUOp, memWrite, ALUSrc, regWrite, reset);
Mux2x1_5Bits writeRegMux(writeRegister, instruction[20:16], instruction[15:11], regDst); //5bits
RegisterFile registerFile(instruction[25:21], instruction[20:16], writeRegister, regWriteData, regWrite, clk, registerData1, registerData2, reset);
SignExtend signExtend(instruction[15:0], signExtendOut);
Mux2x1_32Bits aluData2Mux(ALUData2MuxOut, registerData2, signExtendOut, ALUSrc); //32bits
ALU32Bit ALU(clk, registerData1, ALUData2MuxOut, ALUControl, 5'b00000, overFlow, zero, ALUResult, reset);//shift amount hard coded to 0
ALUControl aluControl(clk, ALUControl, ALUOp, instruction[5:0]);
DataMemory dataMemory(memWrite, memRead, ALUResult, registerData2, clk, memReadData);
Mux2x1_32Bits writeDataMux(regWriteData, ALUResult, memReadData, memToReg); //32bits
ShiftLeft2 shiftLeft2(shiftOut, signExtendOut);
Adder branchAdder(branchNewPC , PCPlus4, shiftOut);
and branchAndZero(PCSrc, branch, zero);
Mux2x1_32Bits PCMux(nextPC, PCPlus4, branchNewPC, PCSrc);

//pc updated, change in testbench
always@(clk)
#100 clk <= ~clk;

initial
begin

clk <= 0;
reset <= 1;
#50
reset <= 0;

end

endmodule
