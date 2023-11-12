library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fadder8_tb is
end fadder8_tb;

architecture behavior of fadder8_tb is 

   component fadder8
   port(
        a : in  std_logic_vector(7 downto 0);
        b : in  std_logic_vector(7 downto 0);
        cin : in  std_logic;
        op : in  std_logic;
        s : out std_logic_vector(7 downto 0);
        cout : out std_logic;
        overflow : out std_logic
      );
   end component;

   -- ENTRADAS
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal op : std_logic := '0';

   -- SAÍDAS
   signal s : std_logic_vector(7 downto 0);
   signal cout : std_logic;
   signal overflow : std_logic;

   -- DEFINIÇÃO CONSTANTE DO TEMPO DE PARADA
   constant tempo_de_parada : time := 10 ns;

begin
   mt_fadder: fadder8 port map (
          a => a,
          b => b,
          cin => cin,
          op => op,
          s => s,
          cout => cout,
          overflow => overflow
        );

   tb_proc: process
   begin          
      -- 0x00 + 0xFF
      a <= "00000000";
      b <= "11111111";
      cin <= '0';
      op <= '0';
      wait for tempo_de_parada;
      
      -- 0x00 - 0xFF
      a <= "00000000";
      b <= "11111111";
      cin <= '0';
      op <= '1';
      wait for tempo_de_parada;
      
      -- 0xFF + 0x01
      a <= "11111111";
      b <= "00000001";
      cin <= '0';
      op <= '0';
      wait for tempo_de_parada;
      
      -- 0xFF - 0x01
      a <= "11111111";
      b <= "00000001";
      cin <= '0';
      op <= '1';
      wait for tempo_de_parada;
      
      -- 0xFE + 0xFE
      a <= "11111110";
      b <= "11111110";
      cin <= '0';
      op <= '0';
      wait for tempo_de_parada;
      
      -- 0xFF + 0xFF
      a <= "11111111";
      b <= "11111111";
      cin <= '0';
      op <= '0';
      wait for tempo_de_parada;

      -- 0x68 - 0x03
      a <= "01101000";
      b <= "00000011";
      cin <= '0';
      op <= '1';
      wait for tempo_de_parada;
      
      -- 0x68 + 0x03
      a <= "01101000";
      b <= "00000011";
      cin <= '0';
      op <= '0';
      wait for tempo_de_parada;
      wait;
   end process;

end;

