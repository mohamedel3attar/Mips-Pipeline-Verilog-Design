module Mux2x1_5Bits(out, in1, in2, sel);

input [4:0] in1, in2;
input sel;
output [4:0] out;

assign out = 	(sel == 1'b0) ? in1 :
		(sel == 1'b1) ? in2 : 5'bx;

endmodule
