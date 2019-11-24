/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////
`timescale 1ps/1ps
module sc_computer_top_sim (clock,,one,two,hex0,hex1,hex2,hex3,hex4,hex5);
   reg           clock_50M_sim;
   input clock;
   reg           resetn;
   reg           mem_clk;
   output [6:0] hex0, hex1, hex2, hex3, hex4, hex5;
   input  [3:0] one, two;
   wire   [31:0] data;
   wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   
  sc_computer    sc_computer_instance (one,two,resetn,clock_50M_sim,mem_clk,hex0,hex1,hex2,hex3,hex4,hex5);
	   

     initial
        begin
            clock_50M_sim = 1;
            while (1)
                #2  clock_50M_sim = ~clock_50M_sim;
        end  
	 initial
        begin
            mem_clk = 1;
            while (1)
                #1  mem_clk = ~ mem_clk;
        end


   initial
        begin
            resetn = 0;            // 低电平持续10个时间单位，后一直为1。
            while (1)
                #5 resetn = 1;
        end

endmodule



