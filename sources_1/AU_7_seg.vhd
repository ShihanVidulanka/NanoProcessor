----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 02:46:01 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
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

entity AU_7_seg is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_Vector(3 downto 0);
           S_7Seg : out STD_LOGIC_vector(6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC;
           an : out std_logic_vector(3 downto 0));
end AU_7_seg;

architecture Behavioral of AU_7_seg is
COMPONENT AU 
        port(
             A : in STD_LOGIC_VECTOR (3 downto 0);
                   RegSel : in STD_LOGIC;
                   Clk : in STD_LOGIC;
                   S : out STD_LOGIC_VECTOR (3 downto 0);
                   Zero : out STD_LOGIC;
                   Carry : out STD_LOGIC
                   );   
end component;
component LUT_16_7
       Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
SIGNAL S_LED_0: std_logic_vector (3 downto 0);
begin
AU_0 : AU
    port map(
       A => A,
       RegSel => RegSel,
       Clk => Clk,
       S => S_LED_0,
       Zero => Zero,
       Carry => Carry );
LUT_16_7_0: LUT_16_7
    port map(
            address => S_LED_0,
            data => S_7Seg );
S_LED <= S_LED_0;
an <= "1110";
end Behavioral;
