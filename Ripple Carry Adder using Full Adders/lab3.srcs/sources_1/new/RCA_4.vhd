----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:57:48 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

COMPONENT FA 
PORT(A : in STD_LOGIC;
    B : in STD_LOGIC;
    C_IN : IN STD_LOGIC;
    S : out STD_LOGIC;
    C_OUT : out STD_LOGIC);
END COMPONENT;

SIGNAL FA0_C, FA1_C , FA2_C: STD_LOGIC;

begin
FA_0 : FA
PORT MAP(
    A => A0,
    B => B0,
    C_IN => '0',
    S => S0,
    C_OUT => FA0_C);
FA_1 : FA
    PORT MAP(
        A => A1,
        B => B1,
        C_IN => FA0_C,
        S => S1,
        C_OUT => FA1_C);
FA_2 : FA
        PORT MAP(
            A => A2,
            B => B2,
            C_IN => FA1_C,
            S => S2,
            C_OUT => FA2_C);
FA_3 : FA
            PORT MAP(
                A => A3,
                B => B3,
                C_IN => FA2_C,
                S => S3,
                C_OUT => C_OUT);

end Behavioral;
