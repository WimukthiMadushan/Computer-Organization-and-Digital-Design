----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 06:01:21 PM
-- Design Name: 
-- Module Name: MUX_8_TO_1 - Behavioral
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

entity MUX_8_TO_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_8_TO_1;

architecture Behavioral of MUX_8_TO_1 is


COMPONENT Decoder_3_to_8 
port( EN : in STD_LOGIC;
      I : in STD_LOGIC_VECTOR (2 downto 0);
      Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL A: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL T0,T1,T2,T3,T4,T5,T6,T7 : STD_LOGIC;

begin

Decoder_3_to_8_0 : Decoder_3_to_8
PORT MAP(
        EN => EN,
        I(2 DOWNTO 0) => S(2 DOWNTO 0),
        Y(7 DOWNTO 0) => A(7 DOWNTO 0)
        );
T0 <= D(0) AND A(0) AND EN;
T1 <= D(1) AND A(1) AND EN;
T2 <= D(2) AND A(2) AND EN;
T3 <= D(3) AND A(3) AND EN;
T4 <= D(4) AND A(4) AND EN;
T5 <= D(5) AND A(5) AND EN;
T6 <= D(6) AND A(6) AND EN;
T7 <= D(7) AND A(7) AND EN;

Y <= T0 OR T1 OR T2 OR T3 OR T4 OR T5 OR T6 OR T7;

end Behavioral;
