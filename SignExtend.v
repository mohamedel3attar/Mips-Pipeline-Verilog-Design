module SignExtend(in ,out);

input  [15:0] in;
output [31:0] out;

assign out =  (in[15] == 1)? {16'hffff , in} : 
              (in[15] == 0)? {16'h0000 ,in}  : 16'hxxxx;

endmodule
