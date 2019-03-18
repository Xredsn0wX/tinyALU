----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2019 11:39:10 PM
-- Design Name: 
-- Module Name: RippleCarry - Behavioral
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

entity RippleCarry is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SUB : in STD_LOGIC;
           TSUM : out STD_LOGIC_VECTOR (3 downto 0);
           OVERFLOW : out STD_LOGIC);
end RippleCarry;

architecture Behavioral of RippleCarry is
component FullAdder is
Port (A: in STD_LOGIC;
B: in STD_LOGIC;
Cin: in STD_LOGIC;
Cout: out STD_LOGIC;
Sum: out STD_LOGIC);
end component;


signal cout0, cout1, cout2, cout3, othercout2: STD_LOGIC;
signal sigB: STD_LOGIC_VECTOR (3 downto 0);
signal compSum: STD_LOGIC_VECTOR (3 downto 0);
begin


sigB(3) <= SUB xor B(3);
sigB(2) <= SUB xor B(2);
sigB(1) <= SUB xor B(1);
sigB(0) <= SUB xor B(0);


FA0: FullAdder port map(
A => A(0),
B=> sigB(0),
Cin => SUB,
Cout => cout0,
Sum =>compSum(0));
FA1: FullAdder port map(
A => A(1),
B=> sigB(1),
Cin => cout0,
Cout => cout1,
Sum =>compSum(1));
FA2: FullAdder port map(
A => A(2),
B=>sigB(2),
Cin => cout1,
Cout => cout2,
Sum =>compSum(2));
FA3: FullAdder port map(
A => A(3),
B=> sigB(3),
Cin => cout2,
Cout => cout3,
Sum =>compSum(3));

TSUM <= compSum;

OVERFLOW <= cout3 xor cout2;

end Behavioral;
