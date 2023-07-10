----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 09:20:06 AM
-- Design Name: 
-- Module Name: MUX_2_3 - Behavioral
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

entity MUX_2_3 is
    Port ( EN : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : OUT STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_3;

architecture Behavioral of MUX_2_3 is

begin

PROCESS (I0,I1,EN)
BEGIN

    IF EN = '0' THEN
        Y <= I0;
    ELSE
        Y <= I1;
    END IF;
END PROCESS;

end Behavioral;
