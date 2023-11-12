library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity fadder1 is
    port(
        a, b : in  std_logic;
        cin  : in  std_logic;
        s    : out std_logic;
        cout : out std_logic
    );
end fadder1;

architecture adder1bit of fadder1 is
begin   
    s    <= a xor (b xor cin);
    cout <= (a and b) or (cin and (a xor b));
end architecture adder1bit;
