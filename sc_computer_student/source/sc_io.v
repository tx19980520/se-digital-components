module sc_io (one,two,hex2,hex3,hex4,hex5);
   
   input [3:0] one,two;
   output [6:0] hex2, hex3, hex4, hex5;

   
   parameter SEG_BIT_NUMBER = 3;

   wire [SEG_BIT_NUMBER:0] one_display_high;
   wire [SEG_BIT_NUMBER:0] one_display_low;
   wire [SEG_BIT_NUMBER:0] two_display_high;
   wire [SEG_BIT_NUMBER:0] two_display_low;



   number_split one_split(one, one_display_high, one_display_low);
   number_split two_split(two, two_display_high, two_display_low);

   

   sevenseg LED8_one_display_high(one_display_high,hex5);
   sevenseg LED8_one_display_low(one_display_low,hex4);
        
   sevenseg LED8_two_display_high(two_display_high,hex3);
   sevenseg LED8_two_display_low(two_display_low,hex2);

endmodule
