----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:51:47 AM
-- Design Name: 
-- Module Name: Register_Bank_TB - Behavioral
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

entity Register_Bank_TB is
--  Port ( );
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is

component RegisterBank port(
           Clock : in STD_LOGIC;
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
end component;
signal  Q_Bank_0,Q_Bank_1,Q_Bank_2,Q_Bank_3,Q_Bank_4,Q_Bank_5,Q_Bank_6,Q_Bank_7 : std_logic_vector(3 downto 0);
signal Clock : std_logic;
signal D_Bank : std_logic_vector(3 downto 0);
signal RegEn : std_logic_vector(2 downto 0);


begin

UUT : RegisterBank port map(
    Clock => Clock,
    RegEn => RegEn,
    D_Bank =>D_Bank,
    Q_Bank_0 => Q_Bank_0,
    Q_Bank_1 => Q_Bank_1,
    Q_Bank_2 => Q_Bank_2,
    Q_Bank_3 => Q_Bank_3,
    Q_Bank_4 => Q_Bank_4,
    Q_Bank_5 => Q_Bank_5,
    Q_Bank_6 => Q_Bank_6,
    Q_Bank_7 => Q_Bank_7);
 
process
    begin
        for i in 1 to 500 loop
        Clock <='0';
        WAIT FOR 1 ns;
        Clock <='1';
        WAIT FOR 1 ns;
        end loop;
        wait;
    end process;
    
    process
    begin
        D_Bank <= "0011";
        RegEn <="001";
        wait for 20ns;
        RegEn <="100";
        wait for 20ns;
        RegEn <= "011";
        wait for 20ns;
        RegEn <= "000";
        
        wait;
        end process;
    
    
    end Behavioral;
