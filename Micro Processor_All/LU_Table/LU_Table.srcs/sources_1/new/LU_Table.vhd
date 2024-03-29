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

entity LU_Table is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LU_Table;

architecture Behavioral of LU_Table is

type rom_type is array (0 to 5) of std_logic_vector(11 downto 0);
    signal twelveSegment_ROM : rom_type := (
     "100010000010", --Movi R1, 10
     "100100000001", -- Movi R2,1
     "010100000000", --NEG R2
     "000010100000", -- ADD R1,R2,
     "110010000101", -- JZR R1,7                                 
     "110000000011" -- JZR R0,3                              );
       );                             
begin

data <= twelveSegment_ROM(to_integer(unsigned(address)));


end Behavioral;
