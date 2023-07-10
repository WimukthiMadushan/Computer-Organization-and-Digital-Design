----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 09:40:06 PM
-- Design Name: 
-- Module Name: MUX_8_TO_1_TB - Behavioral
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

entity MUX_8_TO_1_TB is
--  Port ( );
end MUX_8_TO_1_TB;

architecture Behavioral of MUX_8_TO_1_TB is

COMPONENT MUX_8_TO_1 PORT(
           S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
END COMPONENT;  

SIGNAL s : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL d : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL en : STD_LOGIC;
SIGNAL Y : STD_LOGIC; 

begin

UUT: MUX_8_TO_1 PORT MAP(
    S => s( 2 downto 0),
    D => d(7 downto 0 ),
    EN => en,
    Y => Y);
   
process
begin 
   en <= '1';
   D <= "00000001";
   s <= "000";
   wait for 100ns;
   D <= "00000010";
   s <= "001";
   wait for 100ns;
   D <= "00000100";
   s <= "010";
   wait for 100ns;
   D <= "00001000";
   s <= "011";
   wait for 100ns;
   D <= "00010000";
   s <= "100";
   wait for 100ns;
   D <= "00100000";
   s <= "101";
   wait for 100ns;
   D <= "01000000";
   s <= "110";
   wait for 100ns;
   D <= "10000000";
   s <= "111";
   wait for 100ns;
   en <= '0';
   D <= "00000001";
   s <= "001";
   wait for 100ns;
   D <= "00000010";
   s <= "001";
   wait for 100ns;
   D <= "00000100";
   s <= "010";
   wait for 100ns;
   D <= "00001000";
   s <= "011";
   wait for 100ns;
   D <= "00010000";
   s <= "100";
   wait for 100ns;
   D <= "00100000";
   s <= "101";
   wait for 100ns;
   D <= "01000000";
   s <= "110";
   wait for 100ns;
   D <= "10000000";
   s <= "111";
   wait;
   end process;

end Behavioral;
