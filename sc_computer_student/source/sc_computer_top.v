/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////
module sc_computer_top (clock,one,two,hex0,hex1,hex2,hex3,hex4,hex5);
   input clock;
   reg           clock_50M_sim;
   reg           resetn;
   reg           cpuclk;
   input  [3:0] one, two;
   output [6:0] hex0, hex1, hex2, hex3, hex4, hex5;
   wire   [31:0] data;
   wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   

    initial
        begin
            cpuclk = 1;
        end
    always@(posedge clock) begin
        cpuclk = ~cpuclk;
    end

    initial
        begin
            resetn = 1;
        end


  sc_computer    sc_computer_instance (one,two,resetn,cpuclk,clock,hex0,hex1,hex2,hex3,hex4,hex5);

endmodule



