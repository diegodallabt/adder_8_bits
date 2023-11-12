library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity fadder8 is
    port(
        a    : in  std_logic_vector (7 downto 0);
        b    : in  std_logic_vector (7 downto 0);
        cin  : in  std_logic;
        op   : in  std_logic;
        s    : out std_logic_vector (7 downto 0);
        cout : out std_logic;
        overflow : out std_logic
    );
end fadder8;

architecture adder8bit of fadder8 is
   
component fadder1 is
    port(
        a, b : in  std_logic;
        cin  : in  std_logic;
        s    : out std_logic;
        cout : out std_logic
    );
end component;

component mux_for_ops is
    port(
        b    : in  std_logic_vector (7 downto 0);
        op   : in  std_logic;
        b_sub: out std_logic_vector (7 downto 0)
    );
end component;

    signal carry: std_logic_vector(7 downto 0);
    signal b_sub: std_logic_vector(7 downto 0);
    
begin
	-- SELEÇÃO DE OPERAÇÃO
	mux1 : mux_for_ops port map(b, op, b_sub);

	-- ADD/SUB COM 8 FADDERS DE 1 BIT
	f0 : fadder1 port map(a(0),b_sub(0),cin, s(0),carry(1));
	f1 : fadder1 port map(a(1),b_sub(1),carry(1), s(1),carry(2));
	f2 : fadder1 port map(a(2),b_sub(2),carry(2), s(2),carry(3));
	f3 : fadder1 port map(a(3),b_sub(3),carry(3), s(3),carry(4));
	f4 : fadder1 port map(a(4),b_sub(4),carry(4), s(4),carry(5));
	f5 : fadder1 port map(a(5),b_sub(5),carry(5), s(5),carry(6));
	f6 : fadder1 port map(a(6),b_sub(6),carry(6), s(6),carry(7));
	f7 : fadder1 port map(a(7),b_sub(7),carry(7),s(7),cout);

	-- VERIFICAÇÃO DE OVERFLOW
	overflow <= carry(7) xor carry(6);
end architecture adder8bit;
