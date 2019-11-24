library verilog;
use verilog.vl_types.all;
entity sc_io is
    generic(
        SEG_BIT_NUMBER  : integer := 3
    );
    port(
        one             : in     vl_logic_vector(3 downto 0);
        two             : in     vl_logic_vector(3 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SEG_BIT_NUMBER : constant is 1;
end sc_io;
