----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 05/31/2023 11:55:04 PM
-- Design Name: 
-- Module Name: Circuit2 - Behavioral
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

entity Circuit2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           LD0 : out STD_LOGIC;
           LD1 : out STD_LOGIC;
           LD2 : out STD_LOGIC);
end Circuit2;

architecture Behavioral of Circuit2 is

begin

LD0 <= A AND B AND C;
LD1 <= (A AND B AND C) OR (A AND B AND (NOT C)) OR (A AND C AND (NOT B)) OR (B AND C AND (NOT C));
LD2 <= (A AND (NOT B) AND (NOT C)) OR ((NOT A) AND B AND (NOT C)) OR ((NOT A) AND (NOT B) AND C) OR ((NOT A) AND (NOT B) AND (NOT C));  


end Behavioral;
