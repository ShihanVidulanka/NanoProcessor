----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:51:46 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
PORT(     Clk	:	IN	STD_LOGIC; 
          Res	:	IN	STD_LOGIC; 
          R0	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R1	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R2	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R3	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R4	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R5	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R6	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R7	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          D	    :	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          X	    :	IN	STD_LOGIC_VECTOR (2 DOWNTO 0));
  
end RegisterBank;

architecture Behavioral of RegisterBank is

COMPONENT Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;


COMPONENT Decoder_3_to_8
    Port (  I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;
SIGNAL Y0,Y1 : std_logic_vector(7 downto 0);
SIGNAL D0 : std_logic_vector(3 downto 0);
begin
Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I => X (2 downto 0),
    EN => '1',
    Y => Y1
);

Reg0 : Reg
port map(
    D => "0000",
    En =>'1' ,
    Clk => Clk,
    Q => R0
);

Reg1 : Reg
port map(
    D => D0,
    En => Y0(1),
    Clk => Clk,
    Q => R1
);
Reg2 : Reg
port map(
    D => D0,
    En => Y0(2),
    Clk => Clk,
    Q => R2);
Reg3 : Reg
port map(
    D => D0,
    En => Y0(3),
    Clk => Clk,
    Q => R3
);

Reg4 : Reg
port map(
    D => D0,
    En => Y0(4),
    Clk => Clk,
    Q => R4
);

Reg5 : Reg
port map(
    D => D0,
    En => Y0(5),
    Clk => Clk,
    Q => R5
);

Reg6 : Reg
port map(
    D => D0,
    En => Y0(6),
    Clk => Clk,
    Q => R6
);

Reg7 : Reg
port map(
    D => D0,
    En => Y0(7),
    Clk => Clk,
    Q => R7
);
D0<= "0000" when(Res='1') else D;
Y0<= "11111111" when (Res='1') else Y1;
end Behavioral;
