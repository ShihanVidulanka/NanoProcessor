----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 01:52:36 PM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
  PORT( X: in std_logic_vector(11 downto 0);
        JUMP_CHECK: in std_logic;
        REG_EN: out std_logic_vector(2 downto 0);
        REG_SEL_0: out std_logic_vector(2 downto 0);
        REG_SEL_1: out std_logic_vector(2 downto 0);
        IM_VALUE: out std_logic_vector(3 downto 0);
        SUB : out std_logic;
        LOAD_SEL : out std_logic;
        JUMP_FLAG : out  std_logic;
        JUMP_TO: out std_logic_vector(2 downto 0));
        
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
COMPONENT Decoder_2_to_4
Port (  I : in STD_LOGIC_VECTOR (1 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (3 downto 0));
 END COMPONENT;
 SIGNAL MOV, ADD, NEG, JZR: std_logic;
 signal ZERO : std_logic;
 signal JUMP_FLAG_0 : std_logic;
begin
Decoder_2_to_40 : Decoder_2_to_4
PORT MAP(
I(0) => X(10),
I(1) => X(11),
Y(0) => ADD,
Y(1) => NEG,
Y(2) => MOV,
Y(3) => JZR,
EN => '1'
);
LOAD_SEL <= MOV;
REG_EN <= X(9 downto 7);
IM_VALUE <= X(3 downto 0);
REG_SEL_0 <= X(9 downto 7);
REG_SEL_1 <= X(6 downto 4);
SUB<=NEG;
JUMP_TO<= X(2 downto 0);
ZERO <= JUMP_CHECK;
JUMP_FLAG_0 <= JZR AND ZERO;
JUMP_FLAG<= JUMP_FLAG_0;
end Behavioral;
