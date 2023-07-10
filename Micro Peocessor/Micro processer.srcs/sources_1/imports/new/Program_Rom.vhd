----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:12:58 PM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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

entity Program_Rom is
    Port ( Mem_sel : in STD_LOGIC_VECTOR (2 downto 0);
           InstBus : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal twelveSegment_ROM : rom_type := (
      
      -- "101110001010",--MOVI R7, 10
      -- "100100000001",--MOVI R2, 1 
       --"010100000001",--NEG R2
       --"001110100000",--ADD R7, R2 
       --"111110000111",--JZR R7, 7 
       --"110000000011",--JZR R0, 3 
       --"000000000000",
       --"000000000000"
       
        "101110000001", --Movi R7,1
        "100010000010", --Movi R1,2
        "001110010000", --Add R7,R1
        "100010000011", --Movi R1,3
        "001110010000", --Add R7,R1
        "000000000000",
        "000000000000",
        "000000000000"
      
       
 );                             
begin
InstBus <= twelveSegment_ROM(to_integer(unsigned(Mem_sel)));
        
end Behavioral;
