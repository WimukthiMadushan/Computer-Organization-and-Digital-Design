----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 01:32:58 AM
-- Design Name: 
-- Module Name: MUX_2_3_TB - Behavioral
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

entity MUX_2_3_TB is
--  Port ( );
end MUX_2_3_TB;

architecture Behavioral of MUX_2_3_TB is

COMPONENT MUX_2_3 PORT(
          EN : in STD_LOGIC;
          I0 : in STD_LOGIC_VECTOR (2 downto 0);
          I1 : in STD_LOGIC_VECTOR (2 downto 0);
          Y : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL EN : STD_LOGIC;
SIGNAL I0,I1,Y : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

UUT: MUX_2_3 PORT MAP(
    EN => EN,
    I0 => I0,
    I1 => I1,
    Y => Y);
    
PROCESS
BEGIN
    I0 <= "001";
    I1 <= "110";
    EN <= '1';
    WAIT;
    END PROCESS;


end Behavioral;
