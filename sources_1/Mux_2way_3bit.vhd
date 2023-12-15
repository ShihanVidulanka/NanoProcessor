----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:14:52 PM
-- Design Name: 
-- Module Name: Mux_2way_3bit - Behavioral
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

entity Mux_2way_3bit is
    Port ( Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           O : out std_logic_vector(2 downto 0));
end Mux_2way_3bit;

architecture Behavioral of Mux_2way_3bit is
component tri_state_buffer_3bit
    port ( IN3 : in STD_LOGIC_VECTOR (2 downto 0);
           OUT3 : out STD_LOGIC_VECTOR (2 downto 0);
           EN3 : in STD_LOGIC);
end component; 
signal NOTS: std_logic;   
begin
tri_state_buffer_3bit_0 :tri_state_buffer_3bit
port map(   IN3=> Adder_3,
            OUT3 => O,
            EN3=> NOTS);
tri_state_buffer_3bit_1: tri_state_buffer_3bit
port map(   IN3=> JUMP_TO,
            OUT3 =>O,
            EN3=>S);

NOTS <= NOT S;

end Behavioral;
