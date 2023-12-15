----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 11:07:15 AM
-- Design Name: 
-- Module Name: PC_3_Sim - Behavioral
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

entity PC_3_Sim is
--  Port ( );
end PC_3_Sim;

architecture Behavioral of PC_3_Sim is
COMPONENT PC_3
   PORT( Dir	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          Res	:	IN	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC;
           Q	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;


   SIGNAL Dir	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL Res	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL Q	    :	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: PC_3 PORT MAP(
		Q(2 downto 0) => Q(2 downto 0), 
		Dir(2 downto 0) => Dir(2 downto 0), 
		Res => Res, 
		Clk => Clk
   );
PROCESS
   BEGIN
		Dir <= "001";
		Clk <= '0';
		Res <= '0';
		WAIT FOR 100 ns;
		Clk <= '1';
		WAIT FOR 100 ns;
		Clk <= '0';
		WAIT FOR 100 ns;
        Clk <= '1';
        WAIT FOR 100 ns;
        Clk <= '0';		
        WAIT FOR 100 ns;
        Clk <= '1';
        Res<='1';
        WAIT FOR 100 ns;
        Clk <= '0';
        Res<='0';
      WAIT; 
   END PROCESS;

end Behavioral;
