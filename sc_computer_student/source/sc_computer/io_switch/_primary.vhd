library verilog;
use verilog.vl_types.all;
entity io_switch is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        one             : in     vl_logic_vector(3 downto 0);
        two             : in     vl_logic_vector(3 downto 0);
        read_data       : out    vl_logic
    );
end io_switch;
