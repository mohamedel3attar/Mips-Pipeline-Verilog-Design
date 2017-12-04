module IF_ID_reg(PCplus4 ,instrIn ,instrOut ,clk ,hold,PCplus4Out,IF_flush);

  input wire [31:0] instrIn,PCplus4;
  input clk ,hold,IF_flush;
  output reg [31:0] instrOut, PCplus4Out;

  always @(posedge clk)
    begin
      
      if (hold==1'b0) 
        
        begin
          
      PCplus4Out<=PCplus4;
          
      instrOut <= instrIn;
          
      end
      else if (IF_flush==1'b1)
        begin
          PCplus4Out<=PCplus4; 
          instrOut<=32'b0;
        end
      
      
    end
  
endmodule
