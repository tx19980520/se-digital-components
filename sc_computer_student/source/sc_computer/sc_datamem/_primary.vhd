library verilog;
use verilog.vl_types.all;
entity sc_datamem is
    generic(
        SEG_BIT_NUMBER  : integer := 3
    );
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        datain          : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        we              : in     vl_logic;
        clock           : in     vl_logic;
        mem_clk         : in     vl_logic;
        one             : in     vl_logic_vector(3 downto 0);
        two             : in     vl_logic_vector(3 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SEG_BIT_NUMBER : constant is 1;
end sc_datamem;
