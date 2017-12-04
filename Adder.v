module Adder (out ,in1, in2);

input wire signed [31:0] in1, in2;
output wire [31:0] out;

assign out = in1 + in2;

endmodule
