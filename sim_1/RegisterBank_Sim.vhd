----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 03:27:17 PM
-- Design Name: 
-- Module Name: RegisterBank_Sim - Behavioral
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


entity RegisterBank_Sim is
--  Port ( );
end RegisterBank_Sim;

architecture Behavioral of RegisterBank_Sim is
COMPONENT RegisterBank
   PORT( Clk	:	IN	STD_LOGIC; 
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
   END COMPONENT;

   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL Res	:	STD_LOGIC;
   SIGNAL R0	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R1	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R2	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R3	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R4	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R5	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R6	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R7	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL D	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL X	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: RegisterBank PORT MAP(
		Clk => Clk, 
		Res => Res, 
		R0 => R0, 
		R1 => R1, 
		R2 => R2, 
		R3 => R3, 
		R4 => R4, 
		R5 => R5, 
		R6 => R6, 
		R7 => R7, 
		D => D, 
		X => X
   );

-- *** Test Bench - User Defined Section ***
PROCESS
BEGIN
		D <= "1010";
		Res <= '0';
		CLK <= '0';
        
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "001";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "010";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "011";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "100";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "101";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "110";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		X <= "111";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		Res<='1';
		D<="0000";
        WAIT FOR 30ns;
        CLK<='0';
        Res<='1';
        WAIT FOR 30ns;
        CLK<='1';
        Res<='0';
        WAIT; 
   END PROCESS;



end Behavioral;
