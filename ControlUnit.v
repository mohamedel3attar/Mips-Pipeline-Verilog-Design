module ControlUnit (opcode,RegDst,branch,Memread,MemtoReg,ALUop,MemWrite,AluSrc,RegWrite, reset);
  
  input [5:0] opcode;
  input reset;
  output reg RegDst,branch,Memread,MemtoReg,MemWrite,AluSrc,RegWrite;
  output reg [3:0] ALUop;
  
  
  parameter R_type=6'b000000;
  parameter lw=6'b100011;
  parameter sw=6'b101011;
  parameter beq=6'b000100;
  parameter addi = 6'b001000; //aluop same as sw and lw
  parameter andi = 6'b001100; //aluop 0011
  parameter ori = 6'b001101;//aluop 0100
  parameter slti = 6'b001010;//aluop 0101

  always @(posedge reset)
  begin
   RegDst <= 1'b0;
   branch <= 1'b0;
   Memread <= 1'b0;
   MemtoReg <= 1'b0;
   ALUop <= 4'b0000;
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
          ALUop<=4'b0010 ;
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
          ALUop<=4'b0000 ;
          end
         
        
        sw:           

          begin
          //RegDst<=1'bx ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=1 ;
          AluSrc<=1 ;
          RegWrite<=0 ;
          ALUop<=4'b0000 ;
          end
          
        beq:           

          begin
          //RegDst<=1'bx ;
          branch<= 1;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=0 ;
          RegWrite<=0 ;
          ALUop<=4'b0001 ;
          end

	addi:           

          begin
          RegDst<=0 ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=1 ;
          RegWrite<=1 ;
          ALUop<=4'b0000 ;
          end

	andi:           

          begin
          RegDst<=0 ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=1 ;
          RegWrite<=1 ;
          ALUop<=4'b0011 ;
          end

	ori:           

          begin
          RegDst<=0 ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=1 ;
          RegWrite<=1 ;
          ALUop<=4'b0100 ;
          end

	slti:           

          begin
          RegDst<=0 ;
          branch<=0 ;
          Memread<=0 ;
          MemtoReg<=0 ;
          MemWrite<=0 ;
          AluSrc<=1 ;
          RegWrite<=1 ;
          ALUop<=4'b0101 ;
          end

      endcase
      
    end
  
  
endmodule
