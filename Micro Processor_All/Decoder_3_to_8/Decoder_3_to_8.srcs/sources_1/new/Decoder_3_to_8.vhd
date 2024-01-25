----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:14:56 AM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

begin

process(I)
begin
    if I = "000" then
        Y(0) <= '1';
    elsif I = "001" THEN
        Y(1) <= '1';
    elsif I = "010" THEN
        Y(2) <= '1';
    elsif I = "011" THEN
        Y(3) <= '1';
    elsif I = "100" THEN
        Y(4) <= '1';
    elsif I = "101" THEN
        Y(5) <= '1';
    elsif I = "110" THEN
        Y(6) <= '1';
    else
        Y(7) <= '1';
    end if;
end process;

end Behavioral;
