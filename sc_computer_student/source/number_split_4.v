module number_split_4(number,
               high, low);
    input [4:0] number;
    output [3:0] high, low;
    reg [3:0] high;
    reg [3:0] low;
    
    always@(*)
	    begin
            high = number / 10;
            low = number - number / 10 * 10;
	    end
endmodule