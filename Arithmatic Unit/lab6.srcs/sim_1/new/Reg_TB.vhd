----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:46:47 PM
-- Design Name: 
-- Module Name: Reg_TB - Behavioral
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

entity Reg_TB is
--  Port ( );
end Reg_TB;

architecture Behavioral of Reg_TB is

component Reg port(
          D : in STD_LOGIC_VECTOR (3 downto 0);
          Clk : in STD_LOGIC;
          En : in std_logic;
          Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal D, Q : std_logic_vector(3 downto 0);
signal Clk, En : std_logic;
begin
UUT : Reg port map(
    D =>D,
    Clk =>Clk,
    Q => Q,
    En => En);
    
process
    begin 
    for i in 1 to 20 loop
        Clk <= '0';
        wait for 4ns;
        Clk <= '1';
        wait for 4ns;
        end loop;
    end process;
    
process
begin
    En <= '1';
    D <= "0001";
    wait for 50ns;
    D <= "1110";
    wait;
    end process;


end Behavioral;
