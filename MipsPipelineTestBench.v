module MipsPipelineTestBench();

reg clk, reset;
wire [31:0] nextPC, readPC, PCPlus4IF, PCPlus4ID, PCPlus4EX;
wire [31:0] branchAddress;
wire [31:0] instructionIF, instructionID;
wire [31:0] registerData1ID, registerData2ID, registerData1EX, registerData2EX;
wire [31:0] signExtendOutID, signExtendOutEX;
wire [31:0] shiftOut;
wire [3:0] ALUOpID, ALUOpEX;
wire [9:0] controlSignalsID;
wire [4:0] rsEX ,rtEX ,rdEX;
wire [31:0] ALUData1, ALUData2;
wire [31:0] ALUData2Mux_1Out;
wire [4:0] regDstMuxOut;
wire [31:0] ALUResultEX, ALUResultMEM, ALUResultWB;
wire [31:0] memoryWriteDataMEM;
wire [4:0] writeRegMEM, writeRegWB;
wire [1:0] upperMux_sel, lowerMux_sel;
wire [1:0] comparatorMux1Selector,comparatorMux2Selector;
wire [31:0] comparatorMux1Out, comparatorMux2Out;
wire [31:0] memoryReadDataMEM, memoryReadDataWB;
wire [31:0] regWriteDataMEM;
wire [3:0] ALUControl;


//modules instances

//IF_Stage
PC PCRegister(nextPC ,readPC ,reset , clk, holdPC);
InstructionMemory instructionMemory(clk, readPC, instructionIF);
Adder PCAdder(PCPlus4IF ,readPC, 32'h00000004);
Mux2x1_32Bits nextPCMux(nextPC, PCPlus4IF, branchAddress, PCMuxSel);
and branchAndComparator(PCMuxSel, equalFlag, branchID);
IF_ID_reg IF_ID(PCPlus4IF, instructionIF, instructionID, clk, holdIF_ID, PCPlus4ID, PCMuxSel);


//ID_Stage
ControlUnit controlUnit(instructionID[31:26],RegDstID,branchID,MemReadID,MemtoRegID,ALUOpID,MemWriteID,ALUSrcID,RegWriteID, reset);
RegisterFile regiterFile(instructionID[25:21], instructionID[20:16], writeRegWB, regWriteDataMEM, RegWriteWB, clk, registerData1ID, registerData2ID, reset);
Mux3x1_32Bits comparatorMux1(comparatorMux1Out, registerData1ID, ALUResultMEM, regWriteDataMEM, comparatorMux1Selector);
Mux3x1_32Bits comparatorMux2(comparatorMux2Out, registerData2ID, ALUResultMEM, regWriteDataMEM, comparatorMux2Selector);
Comparator comparator(comparatorMux1Out, comparatorMux2Out, equalFlag);
SignExtend signExtend(instructionID[15:0], signExtendOutID);
ShiftLeft2 shiftLeft2(shiftOut, signExtendOutID);
Adder branchAdder(branchAddress, shiftOut, PCPlus4ID);
HazardDetectionUnit hazardUnit(MemReadEX, MemReadMEM, rtEX, instructionID, holdPC, holdIF_ID, hazardMuxSelector);
Mux2x1_10Bits ID_EXRegMux(controlSignalsID, {RegWriteID, MemtoRegID, MemWriteID, MemReadID, ALUSrcID, ALUOpID, RegDstID}
			,10'b0000000000, hazardMuxSelector);
ID_EX_reg ID_EX(RegWriteID, MemtoRegID, MemWriteID, MemReadID, ALUSrcID, ALUOpID, RegDstID, PCPlus4ID,registerData1ID ,registerData2ID
		,signExtendOutID,instructionID[25:11],PCPlus4EX ,registerData1EX ,registerData2EX ,signExtendOutEX ,rsEX ,rtEX ,rdEX
		,RegWriteEX,MemtoRegEX,MemWriteEX, MemReadEX,ALUSrcEX, ALUOpEX, RegDstEX,clk);


//EX_Stage
Mux3x1_32Bits ALUData1Mux(ALUData1, registerData1EX, regWriteDataMEM, ALUResultMEM, upperMux_sel);
Mux3x1_32Bits ALUData2Mux_1(ALUData2Mux_1Out, registerData2EX, regWriteDataMEM, ALUResultMEM, lowerMux_sel);
Mux2x1_32Bits ALUData2Mux_2(ALUData2, ALUData2Mux_1Out, signExtendOutEX, ALUSrcEX);
ALUControl AluControl(clk, ALUControl, ALUOpEX, signExtendOutEX[5:0]);
ALU32Bit ALU(ALUData1, ALUData2, ALUControl, signExtendOutEX[10:6], overFlow, zero, ALUResultEX, reset);
Mux2x1_5Bits regDstMux(regDstMuxOut, rtEX, rdEX, RegDstEX);
EX_MemReg EX_MEM(clk, RegWriteEX, MemtoRegEX, MemWriteEX, MemReadEX, ALUResultEX, ALUData2Mux_1Out
		,regDstMuxOut, RegWriteMEM, MemtoRegMEM, MemWriteMEM, MemReadMEM, ALUResultMEM, memoryWriteDataMEM, writeRegMEM);
ForwardingUnit forwardingUnit(RegWriteMEM, writeRegMEM, RegWriteWB, writeRegWB, rsEX, rtEX
				,upperMux_sel,lowerMux_sel, comparatorMux1Selector,comparatorMux2Selector);


//MEM_Stage
DataMemory dataMemory(MemWriteMEM, MemReadMEM, ALUResultMEM, memoryWriteDataMEM, clk, memoryReadDataMEM);
Mem_WbReg MEM_WB(RegWriteMEM, MemtoRegMEM, ALUResultMEM, clk, memoryReadDataMEM, writeRegMEM, RegWriteWB, MemtoRegWB,memoryReadDataWB
		,ALUResultWB, writeRegWB);


//WB_Stage
Mux2x1_32Bits writeBackMux(regWriteDataMEM, ALUResultWB, memoryReadDataWB, MemtoRegWB);



//pc updated, change in singel cycle testbench
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
