----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/11/2018 03:07:51 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity PC_3 is
    Port ( Dir : in STD_LOGIC_VECTOR(2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end PC_3;

architecture Behavioral of PC_3 is
 component D_FF
port (
    D : in STD_LOGIC;
    Res: in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC);
end component;

begin


D_FF0 : D_FF
port map (
D => Dir(0),
Res => Res,
Clk => Clk,
Q => Q(0));
D_FF1 : D_FF
port map (  
D => Dir(1),
Res => Res,
Clk => Clk,
Q => Q(1)
); 
D_FF2 : D_FF
port map (
D => Dir(2),
Res => Res,
Clk => Clk,
Q => Q(2)
);



end Behavioral;

