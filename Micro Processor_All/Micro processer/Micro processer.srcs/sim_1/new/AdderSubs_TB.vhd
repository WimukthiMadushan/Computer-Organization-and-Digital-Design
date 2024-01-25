----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 07:30:35 AM
-- Design Name: 
-- Module Name: AdderSubs_TB - Behavioral
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

entity AdderSubs_TB is
--  Port ( );
end AdderSubs_TB;

architecture Behavioral of AdderSubs_TB is

component AdderSubs port(
          A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          S : OUT STD_LOGIC_VECTOR (3 downto 0);
          M : IN STD_LOGIC;
          Overflow : OUT STD_LOGIC;
          Zero : OUT STD_LOGIC);
end component;

signal A,B : std_logic_vector(3 downto 0);
signal S : std_logic_vector(3 downto 0);
signal M, Overflow, Zero : std_logic;

begin

UUT : AdderSubs port map(
        A => A,
        B =>B,
        S => S,
        M =>M,
        Overflow => Overflow,
        Zero => Zero);
        
process
begin
    M <= '0';
    A <= "0010";
    B <= "1000";
    WAIT FOR 100ns;
    M <= '1';
    A <= "1111";
    B <= "1011";
    wait;
    end process;
     


end Behavioral;
