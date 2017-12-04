module ALU32Bit(data1, data2, ALUControl, shiftAmount, overFlow, zero, ALUResult, reset);

input wire reset;
input wire signed [31:0] data1,data2;
input wire [3:0] ALUControl;
input wire [4:0] shiftAmount;
output reg overFlow, zero;
output reg signed [31:0] ALUResult;

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
parameter NOR = 4'b1001;

always @(posedge reset) zero <= 1'b0;

always @(ALUControl, data1, data2)
begin

if(data1 == data2)
zero <= 1'b1;
else
zero <= 1'b0;

case(ALUControl)

ADD: 
	begin	
	ALUResult <= data1 + data2;
	if(data1[31] == data2[31] && ALUResult[31] == ~data1[31])
	overFlow <= 1'b1;
	else
	overFlow <= 1'b0;
	end

SUB:
	begin
	ALUResult <= data1 + neg_data2;
	if(data1[31] == neg_data2[31] && ALUResult[31] == ~data1[31])
	overFlow <= 1'b1;
	else
	overFlow <= 1'b0;
	end
	
AND:
	ALUResult <= data1 & data2;

OR:
	ALUResult <= data1 | data2;

SHFT_L:
	ALUResult <= data1 << shiftAmount;

SHFT_R_L:
	ALUResult <= data1 >> shiftAmount;

SHFT_R_A:
	ALUResult <= data1 >>> shiftAmount;

GREATER:
	begin
	if(data1 > data2)
	ALUResult <= 1;
	else
	ALUResult <= 0;
	end

LESS:
	begin
	if(data1 < data2)
	ALUResult <= 1;
	else
	ALUResult <= 0;
	end

NOR:
	begin
	ALUResult <= ~(data1 | data2);
	end

endcase
end

endmodule
