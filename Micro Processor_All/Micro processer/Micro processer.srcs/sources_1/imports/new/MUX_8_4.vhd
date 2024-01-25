----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 09:36:43 AM
-- Design Name: 
-- Module Name: MUX_8_4 - Behavioral
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

entity MUX_8_4 is
    Port ( EN : in STD_LOGIC_VECTOR (2 downto 0);
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_4;

architecture Behavioral of MUX_8_4 is

begin

process (EN,I0,I1,I2,I3,I4,I5,I6,I7)
begin
    IF EN = "000" THEN
        Y <= I0;
    ELSIF EN = "001" THEN
        Y <=I1;
    ELSIF EN = "010" THEN
        Y <=I2;
    ELSIF EN = "011" THEN
        Y <=I3;
    ELSIF EN = "100" THEN
        Y <=I4;
    ELSIF EN = "101" THEN
        Y <=I5;
    ELSIF EN = "110" THEN
        Y <= I6;
    ELSE
        Y <= I7;
    END IF;
end process;

end Behavioral;
