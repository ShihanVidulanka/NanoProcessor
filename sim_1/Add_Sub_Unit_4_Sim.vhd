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

entity Add_Sub_Unit_4_Sim is
--  Port ( );
end Add_Sub_Unit_4_Sim;

architecture Behavioral of Add_Sub_Unit_4_Sim is
Component Add_subtract_unit_4
    port(
               A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               C_out : out STD_LOGIC;
               Zero: out STD_LOGIC
);
end component;
SIGNAL A,B : std_logic_vector(3 downto 0);
signal Sel : std_logic;
signal C_out,Zero : std_logic;
signal S : std_logic_vector(3 downto 0);
begin
UUT: Add_Subtract_unit_4 PORT MAP(
    A(3 downto 0)=>A(3 downto 0),
    B(3 downto 0)=>B(3 downto 0),
    C_out=>C_out,
    Zero=>Zero,
    Sel => Sel,
    S(3 downto 0)=>S(3 downto 0)
);
process
begin
    A(0)<='0';
    A(1)<='0';
    A(2)<='0';
    A(3)<='0';
    B(0)<='0';    
    B(1)<='0';
    B(2)<='0';
    B(3)<='0';
    Sel <= '0';

    wait for 100ns;   
    B(1)<='1';

  wait for 100ns;
    A(0)<='0';
    A(1)<='0';
    A(2)<='1';
    A(3)<='0';
    B(0)<='1';    
    B(1)<='1';
    B(2)<='1';
    B(3)<='0';
    Sel <= '0';  
  wait for 100ns;
    A(0)<='0';
    A(1)<='1';
    A(2)<='0';
    A(3)<='0';
    B(0)<='1';    
    B(1)<='1';
    B(2)<='0';
    B(3)<='0'; 
    Sel <= '1';
    wait for 100ns;
    A(0)<='0';
    A(1)<='1';
    A(2)<='1';
    A(3)<='1';
    B(0)<='1';    
    B(1)<='1';
    B(2)<='1';
    B(3)<='1';
    Sel <='1';     
    wait;
    
 end process;
end Behavioral;
