module forwardingUnit (EX_MemRegwrite,EX_MemWriteReg,Mem_WbRegwrite,Mem_WbWriteReg,ID_Ex_Rs,ID_Ex_Rt,upperMux_sel,lowerMux_sel);
  
  input EX_MemRegwrite, Mem_WbRegwrite;
  input [4:0] EX_MemWriteReg , Mem_WbWriteReg, ID_Ex_Rs, ID_Ex_Rt;
  output reg [1:0] upperMux_sel, lowerMux_sel;
  
  always@(EX_MemRegwrite or EX_MemWriteReg or Mem_WbRegwrite or Mem_WbWriteReg or ID_Ex_Rs or ID_Ex_Rt)
    
    begin
      if(EX_MemRegwrite && EX_MemWriteReg!=0)  //forwarding from ALU to ALU
        begin
          if (EX_MemWriteReg==ID_Ex_Rs)
            
            upperMux_sel<=2'b10;
            
          if(EX_MemWriteReg==ID_Ex_Rt)
              
            lowerMux_sel<=2'b10;
        end
      
      else if (Mem_WbRegwrite && Mem_WbWriteReg !=0)   //forwarding from Memory to ALU
        begin
          if (Mem_WbWriteReg==ID_Ex_Rs && EX_MemWriteReg!=ID_Ex_Rs)
            
            upperMux_sel<=2'b01;

            
          if(Mem_WbWriteReg==ID_Ex_Rt && EX_MemWriteReg==ID_Ex_Rt )
          
            lowerMux_sel<=2'b01;

          
        end
      
      else    //No forwarding
        begin
                      upperMux_sel<=2'b00;
                      lowerMux_sel<=2'b00;

          
        end
        
      
      
    end
  
  
  
  
endmodule
