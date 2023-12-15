----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2018 08:01:58 PM
-- Design Name: 
-- Module Name: Nanoprocessor_Sim - Behavioral
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

entity Nanoprocessor_Sim is
--  Port ( );
end Nanoprocessor_Sim;

architecture Behavioral of Nanoprocessor_Sim is
component Nanoprocessor
    Port (  CLR : in STD_LOGIC;
            Clk : in STD_LOGIC;           
            Z : out STD_LOGIC;
            C : out STD_LOGIC;
            S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
            S_LED : out STD_LOGIC_VECTOR (3 downto 0);
            an : out std_logic_vector(3 downto 0));
            
end component;
signal CLR,clk : std_logic;
signal Z, C : std_logic;
signal S_7seg : std_logic_vector(6 downto 0);
signal S_LED : std_logic_vector(3 downto 0);
signal an : std_logic_vector(3 downto 0);
begin
UUT : Nanoprocessor 
    port map(   CLR=> CLR,
                clk=>clk,
                Z=>Z,
                C=>C,
                S_7seg=> S_7seg,
                S_LED=> S_LED,
                an=>an

    );
process
begin
    CLR<='1';
    clk<='0';
    WAIT FOR 10ns;
    clk<='1';
    WAIT FOR 10ns;
    clk<='0';
    WAIT FOR 10ns;
    clk<='1';
    WAIT FOR 10ns;
    clk<='0';
    WAIT FOR 10ns;
    clk<='1';
    WAIT FOR 10ns;
    CLR<='0';
    for i in 1 to 75 loop
        WAIT FOR 10ns;
        clk<=NOT(clk);
    end loop;
    WAIT FOR 10ns;
    CLR<='1';
    clk<=NOT(clk);
    WAIT FOR 10ns;
    clk<=NOT(clk);
    WAIT FOR 10ns;
    clk<= NOT(clk);
    WAIT FOR 10ns;
    clk<=NOT(clk);
    WAIT FOR 10ns;
    CLR<='0';
    clk<=NOT(clk);
    WAIT FOR 10ns;
    clk<=NOT(clk);
    

WAIT;
   
 
    
end process;
end Behavioral;
