----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 04:53:13 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4_TB - Behavioral
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

entity Decoder_2_to_4_TB is
--  Port ( );
end Decoder_2_to_4_TB;

architecture Behavioral of Decoder_2_to_4_TB is

component Decoder_2_to_4 
port( EN : in STD_LOGIC;
      I : in STD_LOGIC_VECTOR (1 downto 0);
      Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

 SIGNAL I0,I1,EN : STD_LOGIC;
 SIGNAL Y0,Y1,Y2,Y3 : STD_LOGIC; 

begin

UUT : Decoder_2_to_4
port map(EN => EN,
        I(0) =>I0,
        I(1) => I1,
        Y(0) => Y0,
        Y(1) => Y1,
        Y(2) => Y2,
        Y(3)=> Y3);
        
PROCESS
BEGIN
    EN <= '0';
    I0 <= '0';
    I1 <= '0';
    WAIT FOR 100 ns;
    EN <= '0';
    I0 <= '0';
    I1 <= '1';
    WAIT FOR 100 ns;
    EN <= '0';
    I0 <= '1';
    I1 <= '0';
    WAIT FOR 100 ns;
    EN <= '0';
    I0 <= '1';
    I1 <= '1';
    WAIT FOR 100 ns;
    EN <= '1';
    I0 <= '0';
    I1 <= '0';
    WAIT FOR 100 ns;
    EN <= '1';
    I0 <= '0';
    I1 <= '1';
    WAIT FOR 100 ns;
    EN <= '1';
    I0 <= '1';
    I1 <= '0';
    WAIT FOR 100 ns;
    EN <= '1';
    I0 <= '1';
    I1 <= '1';
    WAIT;
end process;
    
    
end Behavioral;
