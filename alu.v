module mipsalu (aluctrl, a, b, aluout, zero); 
     input [3:0] aluctrl; 
     input [31:0] a,b; 
     output reg [31:0] aluout; 
     output zero; 
     assign zero = (aluout==0); //Zero is true if aluout is 0 
     always @* 
     begin 
          case (aluctrl) 
               0: aluout = a & b; 
               1: aluout = a | b; 
               2: aluout = a + b; 
			   4: aluout = b << 16;
               6: aluout = a -b;
               7: aluout = a < b ? 1 : 0; 
               12: aluout = ~(a | b); // result is nor 
               default: aluout = 0;//answer me  
          endcase
     end 

endmodule 