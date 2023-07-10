----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 01:28:02 AM
-- Design Name: 
-- Module Name: MUX_8_4_TB - Behavioral
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

entity MUX_8_4_TB is
--  Port ( );
end MUX_8_4_TB;

architecture Behavioral of MUX_8_4_TB is

component MUX_8_4 port (
           EN : in STD_LOGIC_VECTOR (2 downto 0);
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
SIGNAL EN : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL I0,I1,I2,I3,I4,I5,I6,I7,Y : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

UUT: MUX_8_4 port map(
    EN => EN,
    I0 => I0,
    I1 => I1,
    I2 => I2,
    I3 => I3,
    I4 => I4,
    I5 => I5,
    I6 => I6,
    I7 => I7,
    Y =>Y);
    
PROCESS
BEGIN
    I0 <= "0011";
    I1 <= "0001";
    I2 <= "1001";
    I3 <= "1011";
    I4 <= "1111";
    I5 <= "0010";
    I6 <= "0111";
    I7 <= "1011";
    EN <= "000";
    WAIT FOR 20ns;
    EN <= "011";
    wait for 20ns;
    EN <= "001";
    wait for 20ns;
    EN <= "111";
    
    WAIT;
    END PROCESS;


end Behavioral;
