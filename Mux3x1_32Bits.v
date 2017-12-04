module Mux3x1_32Bits(out, in1, in2, in3, sel);

input [31:0] in1, in2, in3;
input [1:0] sel;
output [31:0]out;

assign out = 	(sel == 2'b00) ? in1 :
		(sel == 2'b01) ? in2 : 
		(sel == 2'b10) ? in3 : 32'bx;

endmodule
