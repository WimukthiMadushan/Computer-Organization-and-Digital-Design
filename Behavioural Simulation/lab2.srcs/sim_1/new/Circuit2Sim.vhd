----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:02:05 AM
-- Design Name: 
-- Module Name: Circuit2Sim - Behavioral
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

entity Circuit2Sim is
--  Port ( );
end Circuit2Sim;

architecture Behavioral of Circuit2Sim is

component Circuit2 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           LD0 : out STD_LOGIC;
           LD1 : out STD_LOGIC;
           LD2 : out STD_LOGIC);
end component;

SIGNAL A,B,C : std_logic;
signal LD0,LD1,LD2 : STD_LOGIC;
     
begin
UUT: Circuit2 port map(
        A => A,
        B => B,
        C => C,
        LD0 => LD0,
        LD1 => LD1,
        LD2 => LD2
);

PROCESS
begin
    A <= '0';
    B <='0';
    C <= '0';
    WAIT FOR 100 ns;
    A <= '0';
    B <='0';
    C <= '1';
    WAIT FOR 100 ns;
    A <= '0';
    B <='1';
    C <= '0';
    WAIT FOR 100 ns;
    A <= '0';
    B <='1';
    C <= '1';
    WAIT FOR 100 ns;
    A <= '1';
    B <='0';
    C <= '0';
    WAIT FOR 100 ns;
    A <= '1';
    B <='0';
    C <= '1';
    WAIT FOR 100 ns;
    A <= '1';
    B <='1';
    C <= '0';
    WAIT FOR 100 ns;
    A <= '1';
    B <='1';
    C <= '1';
    WAIT;
    END PROCESS;
end Behavioral;
