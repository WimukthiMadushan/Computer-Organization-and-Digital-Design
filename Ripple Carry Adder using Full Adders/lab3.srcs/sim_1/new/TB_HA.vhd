----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 07:19:26 AM
-- Design Name: 
-- Module Name: TB_HA - Behavioral
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

entity TB_HA is
--  Port ( );
end TB_HA;

architecture Behavioral of TB_HA  is

component HA 
    port( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end component;

SIGNAL A,B : STD_LOGIC;
SIGNAL S,C : STD_LOGIC;


begin

UUT : HA PORT MAP(
    A => A,
    B => B,
    C => C,
    S => S);
    
PROCESS
BEGIN
    A <= '0';
    B <= '0';
    WAIT FOR 100ns;
    A <= '0';
    B <= '1';
    WAIT FOR 100ns;
    A <= '1';
    B <= '0';
    WAIT FOR 100ns;
    A <= '1';
    B <= '1';
    WAIT;
    end process;
    
end Behavioral;
