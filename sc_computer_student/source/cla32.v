module cla32 (pc,x1,y);
   input [31:0] pc;
   input [31:0] x1;
   
   output [31:0] y;
   
   assign y = pc + x1;   
   
endmodule 