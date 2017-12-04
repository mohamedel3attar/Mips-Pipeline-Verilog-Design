module Mux2x1(out, in1, in2, sel);

input [n:0] in1, in2; //replace n with number of bits-1
input sel;
output [n:0] out; //replace n with number of bits-1

assign out = 	(sel == 1'b0) ? in1 :
		(sel == 1'b1) ? in2 : n'bx; //replace n with number of bits

endmodule
