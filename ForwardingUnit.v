module ForwardingUnit (EX_MemRegwrite,EX_MemWriteReg,Mem_WbRegwrite,Mem_WbWriteReg,ID_Ex_Rs,ID_Ex_Rt,upperMux_sel,lowerMux_sel, comparatorMux1Selector,comparatorMux2Selector);
  
  input EX_MemRegwrite, Mem_WbRegwrite;
  input [4:0] EX_MemWriteReg , Mem_WbWriteReg, ID_Ex_Rs, ID_Ex_Rt;
  output reg [1:0] upperMux_sel, lowerMux_sel;
  output reg [1:0] comparatorMux1Selector,comparatorMux2Selector;
  
  always@(EX_MemRegwrite or EX_MemWriteReg or Mem_WbRegwrite or Mem_WbWriteReg or ID_Ex_Rs or ID_Ex_Rt)
    
    begin
      if(EX_MemRegwrite && EX_MemWriteReg)  //forwarding from ALU to ALU & from ALU to ID stage
        begin
          if (EX_MemWriteReg==ID_Ex_Rs)
            begin
            
            upperMux_sel<=2'b10;
            comparatorMux1Selector<=2'b01;
            end
          else //no forwarding
          begin
          upperMux_sel<=2'b00;
          comparatorMux1Selector<=2'b00;
          end
            
          if(EX_MemWriteReg==ID_Ex_Rt)
              begin
            lowerMux_sel<=2'b10;
            comparatorMux2Selector<=2'b01;
              end
          else //no forwarding
          begin
          lowerMux_sel<=2'b00;
          comparatorMux2Selector<=2'b00;
          end
            
        end
      
      else if (Mem_WbRegwrite && Mem_WbWriteReg)   //forwarding from Memorystage to ALU & from Memorystage to ID stage
        begin
          if ((Mem_WbWriteReg==ID_Ex_Rs) && (EX_MemWriteReg!=ID_Ex_Rs))
            begin
            upperMux_sel<=2'b01;
            comparatorMux1Selector<=2'b10;
            end
          else //no forwarding
          begin
          upperMux_sel<=2'b00;
          comparatorMux1Selector<=2'b00;
          end
            

            
          if((Mem_WbWriteReg==ID_Ex_Rt) && (EX_MemWriteReg==ID_Ex_Rt) )
          begin
            lowerMux_sel<=2'b01;
            comparatorMux2Selector<=2'b10;
          end

          else //no forwarding
          begin
          lowerMux_sel<=2'b00;
          comparatorMux2Selector<=2'b00;
          end

          
        end
      
      else    //No forwarding
        begin
                      upperMux_sel<=2'b00;
                      lowerMux_sel<=2'b00;
                      comparatorMux1Selector<=2'b00;
                      comparatorMux2Selector<=2'b00;

          
        end
        
      
      
    end
  
endmodule
