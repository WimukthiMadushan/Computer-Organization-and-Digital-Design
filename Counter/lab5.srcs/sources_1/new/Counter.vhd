----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 12:08:26 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is

component D_FF port(
           D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC
           );
end component;

component Slow_Clk port(
           Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
 
signal Clock_slow : std_logic;  
SIGNAL D0,D1,D2 : STD_LOGIC;
signal Q0,Q1,Q2 : STD_LOGIC;
 
begin

Slow_Clk_0 : Slow_Clk
port map(
        Clk_in => Clk,
        Clk_out => Clock_slow);
       

D_FF_0 : D_FF
port map(
    D => D0,
    Res => Res,
    Clk => Clock_slow,
    Q => Q0);
  
    
D_FF_1 : D_FF
    port map(
    Res => Res,
    D=> D1,
    Clk => Clk,
    Q => Q1);
             
D_FF_2 : D_FF
        port map(
        Res => Res,
        D => D2,
        Clk => Clk,
        Q => Q2);
           
D0 <= ((not Q2) AND (NOT Dir)) or (Q1 and Dir);
D1<= (Q2 aNd Dir) or (Q0 and (not Dir));
D2 <= (not Q0 and Dir) or (Q1 and (not Dir));

Q(0) <= Q0;
Q(1) <= Q1;
Q(2) <= Q2;


end Behavioral;
