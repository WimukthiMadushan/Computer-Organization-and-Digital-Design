----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 09:53:55 AM
-- Design Name: 
-- Module Name: MicroProcesser_TB - Behavioral
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

entity MicroProcesser_TB is
--  Port ( );
end MicroProcesser_TB;

architecture Behavioral of MicroProcesser_TB is

component MicroProcesser port(
           Clock : in STD_LOGIC;
           ResPC : in STD_LOGIC;
           OVERFLOW : out STD_LOGIC;
           ZERO : out STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           Seg_7 : out std_logic_vector(6 downto 0));
end component;
signal Clock : std_logic:='0';
signal ResPC : std_logic := '0';
signal OVERFLOW, ZERO : std_logic := '0';
signal LED : std_logic_vector(3 downto 0);
signal Seg_7 : std_logic_vector(6 downto 0);

begin

MicroProcesser_0 : MicroProcesser port map(
        Clock => Clock,
        ResPC => ResPC,
        OVERFLOW => OVERFLOW,
        ZERO =>ZERO,
        LED => LED,
        Seg_7 => Seg_7);
process

begin
    Clock<=not(Clock);
    wait for 1ns;
end process;
process
begin

    ResPC <='1';
    wait for 5ns;
    ResPC <= '0';
    wait;
end process;


end Behavioral;
