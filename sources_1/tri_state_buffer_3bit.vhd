----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:16:02 PM
-- Design Name: 
-- Module Name: tri_state_buffer_3bit - Behavioral
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

entity tri_state_buffer_3bit is

Port (      IN3 : in STD_LOGIC_VECTOR (2 downto 0);
            OUT3 : out STD_LOGIC_VECTOR (2 downto 0);
            EN3 : in STD_LOGIC);
end tri_state_buffer_3bit;

architecture Behavioral of tri_state_buffer_3bit is

begin
OUT3<=IN3 WHEN (EN3='1') else "ZZZ";

end Behavioral;
