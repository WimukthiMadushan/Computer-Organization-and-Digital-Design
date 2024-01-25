----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 05:31:27 PM
-- Design Name: 
-- Module Name: AU_7_Seg - Behavioral
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

entity AU_7_Seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AU_7_Seg;

architecture Behavioral of AU_7_Seg is

component AU  port ( 
           A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end component;

component LUT_16_7 port(
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk port(
           Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
    
signal slow_clock : std_logic; 
signal S_AU : std_logic_vector(3 downto 0); 
   
begin

Slow_Clk_0 : Slow_Clk port map(
        Clk_in => Clk,
        Clk_out => slow_clock);

AU_0 : AU port map(
    A => A,
    Clk => slow_clock,
    RegSel => RegSel,
    S => S_AU,
    Zero => Zero,
    Carry => Carry);
    

LUT_16_7_0 : LUT_16_7 port map(
    address => S_AU,
    data => S_7Seg
    );
    
S_LED <= S_AU; 

end Behavioral;
