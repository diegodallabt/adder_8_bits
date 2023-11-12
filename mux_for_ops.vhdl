library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity mux_for_ops is
    port(
        b    : in  std_logic_vector (7 downto 0);
        op   : in  std_logic;
        b_sub: out std_logic_vector (7 downto 0)
    );
end mux_for_ops;

architecture mux_logic of mux_for_ops is
    signal b_not: std_logic_vector(7 downto 0);
begin
    b_not <= not b when op = '1' else b;
    b_sub <= std_logic_vector(unsigned(b_not) + 1) when op = '1' else b;
end architecture mux_logic;
