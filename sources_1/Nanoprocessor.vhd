----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 03:11:47 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( CLR : in STD_LOGIC;
           Clk : in STD_LOGIC;           
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           an : out std_logic_vector(3 downto 0));

end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
component Mux_8way_4bit
    port(  A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           E : in STD_LOGIC_VECTOR (3 downto 0);
           F : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           H : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end component;
component Add_Subtract_Unit_4
    port(  A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out std_logic);
end component;
component PC_3
    Port ( Dir : in STD_LOGIC_VECTOR(2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
component Adder_3
    port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           B : in STD_LOGIC_VECTOR(2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(2 downto 0);
           C_out : out STD_LOGIC);
end component;
component Mux_2way_3bit
    port ( Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           O : out std_logic_vector(2 downto 0));
end component;
component Mux_2way_4bit
    port(  A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC);
end component;
component InstructionDecoder
  port( X: in std_logic_vector(11 downto 0);
        JUMP_CHECK: in std_logic;
        REG_EN: out std_logic_vector(2 downto 0);
        REG_SEL_0: out std_logic_vector(2 downto 0);
        REG_SEL_1: out std_logic_vector(2 downto 0);
        IM_VALUE: out std_logic_vector(3 downto 0);
        SUB : out std_logic;
        LOAD_SEL : out std_logic;
        JUMP_FLAG : out  std_logic;
        JUMP_TO: out std_logic_vector(2 downto 0));
end component;
component ProgramRom
    Port ( A  : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end component;
component RegisterBank
    port( Clk	:	IN	STD_LOGIC; 
          Res	:	IN	STD_LOGIC; 
          R0	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R1	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R2	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R3	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R4	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R5	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R6	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R7	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          D	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          X	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0));
end component;
component LUT_16_7
       Port (   address : in STD_LOGIC_VECTOR (3 downto 0);
                data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
signal Slw_Clk,Slw_Clk_NOT : std_logic;           
signal R0,R1,R2,R3,R4,R5,R6,R7 : std_logic_vector(3 downto 0); 
signal REG_BANK_IN,IM_VALUE :std_logic_vector(3 downto 0);
signal REG_SEL_0, REG_SEL_1, REG_EN,JUMP_TO : std_logic_vector(2 downto 0);
signal SUB,Zero,LOAD_SEL,JUMP_FLAG, Adder_C_out,JUMP_CHECK_ZERO: std_logic;
signal ADD_SUB_OUT : std_logic_vector(3 downto 0);
signal X : std_logic_vector(11 downto 0);
signal PC_OUT,PC_IN : std_logic_vector(2 downto 0);
signal A,B : std_logic_vector(3 downto 0);
signal Adder_3_OUT: std_logic_vector(2 downto 0);
begin
Slow_Clk_0: Slow_Clk
    port map(
            Clk_in=>Clk,
            Clk_out => Slw_Clk);
Mux_8way_4bit_0: Mux_8way_4bit
port map(  A=>R0,
           B=>R1,
           C=>R2,
           D=>R3,
           E=>R4,
           F=>R5,
           G=>R6,
           H=>R7,
           O=>A,
           S=> REG_SEL_0);
Mux_8way_4bit_1: Mux_8way_4bit
port map(  A=>R0,
           B=>R1,
           C=>R2,
           D=>R3,
           E=>R4,
           F=>R5,
           G=>R6,
           H=>R7,
           O=>B,
           S=>REG_SEL_1);

RegisterBank_0: RegisterBank
port map( Clk=>Slw_Clk_NOT, 
          Res=>CLR,	 
          R0=>R0,	
          R1=>R1,	 
          R2=>R2,	
          R3=>R3,	
          R4=>R4,	
          R5=>R5,	 
          R6=>R6,	
          R7=>R7,	 
          D=>REG_BANK_IN,	 
          X=>REG_EN);
Add_Subtract_Unit_4_0: Add_Subtract_Unit_4
port map(   A=>B,
            B=>A,
            Sel=>SUB,
            S =>ADD_SUB_OUT,
            C_out=>C,
            Zero => Z);
InstructionDecoder_0 : InstructionDecoder
port map(  X=> X,
           JUMP_CHECK=>JUMP_CHECK_ZERO,
           REG_EN=>REG_EN,
           REG_SEL_0=> REG_SEL_0,
           REG_SEL_1=>REG_SEL_1,
           IM_VALUE=>IM_VALUE,
           SUB => SUB,
           LOAD_SEL=>LOAD_SEL,
           JUMP_FLAG =>JUMP_FLAG,
           JUMP_TO => JUMP_TO);
Mux_2way_3bit_0: Mux_2way_3bit
port map( Adder_3=>Adder_3_OUT,
          JUMP_TO=>JUMP_TO,
          S=> JUMP_FLAG, 
          O=> PC_IN);
Mux_2way_4bit_0 : Mux_2way_4bit
port map(  A=>ADD_SUB_OUT, 
           B=> IM_VALUE, 
           O=> REG_BANK_IN , 
           S=>LOAD_SEL ); 
LUT_16_7_0: LUT_16_7
port map(address => R7,
         data => S_7Seg );                  
ProgramRom_0: ProgramRom
port map(   A =>PC_OUT,
            O => X);   
PC_3_0: PC_3
port map( Dir=> PC_IN,
          Res=>CLR,
          Clk=>Slw_Clk,
          Q=> PC_OUT); 
Adder_3_0 : Adder_3
port map ( A=> PC_OUT, 
           B=> "001", 
           C_in=>'0', 
           S=>Adder_3_OUT, 
           C_out=>Adder_C_out);       

S_LED<= R7;            
JUMP_CHECK_ZERO <= NOT(A(0) OR A(1) OR A(2) OR A(3));         
an <= "1110";
Slw_Clk_NOT <= NOT Slw_Clk;
end Behavioral;
