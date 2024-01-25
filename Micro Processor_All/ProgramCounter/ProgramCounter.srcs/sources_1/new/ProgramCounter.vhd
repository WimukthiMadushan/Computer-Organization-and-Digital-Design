----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 11:34:38 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component D_FF port(
          D : in STD_LOGIC;
          Res : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Q : out STD_LOGIC
          );
end component;

component Slow_Clk port (
           Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
     
signal slow_clock : std_logic;
signal D0,D1,D2 : std_logic;
signal Q: STD_LOGIC_vector(2 downto 0);

begin

slow_clock_0 : Slow_Clk port map(
        Clk_in => Clk,
        Clk_out => slow_clock);

D_FF_0 : D_FF port map(
    D =>D0,
    Res =>Reset,
    Clk =>slow_clock ,
    Q => Q(0)
    );
D_FF_1 : D_FF port map(
     D => D1,
     Res =>Reset ,
     Clk => slow_clock,
     Q => Q(1)
     );
D_FF_2 : D_FF port map(
     D => D2,
     Res => Reset,
     Clk =>slow_clock ,
     Q => Q(2)
     );


D0 <= Input(0);
D1 <= Input(1);
D2 <= Input(2);

Output(0) <= Q(0);
Output(1) <= Q(1);
Output(2) <= Q(2);

    


end Behavioral;
