module ControlUnit (opcode,RegDst,branch,Memread,MemtoReg,ALUop,
                   MemWrite,AluSrc,RegWrite);
  
  input [5:0] opcode;
  output reg RegDst,branch,Memread,MemtoReg,MemWrite,AluSrc,RegWrite;
  output reg [1:0] ALUop;
  
  
  parameter R_type=6'b000000;
  parameter lw=6'b100011;
  parameter sw=6'b101011;
  parameter beq=6'b000100;

  initial
  begin
   RegDst <= 1'b0;
   branch <= 1'b0;
   Memread <= 1'b0;
   MemtoReg <= 1'b0;
   ALUop <= 1'b0;
   MemWrite <= 1'b0;
   AluSrc <= 1'b0;
   RegWrite <= 1'b0;
  end

  always@(opcode)
    begin
      case (opcode)
        R_type:           

          begin
          RegDst<=1 ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=0 ;
          RegWrite<=1 ;
          ALUop<=2'b10 ;
          end
          
          
        
        lw:           

          begin
          RegDst<=0 ;
          branch<=0 ;
          Memread<=1 ;
          MemtoReg<=1 ;
          MemWrite<=0 ;
          AluSrc<=1 ;
          RegWrite<=1 ;
          ALUop<=2'b00 ;
          end
         
        
        sw:           

          begin
          RegDst<=1'bx ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=1 ;
          AluSrc<=1 ;
          RegWrite<=0 ;
          ALUop<=2'b00 ;
          end
          
        beq:           

          begin
          RegDst<=1'bx ;
          branch<= 1;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=0 ;
          RegWrite<=0 ;
          ALUop<=2'b01 ;
          end
      endcase
      
    end
  
  
endmodule
