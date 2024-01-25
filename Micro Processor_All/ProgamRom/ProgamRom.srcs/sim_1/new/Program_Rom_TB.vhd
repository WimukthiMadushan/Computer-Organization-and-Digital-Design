----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 11:27:19 PM
-- Design Name: 
-- Module Name: Program_Rom_TB - Behavioral
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

entity Program_Rom_TB is
--  Port ( );
end Program_Rom_TB;

architecture Behavioral of Program_Rom_TB is

component Program_Rom port(
          Mem_sel : in STD_LOGIC_VECTOR (2 downto 0);
          InstBus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Mem_sel : std_logic_vector(2 downto 0);
signal InstBus : std_logic_vector(11 downto 0);

begin

UUT : Program_Rom port map(
    Mem_sel =>Mem_sel,
    InstBus => InstBus);
    
process
begin
    Mem_sel <= "000";
    wait for 100ns;
    Mem_sel <= "011";
    wait;
 end process;   


end Behavioral;
