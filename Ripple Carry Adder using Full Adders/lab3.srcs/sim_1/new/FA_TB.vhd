----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:34:04 AM
-- Design Name: 
-- Module Name: FA_TB - Behavioral
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

entity FA_TB is
--  Port ( );
end FA_TB;

architecture Behavioral of FA_TB is

COMPONENT FA
PORT(A : in STD_LOGIC;
    B : in STD_LOGIC;
    S : out STD_LOGIC;
    C_IN : IN STD_LOGIC;
    C_OUT: OUT STD_LOGIC);
END COMPONENT;

SIGNAL A, B, C_IN : STD_LOGIC;
SIGNAL S,C_OUT : STD_LOGIC;

begin

UUT: FA PORT MAP(
    A=>A,
    B=>B,
    C_IN=>C_IN,
    S => S,
    C_OUT => C_OUT);
PROCESS
BEGIN
    A <= '0';
    B <= '0';
    C_IN <= '0';
    WAIT FOR 100ns;
    A <= '0';
    B <= '0';
    C_IN <= '1';
    WAIT FOR 100ns;
    A <= '0';
    B <= '1';
    C_IN <= '0';
    WAIT FOR 100ns;
    A <= '0';
    B <= '1';
    C_IN <= '1';
    WAIT FOR 100ns;
    A <= '1';
    B <= '0';
    C_IN <= '0';
    WAIT FOR 100ns;
    A <= '1';
    B <= '0';
    C_IN <= '1';
    WAIT FOR 100ns;
    A <= '1';
    B <= '1';
    C_IN <= '0';
    WAIT FOR 100ns;
    A <= '1';
    B <= '1';
    C_IN <= '1';
    WAIT;
    END PROCESS;
    
end Behavioral;
