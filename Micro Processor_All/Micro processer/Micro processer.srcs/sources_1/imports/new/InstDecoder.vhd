----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 08:03:21 AM
-- Design Name: 
-- Module Name: InstDecoder - Behavioral
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

entity InstDecoder is
    Port ( Inst : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0) :="000";
           LoadSel : out STD_LOGIC;
           ImmValue : out STD_LOGIC_VECTOR (3 downto 0) :="0000";
           Mux1 : out STD_LOGIC_VECTOR (2 downto 0):="000";
           Mux2 : out STD_LOGIC_VECTOR (2 downto 0):="000";
           AddSubSel : out STD_LOGIC;
           Jump_Flag: out std_logic;
           Jump_Add : out std_logic_vector(2 downto 0));
end InstDecoder;

architecture Behavioral of InstDecoder is

begin
 
process (Inst, RegCheck)
begin

RegEn <= Inst(9 downto 7);
LoadSel <= '0';
ImmValue <= "0000";
Mux1 <= "000";
Mux2 <= "000";
AddSubSel <= '0';
Jump_Flag <= '0';
Jump_Add <= "000";

if Inst(11 downto 10) ="00" then
    Mux1 <= Inst(9 downto 7);
    Mux2 <= Inst(6 downto 4);
elsif Inst(11 downto 10) = "10" then
    Mux1 <= "000";
    Mux2 <= "000";
    LoadSel <= '1';
    ImmValue <= Inst(3 downto 0);
elsif Inst(11 downto 10) = "01" then
    AddSubSel <='1';
    Mux1 <="000";
    Mux2 <= Inst(9 downto 7);
else
    Mux1 <= Inst(9 downto 7);
    Mux2 <= "000";
    if RegCheck = "0000" then
        Jump_Flag <= '1';
        Jump_Add <= Inst(2 downto 0);
    else 
        Jump_Flag <= '0';
        Jump_Add <= "000";
    end if;
end if;
 end process;   

end Behavioral;

