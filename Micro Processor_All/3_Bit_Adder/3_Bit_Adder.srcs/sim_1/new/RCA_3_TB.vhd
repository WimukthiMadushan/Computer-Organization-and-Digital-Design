----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 07:00:40 AM
-- Design Name: 
-- Module Name: RCA_3_TB - Behavioral
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

entity RCA_3_TB is
--  Port ( );
end RCA_3_TB;

architecture Behavioral of RCA_3_TB is

COMPONENT RCA_3 PORT(
          A : in STD_LOGIC_VECTOR (2 downto 0);
          S : OUT STD_LOGIC_VECTOR (2 downto 0);
          C_out : out std_logic); 
END COMPONENT;

signal A,S : std_logic_vector(2 downto 0);
signal C_out : std_logic;

begin
UUT: RCA_3 PORT MAP(
    A => A,
    S => S,
    C_out => C_out);
process
begin
    A <= "000";
    WAIT FOR 100ns;
    A <= "101";
    wait for 100ns;
    A <= "011";
    wait;
    end process;

end Behavioral;
