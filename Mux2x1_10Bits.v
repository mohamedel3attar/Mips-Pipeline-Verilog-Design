module Mux2x1_10Bits(out, in1, in2, sel);

input [9:0] in1, in2;
input sel;
output [9:0] out;

assign out = 	(sel == 1'b0) ? in1 :
		(sel == 1'b1) ? in2 : 10'bx;

endmodule
