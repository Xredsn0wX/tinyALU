----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2019 04:01:31 AM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture Behavioral of counter is
signal qint: STD_LOGIC_VECTOR (7 downto 0);
begin
	process(CLK)
	begin
		if (rising_edge(clk)) then
			if (clr = '1') then
				qint <= (others => '0');
				count <= qint;
			elsif (EN ='1') then
					qint <= std_logic_vector(unsigned(qint) + 1);
					count <= qint;
			end if;


		end if;
	end process;
	

end Behavioral;
