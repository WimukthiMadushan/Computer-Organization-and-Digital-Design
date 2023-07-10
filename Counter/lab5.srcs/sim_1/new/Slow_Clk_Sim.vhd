----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:30:53 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is

component Slow_Clk port(
           Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal clk_in : std_logic;
signal clk_out : std_logic;
  
begin
UUT : Slow_Clk port map(
        Clk_in => clk_in,
        Clk_out => clk_out);

process
begin
    for i in 1 to 100 loop
        Clk_in <= '0';
        wait for 10ns;
        Clk_in <= '1';
        wait for 10ns;
    end loop;
    wait;
end process;
end Behavioral;
