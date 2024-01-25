----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:09:44 PM
-- Design Name: 
-- Module Name: Program_Counter_TB - Behavioral
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

entity Program_Counter_TB is
--  Port ( );
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is

component ProgramCounter port(
          Reset : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (2 downto 0);
          Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Reset, Clk : std_logic;
signal Input,Output : std_logic_vector(2 downto 0);

begin 

UUT : ProgramCounter port map(
    Reset => Reset,
    Clk => Clk,
    Input => Input,
    Output => Output);


process
begin 
for i in 1 to 20 loop
    Clk <= '0';
    wait for 2ns;
    Clk <= '1';
    wait for 2ns;
    end loop;
end process;


process
begin
        Reset <= '0';
        wait for 50ns;
        Input <= "010";
        wait for 50ns;
        Reset <= '0';
        wait for 50ns;
        Reset <='1';
        wait for 50ns;
        Input <= "111";
wait;
    end process;
    
    

end Behavioral;

