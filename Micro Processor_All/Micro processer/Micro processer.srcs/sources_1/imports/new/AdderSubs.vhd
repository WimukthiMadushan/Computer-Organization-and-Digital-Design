----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 10:21:22 AM
-- Design Name: 
-- Module Name: AdderSubs - Behavioral
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

entity AdderSubs is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : OUT STD_LOGIC_VECTOR (3 downto 0);
           M : IN STD_LOGIC;
           Overflow : OUT STD_LOGIC;
           Zero : OUT STD_LOGIC);
end AdderSubs;

architecture Behavioral of AdderSubs is

component FA port( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           S : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end component;
 
 SIGNAL B0,B1,B2,B3 :STD_LOGIC;
 SIGNAL FA0_C,FA1_C,FA2_C,FA3_C : STD_LOGIC;
 SIGNAL S0,S1,S2,S3 : STD_LOGIC;
    
begin

FA_0 : FA PORT MAP(
    A => A(0),
    B => B0,
    S => S0,
    C_IN => M,
    C_OUT => FA0_C
    );
FA_1 : FA PORT MAP(
     A => A(1),
     B => B1,
     S => S1,
     C_IN => FA0_C,
     C_OUT => FA1_C
        );
FA_2 : FA PORT MAP(
     A => A(2),
     B => B2,
     S => S2,
     C_IN => FA1_C,
     C_OUT => FA2_C
            );
FA_3 : FA PORT MAP(
     A => A(3),
     B => B3,
     S => S3,
     C_IN => FA2_C,
     C_OUT => FA3_C
                );
    
B0 <= B(0) XOR M;
B1 <= B(1) XOR M;
B2 <= B(2) XOR M;
B3 <= B(3) XOR M;

S(0) <= S0;
S(1) <= S1;
S(2) <= S2;
S(3) <= S3;

Overflow <= FA3_C XOR FA2_C;
Zero <= (NOT S0) AND (NOT S1) AND (NOT S2) AND (NOT S3) AND (NOT FA3_C);

end Behavioral;
