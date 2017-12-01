module Mux2x1_32Bits(out, in1, in2, sel);

input [31:0] in1, in2; 
input sel;
output [31:0] out; 

assign out = 	(sel == 1'b0) ? in1 :
		(sel == 1'b1) ? in2 : 32'bx;

endmodule
