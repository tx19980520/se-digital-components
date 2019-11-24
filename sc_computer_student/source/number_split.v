module number_split(number,
               high, low);
    input [3:0] number;
    output [3:0] high, low;
    reg [3:0] high;
    reg [3:0] low;
    
    always@(*)
	    begin
            high = number / 10;
            low = number - high * 10;
	    end
endmodule