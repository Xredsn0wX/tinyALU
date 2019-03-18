----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2019 02:36:53 AM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.Numeric_Std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (9 downto 0));
end ROM;

architecture Behavioral of ROM is
type ROM_Type is array (0 to 41) of STD_LOGIC_VECTOR(9 downto 0);
signal ROMLayout: ROM_Type :=(
0=>  "010000000",-- Clear the Accumulator
1=>  "100001001", -- Load Accumulator, Add 1
2=>  "100001001",-- Load Accumulator, Add 1
3=>  "100001001",-- Load Accumulator, Add 1
4=>  "100001001",-- Load Accumulator, Add 1
5=>  "100001001",-- Load Accumulator, Add 1
6=>  "100001001",-- Load Accumulator, Add 1
7=>  "100010001",-- Load Accumulator, Add 2
8=>  "101000001",-- Load Accumulator, Add 2

9=>  "010000000",-- Clear the Accumulator
10=>  "010000000",-- Clear the Accumulator
11=>  "010000000",-- Clear the Accumulator
12=>  "010000000",-- Clear the Accumulator
13=>  "010000000",-- Clear the Accumulator
14=> "100001001", --load 2 into accumulator
15=> "101111010",--Subtract Accum from 15
16=>  "010000000",-- Clear the Accumulator
17=> "100001001",--load 1 into accumulator
18=> "100101010",--Subtract Accum from 5


19=>  "010000000",-- Clear the Accumulator
20=>  "010000000",-- Clear the Accumulator
21=>  "010000000",-- Clear the Accumulator
22=>  "010000000",-- Clear the Accumulator
23=>  "010111001", -- load 0111 into accumulatoir
24  =>"011010101", -- Xnor'ed to reveal 0010
25 => "011110101",  -- xnored


26=>  "010000000",-- Clear the Accumulator
27=>  "010000000",-- Clear the Accumulator
28=>  "010000000",-- Clear the Accumulator
29=>  "010000000",-- Clear the Accumulator
30=>  "010000000",-- Clear the Accumulator

31=> "101111001", -- Load Accumulator, Add 15
32=> "100011011", -- AND with 0101
33=> "100001011", -- AND with 0001
34=>  "010000000",-- Clear the Accumulator
35=>  "010000000",-- Clear the Accumulator
36=>  "010000000",-- Clear the Accumulator
37=>  "010000000",-- Clear the Accumulator
38=>  "010000000",-- Clear the Accumulator


39=> "101111001", -- Load Accumulator, Add 15
40 => "101001100", -- Or'ed with 1001

41 => "101110100" -- or'ed with 1110





);

begin
    PROCESS (clk, ROMLayout) is
        begin
        if (clk'event and clk = '1') then
            Data_out <= ROMLayout(to_integer(unsigned(Address)));
        end if;
     end PROCESS;
end Behavioral;
