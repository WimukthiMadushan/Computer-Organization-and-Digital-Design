----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 11:23:51 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : OUT STD_LOGIC_VECTOR (2 downto 0);
           C_out : out std_logic);
end RCA_3;

architecture Behavioral of RCA_3 is


COMPONENT HA 
PORT(A : in STD_LOGIC;
    B : in STD_LOGIC;
    S : out STD_LOGIC;
    C : out STD_LOGIC);
END COMPONENT;

signal C0, C1 : std_logic;

begin
HA_0 : HA
    port map (
        A => A(0),
        B => '1',
        S => S(0),
        C => C0);
    
HA_1 : HA
    port map (
        A => A(1),
        B => C0,
        S => S(1),
        C => C1);
        
 HA_2 : HA
    port map (
        A => A(2),
        B => C1,
        S => S(2),
        C => C_out);

end Behavioral;
