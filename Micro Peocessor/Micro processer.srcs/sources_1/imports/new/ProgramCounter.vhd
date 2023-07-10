----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 11:34:38 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( Reset : in STD_LOGIC := '0';
           Clk : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (2 downto 0):="000";
           Output : out STD_LOGIC_VECTOR (2 downto 0) :="000"
           );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
process (Clk) begin
    if (rising_edge(Clk)) then
       if Reset = '1' then
            Output <= "000";
       else
            Output <= Input;
       end if;
    end if;
end process;

end Behavioral;
