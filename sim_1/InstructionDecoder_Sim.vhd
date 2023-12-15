----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:17:46 PM
-- Design Name: 
-- Module Name: InstructionDecoder_Sim - Behavioral
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

entity InstructionDecoder_Sim is
--  Port ( );
end InstructionDecoder_Sim;

architecture Behavioral of InstructionDecoder_Sim is
COMPONENT InstructionDecoder
   PORT(    X: in std_logic_vector(11 downto 0);
            JUMP_CHECK: in std_logic;
            REG_EN: out std_logic_vector(2 downto 0);
            REG_SEL_0: out std_logic_vector(2 downto 0);
            REG_SEL_1: out std_logic_vector(2 downto 0);
            IM_VALUE: out std_logic_vector(3 downto 0);
            SUB : out std_logic;
            LOAD_SEL : out std_logic;
            JUMP_FLAG : out  std_logic;
            JUMP_TO: out std_logic_vector(2 downto 0));
   END COMPONENT;

   SIGNAL JUMP_CHECK:	STD_LOGIC;
   SIGNAL SUB	:	STD_LOGIC;
   SIGNAL LOAD_SEL	:	STD_LOGIC;
   SIGNAL JUMP_FLAG	:	STD_LOGIC;
   signal JUMP_TO: std_logic_vector(2 downto 0);
   signal REG_EN: std_logic_vector(2 downto 0);
   SIGNAL X	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
   SIGNAL REG_SEL_0	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL REG_SEL_1	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL ZERO	:	STD_LOGIC;
   signal IM_VALUE: std_logic_vector(3 downto 0);
   

BEGIN

   UUT: InstructionDecoder PORT MAP(
		       X=>X,
               JUMP_CHECK=>JUMP_CHECK,
               REG_EN=>REG_EN,
               REG_SEL_0=>REG_SEL_0,
               REG_SEL_1=>REG_SEL_1,
               IM_VALUE=>IM_VALUE,
               SUB=>SUB,
               LOAD_SEL=>LOAD_SEL,
               JUMP_FLAG=>JUMP_FLAG,
               JUMP_TO=>JUMP_TO
   );

PROCESS
   BEGIN
        JUMP_CHECK<='0';
		X <= "101110000000";
		WAIT FOR 100 ns;
		X <= "101100000011";
		WAIT FOR 100 ns;
		X <= "101010000001";
		WAIT FOR 100 ns;
		X <= "011010000000";
		WAIT FOR 100 ns;
		X <= "001111100000";
		WAIT FOR 100 ns;
		X <= "001101010000";
		
		
      WAIT;
   END PROCESS;







end Behavioral;
