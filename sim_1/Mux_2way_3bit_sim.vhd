----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:25:10 PM
-- Design Name: 
-- Module Name: Mux_2way_3bit_sim - Behavioral
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

entity Mux_2way_3bit_sim is
--  Port ( );
end Mux_2way_3bit_sim;
architecture Behavioral of Mux_2way_3bit_sim is
component Mux_2way_3bit
    port(   Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
            JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
            O : out STD_LOGIC_VECTOR (2 downto 0);
            S : in STD_LOGIC);
end component;
signal Adder_3,JUMP_TO : std_logic_vector(2 downto 0);
signal O : std_logic_vector(2 downto 0);
signal S : std_logic;
begin
UUT: Mux_2way_3bit
port map(
            Adder_3(2 downto 0)=>Adder_3(2 downto 0),
            JUMP_TO(2 downto 0)=>JUMP_TO(2 downto 0),
            O(2 downto 0)=> O(2 downto 0),
            S=> S);
process
begin

Adder_3<="001";
JUMP_TO<="100";
S<='0';

WAIT FOR 100ns;
S<='1';
WAIT;
            


end process;
end Behavioral;