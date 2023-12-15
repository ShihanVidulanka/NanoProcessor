----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2018 02:17:41 PM
-- Design Name: 
-- Module Name: 4-bit_Add_Subtract_Unit - Behavioral
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

entity Add_Subtract_Unit_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; 
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out std_logic);
end Add_Subtract_Unit_4;

architecture Behavioral of Add_Subtract_Unit_4 is
component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_in: in std_logic;
 S: out std_logic;
 C_out: out std_logic);
 end component;

 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C: std_logic;
 SIGNAL B_2 : std_logic_vector(3 downto 0);
 signal S_0: std_logic_vector(3 downto 0);
 signal C : std_logic;
begin
    FA_0 : FA
        port map (
                A => A(0),
                B => B_2(0) ,
                C_in => Sel,
                S => S_0(0),
                C_Out => FA0_C);
    FA_1 : FA
        port map (
                A => A(1),
                B => B_2(1),
                C_in => FA0_C,
                S => S_0(1),
                C_Out => FA1_C);
    FA_2 : FA
        port map (
                A => A(2),
                B => B_2(2),
                C_in => FA1_C,
                S => S_0(2),
                C_Out => FA2_C);
    FA_3 : FA
         port map (
                A => A(3),
                B => B_2(3),
                C_in => FA2_C,
                S => S_0(3),
                C_Out => C);
                
B_2(0) <= Sel XOR B(0);
B_2(1) <= Sel XOR B(1);
B_2(2) <= Sel XOR B(2);
B_2(3) <= Sel XOR B(3);
C_out <= C;
S<= S_0;
Zero<= NOT(S_0(0) OR S_0(1) OR S_0(2) OR S_0(2) OR S_0(3) OR C);

end Behavioral;
