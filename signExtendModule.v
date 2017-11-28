module signExtend (in ,out);

input  [3:0] in;
output [7:0] out;

  assign out = (in[3] == 1)? {4'b1111 , in} :
  			   (in[3] == 0)? {4'b0000 ,in} : 4'bxxxx;

endmodule
