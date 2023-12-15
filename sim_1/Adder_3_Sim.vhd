----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2018 02:52:31 PM
-- Design Name: 
-- Module Name: Add_Sub_Unit_4_Sim - Behavioral
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

entity Adder_3_Sim is
--  Port ( );
end Adder_3_Sim;

architecture Behavioral of Adder_3_Sim is
Component Adder_3
    port(
               A : in STD_LOGIC_VECTOR (2 downto 0);
               B : in STD_LOGIC_VECTOR (2 downto 0);
               C_in : in std_logic; 
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC
);
end component;
SIGNAL A,B : std_logic_vector(2 downto 0);
signal C_in : std_logic;
signal C_out : std_logic;
signal S : std_logic_vector(2 downto 0);
begin
UUT: Adder_3 PORT MAP(
    A(2 downto 0)=>A(2 downto 0),
    B(2 downto 0)=>B(2 downto 0),
    C_in=>C_in,
    C_out=>C_out,
    S(2 downto 0)=>S(2 downto 0)
);
process
begin
    A<="000";
    B<="000";
    C_in<='0';

    wait for 100ns;   
    A<="010";
    

  wait for 100ns;
    A<="100";
    B<="100"; 
    
    wait;
    
 end process;
end Behavioral;
