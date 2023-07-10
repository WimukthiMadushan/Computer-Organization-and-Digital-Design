----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 01:32:01 PM
-- Design Name: 
-- Module Name: MicroProcesser - Behavioral
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

entity MicroProcesser is
    Port ( Clock : in STD_LOGIC;
           ResPC : in STD_LOGIC;
           OVERFLOW : out STD_LOGIC;
           ZERO : out STD_LOGIC;
           LED : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           Seg_7 : out STD_LOGIC_VECTOR (6 downto 0)
          );
end MicroProcesser;

architecture Behavioral of MicroProcesser is

component Slow_Clk port(
       Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component ProgramCounter port(
          Reset : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (2 downto 0);
          Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_Rom port(
          Mem_sel : in STD_LOGIC_VECTOR (2 downto 0);
          InstBus : out STD_LOGIC_VECTOR (11 downto 0));
end component;   
    
component InstDecoder port(
           Inst : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0) :="000";
           LoadSel : out STD_LOGIC;
           ImmValue : out STD_LOGIC_VECTOR (3 downto 0) :="0000";
           Mux1 : out STD_LOGIC_VECTOR (2 downto 0):="000";
           Mux2 : out STD_LOGIC_VECTOR (2 downto 0):="000";
           AddSubSel : out STD_LOGIC;
           Jump_Flag: out std_logic;
           Jump_Add : out std_logic_vector(2 downto 0));
end component;

component MUX_2_4 port(
           EN : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component MUX_8_4 port (
          EN : in STD_LOGIC_VECTOR (2 downto 0);
          I0 : in STD_LOGIC_VECTOR (3 downto 0);
          I1 : in STD_LOGIC_VECTOR (3 downto 0);
          I2 : in STD_LOGIC_VECTOR (3 downto 0);
          I3 : in STD_LOGIC_VECTOR (3 downto 0);
          I4 : in STD_LOGIC_VECTOR (3 downto 0);
          I5 : in STD_LOGIC_VECTOR (3 downto 0);
          I6 : in STD_LOGIC_VECTOR (3 downto 0);
          I7 : in STD_LOGIC_VECTOR (3 downto 0);
          Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component AdderSubs port(
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : OUT STD_LOGIC_VECTOR (3 downto 0);
           M : IN STD_LOGIC;
           Overflow : OUT STD_LOGIC;
           Zero : OUT STD_LOGIC);
    
end component;

component RCA_3 port(
           A : in STD_LOGIC_VECTOR (2 downto 0);
           S : OUT STD_LOGIC_VECTOR (2 downto 0);
           C_out : out std_logic);
end component;

component MUX_2_3 port(
           EN : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : OUT STD_LOGIC_VECTOR (2 downto 0));
end component;

component LUT_16_7 Port ( 
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;


signal slow_clock : std_logic;

signal Bus_to_PC : std_logic_vector(2 downto 0);
signal Mem_Sel : std_logic_vector(2 downto 0);

signal InstructionBus : std_logic_vector(11 downto 0);

signal Result_2_4_MUX : std_logic_vector(3 downto 0);
signal Bus_Bank : std_logic_vector(2 downto 0);
signal EN_2_4_MUX : std_logic; 
signal AddSubSel : std_logic;
signal Bus_8_4_0,Bus_8_4_1 : std_logic_vector(2 downto 0);
signal I1_2_4_MUX : std_logic_vector(3 downto 0);
signal Jump_Flag : std_logic;
signal Jump_Add : std_logic_vector(2 downto 0);

signal Q_Bank_0,Q_Bank_1,Q_Bank_2,Q_Bank_3,Q_Bank_4,Q_Bank_5,Q_Bank_6,Q_Bank_7 : std_logic_vector(3 downto 0);

signal Result_MUX_8_4_0,Result_MUX_8_4_1 : std_logic_vector(3 downto 0);

signal Result_Add_Subs : std_logic_vector(3 downto 0);

signal Result_3_Adder : std_logic_vector(2 downto 0);
signal Adder_C_out : std_logic;

begin

slow_clock_0 : Slow_Clk port map(
        Clk_in => Clock,
        Clk_out => slow_clock);
        
program_Counter_0 :  ProgramCounter port map(
        Reset => ResPC,
        Clk => slow_clock,
        Input => Bus_to_PC,
        Output => Mem_Sel);
        
Program_Rom_0 : Program_Rom port map(
        Mem_Sel => Mem_Sel,
        InstBus =>InstructionBus);
InstDecoder_0 : InstDecoder port map(
        Inst =>InstructionBus,
        RegCheck => Result_MUX_8_4_0,
        RegEn => Bus_Bank,
        LoadSel => EN_2_4_MUX,
        ImmValue => I1_2_4_MUX,
        Mux1 => Bus_8_4_0,
        Mux2 => Bus_8_4_1,
        AddSubSel => AddSubSel,
        Jump_Flag =>Jump_Flag,
        Jump_Add =>Jump_Add);
        
MUX_2_4_0 : MUX_2_4 port map(
        EN => EN_2_4_MUX,
        I0 => Result_Add_Subs,
        I1 => I1_2_4_MUX,
        Y => Result_2_4_MUX);
        
RegisterBank_0 : RegisterBank port map(
        Clock => slow_clock,
        RegEn => Bus_Bank,
        D_Bank => Result_2_4_MUX,
        Q_Bank_0 => Q_Bank_0,
        Q_Bank_1 => Q_Bank_1,
        Q_Bank_2 => Q_Bank_2,
        Q_Bank_3 => Q_Bank_3,
        Q_Bank_4 => Q_Bank_4,
        Q_Bank_5 => Q_Bank_5,
        Q_Bank_6 => Q_Bank_6,
        Q_Bank_7 => Q_Bank_7);
        
MUX_8_4_0 : MUX_8_4 port map(
        EN => Bus_8_4_0,
        I0 => Q_Bank_0,
        I1 => Q_Bank_1,
        I2 => Q_Bank_2,
        I3 => Q_Bank_3,
        I4 => Q_Bank_4,
        I5 => Q_Bank_5,
        I6 => Q_Bank_6,
        I7 => Q_Bank_7,
        Y  => Result_MUX_8_4_0);
MUX_8_4_1 : MUX_8_4 port map(
        EN => Bus_8_4_1,
        I0 => Q_Bank_0,
        I1 => Q_Bank_1,
        I2 => Q_Bank_2,
        I3 => Q_Bank_3,
        I4 => Q_Bank_4,
        I5 => Q_Bank_5,
        I6 => Q_Bank_6,
        I7 => Q_Bank_7,
        Y  => Result_MUX_8_4_1);
AdderSubs_0 : AdderSubs port map(
        A => Result_MUX_8_4_0,
        B => Result_MUX_8_4_1,
        S => Result_Add_Subs,
        Overflow => OVERFLOW,
        Zero => ZERO,
        M => AddSubSel);
RCA_3_0 : RCA_3 port map(
     A => Mem_Sel,
     S => Result_3_Adder,
     C_out => Adder_C_out);
     
MUX_2_3_0 : MUX_2_3 port map(
    EN => Jump_Flag,
    I0 => Result_3_Adder,
    I1 => Jump_Add,
    Y=> Bus_to_PC);
    
LUT_16_7_0 : LUT_16_7 port map(
    address => Q_Bank_7,
    data => Seg_7);
     
 LED  <= Q_Bank_7;
 
     
end Behavioral;