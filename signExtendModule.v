module signExtend (in ,out);

input  [15:0] in;
output [31:0] out;

  assign out = (in[15] == 1)? {4'h1111 , in} :
  			       (in[15] == 0)? {4'h0000 ,in} : 4'hxxxx;

endmodule
