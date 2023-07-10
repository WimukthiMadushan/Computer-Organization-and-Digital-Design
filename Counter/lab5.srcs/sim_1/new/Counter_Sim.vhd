----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 09:13:41 AM
-- Design Name: 
-- Module Name: Counter_Sim - Behavioral
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

entity Counter_Sim is
--  Port ( );
end Counter_Sim;

architecture Behavioral of Counter_Sim is

component Counter port(
           Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
    
signal Dir, Res, Clk : std_logic;
signal Q : std_logic_vector(2 downto 0);

begin

UUT : Counter port map(
        Dir => Dir,
        Res => Res,
        Clk => Clk,
        Q => Q);

process 
begin
    Dir <= '0';
    Res <= '1';
    for i in 1 to 20 loop
    Clk <= '0';
    wait for 2ns;
    Clk <= '1';
    wait for 2ns;
    end loop;
    
    wait for 20ns;
    
    Res <= '0';
    for i in 1 to 100 loop
    Clk <= '0';
    wait for 2ns;
    Clk <= '1';
    wait for 2ns;
    end loop;
    Dir <='1';
    wait for 50ns;
    for i in 1 to 200 loop
    Clk <= '0';
    WAIT FOR 2 ns;
    Clk <= '1';
    WAIT FOR 2 ns;
    end loop;
    wait;   
end process;


end Behavioral;
