----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2019 10:40:10 PM
-- Design Name: 
-- Module Name: SubtractCheck - Behavioral
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

entity SubtractCheck is
    Port ( B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub : in STD_LOGIC;
           BSub : out STD_LOGIC_VECTOR (3 downto 0));
end SubtractCheck;

architecture Behavioral of SubtractCheck is

begin
BSub(3) <= B(3) xor Sub;
BSub(2) <= B(2) xor Sub;
BSub(1) <= B(1) xor Sub;
BSub(0) <= B(0) xor Sub;

end Behavioral;
