----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 11:42:16 AM
-- Design Name: 
-- Module Name: tri_state_buffer_sim - Behavioral
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

entity tri_state_buffer_sim is
--  Port ( );
end tri_state_buffer_sim;

architecture Behavioral of tri_state_buffer_sim is
component tri_state_buffer
port(   IN4 : in STD_LOGIC_VECTOR (3 downto 0);
        OUT4 : out STD_LOGIC_VECTOR (3 downto 0);
        EN4 : in STD_LOGIC);
end component;
signal IN4 : std_logic_vector(3 downto 0);
signal OUT4 : std_logic_vector(3 downto 0);
signal EN4 : std_logic;
begin
UUT: tri_state_buffer
port map( IN4 => IN4,
            OUT4=> OUT4,
            EN4=>EN4);
process
begin

IN4<= "1100";
EN4<='0';

WAIT FOR 100ns;
EN4<='1';
wait;

end process;
end Behavioral;
