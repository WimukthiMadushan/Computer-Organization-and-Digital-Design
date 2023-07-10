----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:02:14 PM
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is

component D_FF
port( D : in STD_LOGIC;
      Res : in STD_LOGIC;
      Clk : in STD_LOGIC;
      Q : out STD_LOGIC);
end component;

signal D, Res,Clk : std_logic;
signal Q: std_logic;

begin
UUT :  D_FF port map(
       Clk => Clk,
       D => D,
       Res => Res,
       Q => Q
      );

process
        begin
        for i in 1 to 100 loop
        Clk <='0';
         WAIT FOR 10 ns;
        Clk <='1';
        WAIT FOR 10 ns;
        end loop;
        wait;
end process;

process
begin

    D <= '0';
    wait for 50ns;
    D <= '1';
    wait for 50ns;
    Res <= '1';
    wait for 50ns;
    Res <='0';
    D <= '1';
    wait;
    end process;
    
     
end behavioral;
