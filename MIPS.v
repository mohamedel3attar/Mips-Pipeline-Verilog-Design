module mux(inA, inB, sel, out);

input wire [31:0] inA, inB;
input wire sel;
output reg [31:0] out;

always @(sel, inA, inB)
begin
case(sel)

0:
	out <= inA;
1:
	out <= inB;
endcase
end


endmodule

module ALU(clk, data1, data2, op, shiftAmt, overflow, result);

input wire clk;
input wire signed [31:0] data1,data2;
input wire [3:0] op;
input wire [4:0] shiftAmt;
output reg overflow;
output reg signed [31:0] result;

wire [31:0] neg_data2;
assign neg_data2 = -data2;

parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR = 4'b0011;
parameter SHFT_L = 4'b0100;
parameter SHFT_R_L = 4'b0101;
parameter SHFT_R_A = 4'b0110;
parameter GREATER = 4'b0111;
parameter LESS = 4'b1000;

always @(posedge clk)
begin
case(op)

ADD: 
	begin	
	result <= data1 + data2;
	if(data1[31] == data2[31] && result[31] == ~data1[31])
	overflow <= 1'b1;
	else
	overflow <= 1'b0;
	end

SUB:
	begin
	result <= data1 + neg_data2;
	if(data1[31] == neg_data2[31] && result[31] == ~data1[31])
	overflow <= 1'b1;
	else
	overflow <= 1'b0;
	end
	
AND:
	result <= data1 & data2;

OR:
	result <= data1 | data2;

SHFT_L:
	result <= data1 << shiftAmt;

SHFT_R_L:
	result <= data1 >> shiftAmt;

SHFT_R_A:
	result <= data1 >>> shiftAmt;

GREATER:
	begin
	if(data1 > data2)
	result <= 1;
	else
	result <= 0;
	end

LESS:
	begin
	if(data1 < data2)
	result <= 1;
	else
	result <= 0;
	end

endcase
end

endmodule

module regFile(clk, readReg1, readReg2, writeReg, writeData, writeEnb, readData1, readData2);

input clk;
input [4:0] readReg1, readReg2, writeReg;
input [31:0] writeData;
input writeEnb;
output reg [31:0] readData1, readData2;
reg [31:0] memory[0:31];


always@(readReg1, readReg2)
begin
readData1 <= memory[readReg1];
readData2 <= memory[readReg2];
end


always @(posedge clk)
begin
if(writeEnb == 1)
memory[writeReg] <= writeData;
end

endmodule

module testBench();

reg clk;
reg [4:0] readReg1, readReg2, writeReg;
reg [31:0] wd;
reg muxCtrl, writeEnb;
reg [3:0] op;
reg [4:0] shiftAmt;
wire overflow;
wire signed [31:0] result;
wire [31:0] writeData,readData1,readData2;

mux mux1(wd, result, muxCtrl, writeData);
regFile memory(clk, readReg1, readReg2, writeReg, writeData, writeEnb, readData1, readData2);
ALU myALU(clk, readData1, readData2, op, shiftAmt, overflow, result);

always
#5 clk = ~clk;

initial 
begin

$monitor("reg1 = %d  reg2 = %d  op = %d  result = %d  overflow = %d",readData1, readData2, op, result, overflow);

clk <= 0;

// assign 1 in memory[0]
writeReg <= 0;
muxCtrl <= 0;
wd <= 1;
writeEnb <= 1;

#20
//assign 5 in memory[1]
writeReg <= 1;
muxCtrl <= 0;
wd <= 5;
writeEnb <= 1;

#20
//assign 8 in memory[2]
writeReg <= 2;
muxCtrl <= 0;
wd <= 8;
writeEnb <= 1;

#20
//assign 25 in memory[3]
writeReg <= 3;
muxCtrl <= 0;
wd <= 25;
writeEnb <= 1;

#20
//add memory[0] and memory[1] then assign the result in memory[4]
writeEnb <= 1;
writeReg <= 4;
muxCtrl <= 1;
readReg1 <= 0;
readReg2 <= 1;
op <= 0;

#20
//sub memory[2] from memory[1] then assign the result in memory[5]
writeEnb <= 1;
writeReg <= 5;
muxCtrl <= 1;
readReg1 <= 1;
readReg2 <= 2;
op <= 1;


end

endmodule
