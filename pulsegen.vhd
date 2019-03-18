----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2019 01:20:13 PM
-- Design Name: 
-- Module Name: pulsegen - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulsegen is
    Port ( EN : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulseout : out STD_LOGIC);
end pulsegen;
architecture Behavioral of pulsegen is
signal count: integer:=1;
signal temp : std_logic := '0';
begin

process(clk)
begin

if(clk'event and clk='1') then
count <=count+1;
    if (count = 25000000) then
    temp <= NOT temp;
    count <= 1;
    end if;
end if;
pulseout <= temp;
end process;





end Behavioral;
