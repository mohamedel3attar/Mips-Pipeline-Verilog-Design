module Mux3x1(out, in1, in2, in3, sel);

input [n:0] in1, in2, in3; //replace n with number of bits-1
input [2:0] sel;
output [n:0]out; //replace n with number of bits-1

assign out = 	(sel == 2'b00) ? in1 :
		(sel == 2'b01) ? in2 : 
		(sel == 2'b10) ? in3 : n'bx; //replace n with number of bits

endmodule
