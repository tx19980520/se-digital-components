/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

module sc_computer (one,
                    two,
                    resetn,
                    clock,
                    mem_clk,
                    hex0,
                    hex1,
                    hex2,
                    hex3,
                    hex4,
                    hex5);
    
    input resetn,clock,mem_clk;
    input [3:0] one,two;
    wire [31:0] pc,inst,aluout,memout;
    wire        imem_clk,dmem_clk;
    output [6:0] hex0, hex1, hex2, hex3, hex4, hex5;
    
    wire   [31:0] data;
    wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
    
    sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);          // CPU module.
    sc_instmem  imem (pc,inst,clock,mem_clk);                  // instruction memory.
    sc_datamem  dmem (
    .addr(aluout),.datain(data),.dataout(memout),.we(wmem),.clock(clock),.mem_clk(mem_clk),.one(one),.two(two),.hex0(hex0),.hex1(hex1),.hex2(hex2),.hex3(hex3),.hex4(hex4),.hex5(hex5)); // data memory.
    
endmodule
    
    
    
