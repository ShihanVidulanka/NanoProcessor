----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 11:02:17 AM
-- Design Name: 
-- Module Name: Mux_8way_4bit_Sim - Behavioral
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

entity Mux_8way_4bit_Sim is
--  Port ( );
end Mux_8way_4bit_Sim;

architecture Behavioral of Mux_8way_4bit_Sim is
component Mux_8way_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           E : in STD_LOGIC_VECTOR (3 downto 0);
           F : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           H : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end component;
signal A,B,C,D,E,F,G,H : std_logic_vector(3 downto 0);
signal O: std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);

begin
UUT : Mux_8way_4bit
port map(   A(3 downto 0)=> A(3 downto 0),
            B(3 downto 0)=> B(3 downto 0),
            C(3 downto 0)=> C(3 downto 0),
            D(3 downto 0)=> D(3 downto 0),
            E(3 downto 0)=> E(3 downto 0),
            F(3 downto 0)=> F(3 downto 0),
            G(3 downto 0)=> G(3 downto 0),
            H(3 downto 0)=> H(3 downto 0),
            O(3 downto 0)=> O(3 downto 0),
            S(2 downto 0)=> S(2 downto 0));

process 
begin

A<="0001";
B<="0010";
C<="0011";
D<="0100";
E<="0101";
F<="0110";
G<="0111";
H<="1000";
S<="000";
WAIT FOR 100ns;

S<="001";

WAIT FOR 100ns;
S<="010";
WAIT FOR 100ns;
S<="011";
WAIT FOR 100ns;
S<="100";
WAIT FOR 100ns;
S<="101";
WAIT FOR 100ns;
S<="110";
WAIT FOR 100ns;
S<="111";
WAIT;

end process;
end Behavioral;
