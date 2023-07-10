----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 05:18:06 PM
-- Design Name: 
-- Module Name: Decoder_3to_8_TB - Behavioral
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

entity Decoder_3_to_8_TB is
--  Port ( );
end Decoder_3_to_8_TB;

architecture Behavioral of Decoder_3_to_8_TB is
component Decoder_3_to_8
port( EN : in STD_LOGIC;
      I : in STD_LOGIC_VECTOR (2 downto 0);
      Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL EN : STD_LOGIC;
SIGNAL I : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR(7 DOWNTO 0);

   
begin

UUT : Decoder_3_to_8 port map(
    EN => EN,
    I => I,
    Y => Y);
    
PROCESS
BEGIN
    EN <='1';
    I <= "000";
    wait for 100ns;
    I <= "001";
    wait for 100ns;
    I <= "010";
    wait for 100ns;
    I <= "011";
    wait for 100ns;
    I <= "100";
    wait for 100ns;
    I <= "101";
    wait for 100ns;
    I <= "110";
    wait for 100ns;
    I <= "111";
    wait for 100ns;
    EN <='0';
    I <= "000";
    wait for 100ns;
    I <= "001";
    wait for 100ns;
    I <= "010";
    wait for 100ns;
    I <= "011";
    wait for 100ns;
    I <= "100";
    wait for 100ns;
    I <= "101";
    wait for 100ns;
    I <= "110";
    wait for 100ns;
    I <= "111";
    wait;
end process;
end Behavioral;
