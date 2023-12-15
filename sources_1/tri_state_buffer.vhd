----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 10:11:48 AM
-- Design Name: 
-- Module Name: tri_state_buffer - Behavioral
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

entity tri_state_buffer is
    Port ( IN4 : in STD_LOGIC_VECTOR (3 downto 0);
           OUT4 : out STD_LOGIC_VECTOR (3 downto 0);
           EN4 : in STD_LOGIC);
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

begin
OUT4<=IN4 WHEN (EN4='1') else "ZZZZ";

end Behavioral;
