module sc_datamem (addr,datain,dataout,we,clock,mem_clk,one,two,hex0,hex1,hex2,hex3,hex4,hex5);
 
   input  [31:0]  addr;
   input  [31:0]  datain;
   input [3:0] one, two;
   output [6:0] hex0, hex1,hex2, hex3, hex4, hex5;
   wire [4:0] result;
   
   input          we, clock,mem_clk;
   output [31:0]  dataout;

   parameter SEG_BIT_NUMBER = 3;

   wire           dmem_clk;    
   wire           write_enable; 
   assign         write_enable = we & ~clock & (addr[7] != 1'b1);
   wire           write_enable_result;
   assign         write_enable_result = we & ~clock & (addr[7] == 1'b1);  
   wire           read_from_reg;
   assign         read_from_reg = (~we || clock) & (addr[7] == 1'b1);
   wire   [31:0]  memout;

   reg read = 0;
   reg read1 = 0;
   reg read2 = 0;
   reg write = 0;
   wire [SEG_BIT_NUMBER:0] one_display_high;
   wire [SEG_BIT_NUMBER:0] one_display_low;
   wire [SEG_BIT_NUMBER:0] two_display_high;
   wire [SEG_BIT_NUMBER:0] two_display_low;
   wire [SEG_BIT_NUMBER:0] result_display_high;
   wire [SEG_BIT_NUMBER:0] result_display_low;

   wire [31:0] read_data;
   
   assign         dmem_clk = mem_clk & ( ~ clock);
   lpm_ram_dq_dram  dram(addr[6:2],dmem_clk,datain,write_enable,memout);

   assign read_data = (addr[4] == 1'b0) ? {28'b0,one} :{28'b0,two};
   // io_switch is(addr,one,two,read_data);

   mux2x32 output_switch(memout,read_data,read_from_reg,dataout);

   io_out io_o(dmem_clk, write_enable_result, datain, result);


   // mux2x5 switch_result(defa, datain, write_enable_result, result);
   
   number_split_4 s(result, result_display_high, result_display_low);

   number_split one_split(one, one_display_high, one_display_low);
   number_split two_split(two, two_display_high, two_display_low);

   sevenseg LED8_one_display_high(one_display_high,hex5);
   sevenseg LED8_one_display_low(one_display_low,hex4);
        
   sevenseg LED8_two_display_high(two_display_high,hex3);
   sevenseg LED8_two_display_low(two_display_low,hex2);

   sevenseg LED8_result_display_high(result_display_high,hex1);
   sevenseg LED8_result_display_low(result_display_low,hex0);

endmodule 

// module io_switch (addr, one, two, dataout);
//    input [31:0] addr;
//    input [3:0] one;
//    input [3:0] two;
//    output [31:0] dataout;

//    assign dataout = (addr[4] == 1'b0) ? {28'b0,one} :{28'b0,two};
// endmodule

module io_out (io_clk, write_enable_result, datain, result);
   input 	[31:0] datain;
	input 			write_enable_result,io_clk;
	output 	[4:0]	result;
	
	reg 	[4:0]	result;
	
	always @ (posedge io_clk)
	begin
		if (write_enable_result == 1)
			begin result <= datain[4:0];  end
	end
endmodule