library verilog;
use verilog.vl_types.all;
entity number_split_4 is
    port(
        number          : in     vl_logic_vector(4 downto 0);
        high            : out    vl_logic_vector(3 downto 0);
        low             : out    vl_logic_vector(3 downto 0)
    );
end number_split_4;
