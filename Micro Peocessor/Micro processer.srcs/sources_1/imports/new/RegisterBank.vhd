----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:42:42 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( Clock : in STD_LOGIC;
           RegEn : in STD_LOGIC_vector(2 downto 0);
           D_Bank : in STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q_Bank_7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end RegisterBank;

architecture Behavioral of RegisterBank is

component Reg  port(
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           En : in std_logic;
           Q : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

component Decoder_3_to_8 port (
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Y : std_logic_vector(7 downto 0);

begin


Decoder_3_to_8_0 : Decoder_3_to_8 port map(
        I => RegEn,
        Y => Y
        );


R0 : Reg port map(
      D => "0000",
      Clk => Clock,
      En => '1',
      Q => Q_Bank_0);
      
R1 : Reg port map(
      D => D_Bank,
      Clk => Clock,
      En => Y(1),
      Q => Q_Bank_1); 
R2 : Reg port map(
      D => D_Bank,
      Clk => Clock,
      En => Y(2),
      Q => Q_Bank_2); 
    
R3 : Reg port map(
      D => D_Bank,
      Clk => Clock,
      En => Y(3),
      Q => Q_Bank_3); 
R4 : Reg port map(
       D => D_Bank,
       Clk => Clock,
       En => Y(4),
       Q => Q_Bank_4);  
R5 : Reg port map(
       D => D_Bank,
       Clk => Clock,
       En => Y(5),
       Q => Q_Bank_5);
R6 : Reg port map(
       D => D_Bank,
       Clk => Clock,
       En => Y(6),
       Q => Q_Bank_6);
       
R7 : Reg port map(
       D => D_Bank,
       Clk => Clock,
       En => Y(7),
       Q => Q_Bank_7);

     
end Behavioral;



