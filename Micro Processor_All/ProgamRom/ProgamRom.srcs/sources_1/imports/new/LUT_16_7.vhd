----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 04:47:32 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);
    signal sevenSegment_ROM : rom_type := (
                                    "1000000", -- 0
                                    "0110000", --1
                                    "1101101", --2
                                    "1111001", --3
                                    "0110011", --4
                                    "1011011", --5
                                    "1011111", --6
                                    "1110000", --7
                                    "1111111", --8
                                    "1111011", --9
                                    "0001000",--A
                                    "0011111", --B
                                    "0110001", --C
                                    "0111101", --D
                                    "1001111", --E
                                    "1000111" --F
                                    );
                                    
begin

data <= sevenSegment_ROM(to_integer(unsigned(address)));


end Behavioral;
