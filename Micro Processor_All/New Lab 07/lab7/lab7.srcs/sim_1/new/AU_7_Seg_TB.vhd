----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 10:02:27 AM
-- Design Name: 
-- Module Name: AU_7_Seg_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU_7_Seg_TB is
--  Port ( );
end AU_7_Seg_TB;

architecture Behavioral of AU_7_Seg_TB is

component AU_7_Seg port(
          A : in STD_LOGIC_VECTOR (3 downto 0);
          Clk : in STD_LOGIC;
          RegSel : in STD_LOGIC;
          S_LED : out STD_LOGIC_VECTOR (3 downto 0);
          S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
          Carry : out STD_LOGIC;
          Zero : out STD_LOGIC);
end component;

signal A : std_logic_vector(3 downto 0);
signal Clk,RegSel : std_logic := '0';
signal Zero,Carry : std_logic :='0';
signal S_LED : std_logic_vector(3 downto 0); 
signal S_7Seg : std_logic_vector(6 downto 0);

begin

UUT : AU_7_Seg port map(
    A => A,
    Clk => Clk,
    RegSel => RegSel,
    S_LED => S_LED,
    Carry => Carry,
    Zero => Zero,
    S_7Seg => S_7Seg);

process 
begin
    for i in 1 to 200 loop
    Clk <= '0';
    wait for 4ns;
    Clk <= '1';
    wait for 4ns;
    end loop;
end process;

process
begin
    A <= "0000";
    wait for 100ns;
    A <= "0001";
    wait for 100ns;
    RegSel <= '1';
    A <= "0010";
    wait for 100ns;
    RegSel <= '1';
    A <= "0011";
wait;
end process;

end Behavioral;
