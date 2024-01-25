----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 11:23:51 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC;
           S : OUT STD_LOGIC_VECTOR (2 downto 0));
end RCA_3;

architecture Behavioral of RCA_3 is

COMPONENT FA 
PORT(A : in STD_LOGIC;
    B : in STD_LOGIC;
    C_IN : IN STD_LOGIC;
    S : out STD_LOGIC;
    C_OUT : out STD_LOGIC);
END COMPONENT;

signal S0,S1,S2 : STD_LOGIC;
signal FA0_C, FA1_C,FA2_C: STD_LOGIC;



begin
FA_0 : FA
PORT MAP(
    A => A(0),
    B => '1',
    C_IN => '0',
    S => S0,
    C_OUT => FA0_C);
FA_1 : FA
PORT MAP(
     A => A(1),
     B => '0',
     C_IN => FA0_C,
     S => S1,
     C_OUT => FA1_C);
FA_2 : FA
PORT MAP(
     A => A(2),
     B => '0',
     C_IN => FA1_C,
     S => S2,
     C_OUT => FA2_C);
     
 S(0) <= S0;
 S(1) <= S1;
 S(2) <= S2;

end Behavioral;
