----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:56:42 AM
-- Design Name: 
-- Module Name: InstDecoder_TB - Behavioral
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

entity InstDecoder_TB is
--  Port ( );
end InstDecoder_TB;

architecture Behavioral of InstDecoder_TB is

component InstDecoder port(
           Inst : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImmValue : out STD_LOGIC_VECTOR (3 downto 0);
           Mux1 : out STD_LOGIC_VECTOR (2 downto 0);
           Mux2 : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC;
           Jump_Flag: out std_logic;
           Jump_Add : out std_logic_vector(2 downto 0));
end component;

signal Inst: STD_LOGIC_VECTOR (11 downto 0);
signal RegCheck : STD_LOGIC_VECTOR (3 downto 0);
signal RegEn : STD_LOGIC_VECTOR (2 downto 0);
signal LoadSel : STD_LOGIC;
signal ImmValue : STD_LOGIC_VECTOR (3 downto 0);
signal Mux1 : STD_LOGIC_VECTOR (2 downto 0);
signal Mux2 : STD_LOGIC_VECTOR (2 downto 0);
signal AddSubSel : STD_LOGIC;
signal Jump_Flag : STD_LOGIC;
signal Jump_Add : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : InstDecoder port map(
    Inst => Inst,
    RegCheck => RegCheck,
    RegEn =>RegEn,
    LoadSel =>LoadSel,
    ImmValue => ImmValue,
    Mux1 =>Mux1,
    Mux2 =>Mux2,
    AddSubSel => AddSubSel,
    Jump_Flag => Jump_Flag,
    Jump_Add => Jump_Add);
    
process
    begin
        RegCheck <= "0000";
        Inst <= "100010001010"; -- Movi R1, 10
        wait for 50ns;
        
        Inst <= "100100000001"; --Movi R2, 1
        wait for 50ns;
        
        Inst <= "010100000000"; --NEG R2
        wait;
        end process;


end Behavioral;
