library verilog;
use verilog.vl_types.all;
entity io_out is
    port(
        io_clk          : in     vl_logic;
        write_enable_result: in     vl_logic;
        datain          : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(4 downto 0)
    );
end io_out;
