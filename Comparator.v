module Comparator(inData1 ,inData2 ,equalFlag);

input [31:0]  inData1;
input [31:0]  inData2;
output equalFlag;

assign equalFlag = (inData1 == inData2) ? 1'b1 : 1'b0;

endmodule
