----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 01:35:39 PM
-- Design Name: 
-- Module Name: ProgramRom_Sim - Behavioral
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

entity ProgramRom_Sim is
--  Port ( );
end ProgramRom_Sim;

architecture Behavioral of ProgramRom_Sim is
   COMPONENT ProgramROM
PORT(  A    :    IN    STD_LOGIC_VECTOR (2 DOWNTO 0);
        O    :    OUT    STD_LOGIC_VECTOR (11 DOWNTO 0) 
      );
END COMPONENT;

SIGNAL A    :    STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL O    :    STD_LOGIC_VECTOR (11 DOWNTO 0);


BEGIN

UUT: ProgramROM PORT MAP(
     A(2 DOWNTO 0) => A(2 DOWNTO 0),
     O(11 DOWNTO 0) => O(11 DOWNTO 0)
     
);

PROCESS
BEGIN
     A <= "000";
     WAIT FOR 100 ns;
     A <= "001";
     WAIT FOR 100 ns;
     A <= "010";
     WAIT FOR 100 ns;
     A <= "011";
     WAIT FOR 100 ns;
     A <= "100";
     WAIT FOR 100 ns;
     A <= "101";
     WAIT FOR 100 ns;
     A <= "110";
     WAIT FOR 100 ns;
     A <= "111";
   WAIT; -- will wait forever
END PROCESS;

end Behavioral;
